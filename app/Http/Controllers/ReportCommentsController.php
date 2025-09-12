<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\Reports;
use App\Models\ReportResponse;
use App\Models\ReportComments;
use App\User;
use Stripe\Stripe;
use Stripe\Checkout\Session;
use Illuminate\Support\Facades\Validator;

class ReportCommentsController extends Controller
{
	// public function comments(Request $request, $report_id)
	// {

	//     $validator = Validator::make($request->all(), [
	//         'content' => 'required|string|max:10000',
	//     ]);

	//     if ($validator->fails()) {
	//         return redirect()->back()
	//                          ->withErrors($validator)
	//                          ->withInput();
	//     }
	//     // get report number
	//     $report = Reports::where('id', $report_id)->first();
	//     // Lưu dữ liệu tạm vào session
	//     session(['comment_data' => [
	//         'user_id' => auth()->id(),
	//         'report_id' => $request->report_id,
	//         'user_fullname' => auth()->user()->name,
	//         'content' => $request->content,
	//         'report_number' => $report->report_number,
	//     ]]);

	//     Stripe::setApiKey(config('services.stripe.secret'));


	//     $checkout = Session::create([
	//         'payment_method_types' => ['card'],
	//         'line_items' => [[
	//             'price_data' => [
	//                 'currency' => 'usd',
	//                 'unit_amount' => 50, // $0.49 = 49 cents
	//                 'product_data' => ['name' => 'Post Comment - Report #'.$report->report_number],
	//             ],
	//             'quantity' => 1,
	//         ]],
	//         'mode' => 'payment',
	//         'success_url' => route('user.comments.success'),
	//         'cancel_url' => route('user.comments.cancel'),
	//     ]);

	//     return redirect($checkout->url);
	// }

	// public function commentsSuccess()
	// {
	//     $data = session('comment_data');

	//     ReportComments::create([
	//         'user_id' => $data['user_id'],
	//         'report_id' => $data['report_id'],
	//         'content' => $data['content'],
	//         'user_fullname' => $data['user_fullname'],
	//         'is_paid' => true,
	//         'payment_status' => 'paid',
	//         'paid_at' => now(),
	//     ]);

	//     $report_number = $data['report_number'];
	//     session()->forget('comment_data');

	//     return redirect()->route('report-detail', $report_number)->with('success', 'Your comment was posted successfully!');
	// }

	// public function commentsCancel()
	// {
	//     $data = session('comment_data');
	//     $report_number = $data['report_number'] ?? null;

	//     session()->forget('comment_data');

	//     return redirect()->route('report-detail', $report_number)->with('success', 'Payment failed. Your comment was not posted.');
	// }

	public function comments(Request $request, $report_id)
	{
		$request->validate(
			[
				'content' => 'required|string|max:2000',
				'acknowledge' => 'accepted',
			],
			[
				'acknowledge.accepted' => 'You must acknowledge that you wrote this comment and stand behind every factual statement.',
			]
		);

		$user = auth()->user();

		if ($user->credits_comment <= 0) {
			return redirect()->back()->with('error', 'You need to purchase comment credits to post a comment.');
		}

		// Save comment
		ReportComments::create([
			'report_id' => $report_id,
			'user_id' => $user->id,
			'user_fullname' => $user->name,
			'is_paid' => true,
			'content' => $request->input('content'),
			'payment_status' => 'paid',
			'paid_at' => now(),
		]);

		// Decrement 1 credit
		$user->decrement('credits_comment');

		return redirect()->back()->with('success', 'Your comment has been posted.');
	}
}
