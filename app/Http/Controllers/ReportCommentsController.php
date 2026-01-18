<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ReportComments;

class ReportCommentsController extends Controller
{
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
