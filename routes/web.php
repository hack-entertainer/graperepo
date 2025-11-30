<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Artisan;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\FrontendController;
use App\Http\Controllers\PostCommentController;
use App\Http\Controllers\HomeController;
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

Route::post('password-reset', [FrontendController::class, 'showResetForm'])->name('frontend.password.reset');

Route::get('/', [FrontendController::class, 'home'])->name('home');
Route::get('/dome', [FrontendController::class, 'dome'])->name('dome');

// Frontend Routes
Route::get('/home', [FrontendController::class, 'index']);
Route::get('/post-rules', [FrontendController::class, 'postRules'])->name('post-rules');

// Post Comment
Route::post('post/{slug}/comment', [PostCommentController::class, 'store'])->name('post-comment.store');
Route::resource('/comment', PostCommentController::class);

// Backend section start
Route::group(['prefix' => '/admin', 'middleware' => ['auth', 'admin']], function () {
	Route::get('/', [AdminController::class, 'index'])->name('admin');
	Route::get('/file-manager', fn() => view('backend.layouts.file-manager'))->name('file-manager');
	Route::resource('users', 'UsersController');
	Route::get('/profile', [AdminController::class, 'profile'])->name('admin-profile');
	Route::post('/profile/{id}', [AdminController::class, 'profileUpdate'])->name('profile-update');
	Route::resource('/category', 'CategoryController');
	Route::post('/category/{id}/child', 'CategoryController@getChildByParent');
	Route::resource('/post-category', 'PostCategoryController');
	Route::resource('/post-tag', 'PostTagController');
	Route::resource('/post', 'PostController');
	Route::get('settings', [AdminController::class, 'settings'])->name('settings');
	Route::post('setting/update', [AdminController::class, 'settingsUpdate'])->name('settings.update');
	Route::get('change-password', [AdminController::class, 'changePassword'])->name('admin.password.change.form');
	Route::post('change-password', [AdminController::class, 'changPasswordStore'])->name('admin.password.change');
	Route::get('change-password', [AdminController::class, 'changePassword'])->name('change.password.form');
});


// User section start
Route::group(['prefix' => '/user', 'middleware' => ['user']], function () {
	Route::get('/', [HomeController::class, 'index'])->name('user');
	Route::get('/profile', [HomeController::class, 'profile'])->name('user-profile');
	Route::post('/profile/{id}', [HomeController::class, 'profileUpdate'])->name('user-profile-update');


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
	)->name('user.subject-responses.submit');

	Route::get(
		'user-reports/subject-responses/success/{report_number}',
		[ReportsController::class, 'subjectResponsesSuccess']
	)->name('user.subject-responses.success');

	Route::get(
		'user-reports/subject-responses/cancel/{report_number}',
		[ReportsController::class, 'subjectResponsesCancel']
	)->name('user.subject-responses.cancel');

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


use Cloudinary\Cloudinary;

Route::get('/cloudinary-test', function () {

	// Force direct configuration (bypassing Laravel/ENV)
	$cloudinary = new Cloudinary([
		'cloud' => [
			'cloud_name' => env('CLOUDINARY_CLOUD_NAME'),
			'api_key'    => env('CLOUDINARY_API_KEY'),
			'api_secret' => env('CLOUDINARY_API_SECRET'),
		],
		'url' => [
			'secure' => true
		]
	]);

	try {
		// Upload a tiny file: /etc/hosts (all systems have it)
		$response = $cloudinary->uploadApi()->upload('/etc/hosts', [
			'folder' => 'test-route',
			'resource_type' => 'raw'
		]);


		return [
			'status' => 'success',
			'public_id' => $response['public_id'] ?? null,
			'secure_url' => $response['secure_url'] ?? null,
		];
	} catch (\Exception $e) {
		return [
			'status' => 'error',
			'message' => $e->getMessage(),
			'trace' => $e->getTraceAsString(),
		];
	}
});

// Route::group(['prefix' => 'laravel-filemanager', 'middleware' => ['web', 'auth']], function () {
//     Lfm::routes();
// });
