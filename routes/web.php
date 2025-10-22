<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Artisan;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\FrontendController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\MessageController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\WishlistController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductReviewController;
use App\Http\Controllers\PostCommentController;
use App\Http\Controllers\CouponController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\HomeController;
use UniSharp\LaravelFilemanager\Lfm;
use App\Http\Controllers\ReportsController;
use App\Http\Controllers\ReportCommentsController;

// CACHE CLEAR ROUTE
Route::get('cache-clear', function () {
	Artisan::call('optimize:clear');
	request()->session()->flash('success', 'Successfully cache cleared.');
	return redirect()->back();
})->name('cache.clear');

// STORAGE LINKED ROUTE
Route::get('storage-link', [AdminController::class, 'storageLink'])->name('storage.link');

Auth::routes(['register' => false]);

Route::get('user/login', [FrontendController::class, 'login'])->name('login.form');
Route::post('user/login', [FrontendController::class, 'loginSubmit'])->name('login.submit');
Route::get('user/logout', [FrontendController::class, 'logout'])->name('user.logout');

Route::get('user/register', [FrontendController::class, 'register'])->name('register.form');
Route::post('user/register', [FrontendController::class, 'registerSubmit'])->name('register.submit');

// Reset password (renamed to avoid conflict with built-in Auth route)
// Route::post('password-reset', [FrontendController::class, 'showResetForm'])
//     ->name('frontend.password.reset')
//     ->name('password.reset.custom'); // legacy alias
Route::post('password-reset', [FrontendController::class, 'showResetForm'])->name('frontend.password.reset');

// Socialite
Route::get('login/{provider}/', [LoginController::class, 'redirect'])->name('login.redirect');
Route::get('login/{provider}/callback/', [LoginController::class, 'Callback'])->name('login.callback');

Route::get('/', [FrontendController::class, 'home'])->name('home');
Route::get('/dome', [FrontendController::class, 'dome'])->name('dome');

// Frontend Routes
Route::get('/home', [FrontendController::class, 'index']);
Route::get('/about-us', [FrontendController::class, 'aboutUs'])->name('about-us');
Route::get('/post-rules', [FrontendController::class, 'postRules'])->name('post-rules');
Route::get('/contact', [FrontendController::class, 'contact'])->name('contact');
Route::post('/contact/message', [MessageController::class, 'store'])->name('contact.store');
Route::get('product-detail/{slug}', [FrontendController::class, 'productDetail'])->name('product-detail');
Route::post('/product/search', [FrontendController::class, 'productSearch'])->name('product.search');
Route::get('/product-cat/{slug}', [FrontendController::class, 'productCat'])->name('product-cat');
Route::get('/product-sub-cat/{slug}/{sub_slug}', [FrontendController::class, 'productSubCat'])->name('product-sub-cat');

// Cart section
Route::get('/add-to-cart/{slug}', [CartController::class, 'addToCart'])->name('add-to-cart')->middleware('user');
Route::post('/add-to-cart', [CartController::class, 'singleAddToCart'])->name('single-add-to-cart')->middleware('user');
Route::get('cart-delete/{id}', [CartController::class, 'cartDelete'])->name('cart-delete');
Route::post('cart-update', [CartController::class, 'cartUpdate'])->name('cart.update');

Route::get('/cart', fn() => view('frontend.pages.cart'))->name('cart');
Route::get('/checkout', [CartController::class, 'checkout'])->name('checkout')->middleware('user');

// Wishlist
Route::get('/wishlist', fn() => view('frontend.pages.wishlist'))->name('wishlist');
Route::get('/wishlist/{slug}', [WishlistController::class, 'wishlist'])->name('add-to-wishlist')->middleware('user');
Route::get('wishlist-delete/{id}', [WishlistController::class, 'wishlistDelete'])->name('wishlist-delete');
Route::post('cart/order', [OrderController::class, 'store'])->name('cart.order');
Route::get('order/pdf/{id}', [OrderController::class, 'pdf'])->name('order.pdf');
Route::get('/income', [OrderController::class, 'incomeChart'])->name('product.order.income');

Route::get('/product-grids', [FrontendController::class, 'productGrids'])->name('product-grids');
Route::get('/product-lists', [FrontendController::class, 'productLists'])->name('product-lists');
Route::match(['get', 'post'], '/filter', [FrontendController::class, 'productFilter'])->name('shop.filter');

// Order Track
Route::get('/product/track', [OrderController::class, 'orderTrack'])->name('order.track');
Route::post('product/track/order', [OrderController::class, 'productTrackOrder'])->name('product.track.order');

// Blog
Route::get('/blog', [FrontendController::class, 'blog'])->name('blog');
Route::get('/blog-detail/{slug}', [FrontendController::class, 'blogDetail'])->name('blog.detail');
Route::get('/blog/search', [FrontendController::class, 'blogSearch'])->name('blog.search');
Route::post('/blog/filter', [FrontendController::class, 'blogFilter'])->name('blog.filter');
Route::get('blog-cat/{slug}', [FrontendController::class, 'blogByCategory'])->name('blog.category');
Route::get('blog-tag/{slug}', [FrontendController::class, 'blogByTag'])->name('blog.tag');

// NewsLetter
Route::post('/subscribe', [FrontendController::class, 'subscribe'])->name('subscribe');
Route::get('/payy', [FrontendController::class, 'Payy'])->name('payy');

// Product Review
// Route::resource('/review', ProductReviewController::class);
// Route::post('product/{slug}/review', [ProductReviewController::class, 'store'])
//     ->name('product.review.store')
//     ->name('review.store.custom'); // legacy alias
Route::resource('/review', 'ProductReviewController');
Route::post('product/{slug}/review', [ProductReviewController::class, 'store'])->name('product.review.store');

// Post Comment
Route::post('post/{slug}/comment', [PostCommentController::class, 'store'])->name('post-comment.store');
Route::resource('/comment', PostCommentController::class);

// Coupon
Route::post('/coupon-store', [CouponController::class, 'couponStore'])
	->name('coupon.store.custom')
	->name('coupon-store');

// Payment
// Route::get('payment', [PayPalController::class, 'payment'])->name('payment');
// Route::get('cancel', [PayPalController::class, 'cancel'])->name('payment.cancel');
// Route::get('payment/success', [PayPalController::class, 'success'])->name('payment.success');

// Backend section start
Route::group(['prefix' => '/admin', 'middleware' => ['auth', 'admin']], function () {
	Route::get('/', [AdminController::class, 'index'])->name('admin');
	Route::get('/file-manager', fn() => view('backend.layouts.file-manager'))->name('file-manager');
	Route::resource('users', 'UsersController');
	Route::get('/profile', [AdminController::class, 'profile'])->name('admin-profile');
	Route::post('/profile/{id}', [AdminController::class, 'profileUpdate'])->name('profile-update');
	Route::resource('/category', 'CategoryController');
	Route::resource('/product', 'ProductController');
	Route::post('/category/{id}/child', 'CategoryController@getChildByParent');
	Route::resource('/post-category', 'PostCategoryController');
	Route::resource('/post-tag', 'PostTagController');
	Route::resource('/post', 'PostController');
	Route::resource('/message', 'MessageController');
	Route::get('/message/five', [MessageController::class, 'messageFive'])->name('messages.five');
	Route::resource('/order', 'OrderController');
	Route::resource('/shipping', 'ShippingController');
	Route::resource('/coupon', 'CouponController');
	Route::get('settings', [AdminController::class, 'settings'])->name('settings');
	Route::post('setting/update', [AdminController::class, 'settingsUpdate'])->name('settings.update');
	Route::get('/notification/{id}', [NotificationController::class, 'show'])->name('admin.notification');
	Route::get('/notifications', [NotificationController::class, 'index'])->name('all.notification');
	Route::delete('/notification/{id}', [NotificationController::class, 'delete'])->name('notification.delete');
	// Route::get('change-password', [AdminController::class, 'changePassword'])->name('change.password.form');
	// Route::post('change-password', [AdminController::class, 'changPasswordStore'])
	//     ->name('admin.change.password')
	//     ->name('change.password.admin'); // legacy alias
	Route::get('change-password', [AdminController::class, 'changePassword'])->name('admin.password.change.form');
	Route::post('change-password', [AdminController::class, 'changPasswordStore'])->name('admin.password.change');
	Route::get('change-password', [AdminController::class, 'changePassword'])->name('change.password.form');
});


// User section start
Route::group(['prefix' => '/user', 'middleware' => ['user']], function () {
	Route::get('/', [HomeController::class, 'index'])->name('user');
	Route::get('/profile', [HomeController::class, 'profile'])->name('user-profile');
	Route::post('/profile/{id}', [HomeController::class, 'profileUpdate'])->name('user-profile-update');

	// Orders
	Route::get('/order', [HomeController::class, 'orderIndex'])->name('user.order.index');
	Route::get('/order/show/{id}', [HomeController::class, 'orderShow'])->name('user.order.show');
	Route::delete('/order/delete/{id}', [HomeController::class, 'userOrderDelete'])->name('user.order.delete');

	// Reviews
	Route::get('/user-review', [HomeController::class, 'productReviewIndex'])->name('user.productreview.index');
	Route::delete('/user-review/delete/{id}', [HomeController::class, 'productReviewDelete'])->name('user.productreview.delete');
	Route::get('/user-review/edit/{id}', [HomeController::class, 'productReviewEdit'])->name('user.productreview.edit');
	Route::patch('/user-review/update/{id}', [HomeController::class, 'productReviewUpdate'])->name('user.productreview.update');

	// Comments (user’s own)
	Route::get('user-post/comment', [HomeController::class, 'userComment'])->name('user.post-comment.index');
	Route::delete('user-post/comment/delete/{id}', [HomeController::class, 'userCommentDelete'])->name('user.post-comment.delete');
	Route::get('user-post/comment/edit/{id}', [HomeController::class, 'userCommentEdit'])->name('user.post-comment.edit');
	Route::patch('user-post/comment/udpate/{id}', [HomeController::class, 'userCommentUpdate'])->name('user.post-comment.update');

	// Password
	Route::get('change-password', [HomeController::class, 'changePassword'])->name('user.password.change.form');
	Route::post('change-password', [HomeController::class, 'changPasswordStore'])->name('user.password.change');

	// Reports
	Route::get('user-reports/form', [ReportsController::class, 'create'])->name('user.add-report.form');
	Route::post('user-reports/store', [ReportsController::class, 'store'])->name('user.add-report');
	Route::get('user-reports/success', [ReportsController::class, 'success'])->name('user.report.success');
	Route::get('user-reports/cancel', [ReportsController::class, 'cancel'])->name('user.report.cancel');

	// Defendant Flow: Subject Responses
	Route::post(
		'user-reports/subject-responses/{report_number}',
		[ReportsController::class, 'subjectResponses']
	)
		->name('user.subject-responses.submit');

	Route::get(
		'user-reports/subject-responses/success/{report_number}',
		[ReportsController::class, 'subjectResponsesSuccess']
	)->name('user.subject-responses.success');

	Route::get(
		'user-reports/subject-responses/cancel/{report_number}',
		[ReportsController::class, 'subjectResponsesCancel']
	)->name('user.subject-responses.cancel');




	//http://localhost:8000/user/user-reports/subject-responses/success

	// Reporter reply
	Route::post('user-reports/reporter-reply/{report_id}', [ReportsController::class, 'reporterReply'])->name('user.reporter-reply.submit');
	Route::get('user-reports/reporter-reply/success', [ReportsController::class, 'reporterReplySuccess'])->name('user.reporter-reply.success');
	Route::get('user-reports/reporter-reply/cancel', [ReportsController::class, 'reporterReplyCancel'])->name('user.reporter-reply.cancel');

	Route::get('report-detail/{report_number}', [ReportsController::class, 'detail'])->name('report-detail');



	// Comments (juror/community)
	Route::post('user-reports/comments/{report_id}', [ReportCommentsController::class, 'comments'])->name('user.comments.submit');
	Route::get('user-reports/comments/success', [ReportCommentsController::class, 'commentsSuccess'])->name('user.comments.success');
	Route::get('user-reports/comments/cancel', [ReportCommentsController::class, 'commentsCancel'])->name('user.comments.cancel');

	// Buy comment package
	Route::post('user-reports/buy-comment-package/{report_id}', [ReportsController::class, 'buyCommentPackage'])->name('user.buycomments.submit');
	Route::get('user-reports/buy-comment-package/success', [ReportsController::class, 'buyCommentSuccess'])->name('user.buycomments.success');
	Route::get('user-reports/buy-comment-package/cancel', [ReportsController::class, 'buyCommentCancel'])->name('user.buycomments.cancel');
});


Route::get('list-reports', [ReportsController::class, 'index'])->name('list-reports');
Route::get('report-detail/{report_number}', [ReportsController::class, 'detail'])->name('report-detail');

// Route::group(['prefix' => 'laravel-filemanager', 'middleware' => ['web', 'auth']], function () {
//     Lfm::routes();
// });
