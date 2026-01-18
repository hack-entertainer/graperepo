<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;

use App\Models\Reports;
use App\Models\ReportResponse;
use App\Models\ReportComments;
use App\Models\Vote; // ← added
use Stripe\Stripe;
use Stripe\Checkout\Session;
use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;

use App\User;

class ReportsController extends Controller
{
	// … everything above unchanged …

	public function detail($report_number)
	{
		$report = Reports::where('report_number', $report_number)->firstOrFail();

		$report_response = ReportResponse::where('report_id', $report->id)
			->orderBy('created_at', 'desc')
			->get();

		$report_comments = ReportComments::where('report_id', $report->id)
			->orderBy('created_at', 'desc')
			->get();

		$documents = \App\Models\Document::where('report_id', $report->id)
			->orderBy('created_at', 'asc')
			->get();

		// ---------------------------------
		// Voting logic (incident)
		// ---------------------------------

		$latestVote = null;
		$canVote = false;
		$cannotVoteReason = null;

		if (auth()->check()) {
			$latestVote = Vote::where('user_id', auth()->id())
				->where('target_type', 'incident')
				->where('target_id', $report->id)
				->latest()
				->first();

			$cost = config('pricing.vote.incident');

			$canVote = auth()->user()->credits_comment >= $cost;

			if (! $canVote) {
				$cannotVoteReason = 'You need to purchase comment credits to vote.';
			}
		}

		return view('frontend.pages.reports.detail', [
			'report' => $report,
			'report_response' => $report_response,
			'report_comments' => $report_comments,
			'documents' => $documents,

			// voting
			'latestVote' => $latestVote,
			'canVote' => $canVote,
			'cannotVoteReason' => $cannotVoteReason,
		]);
	}

	/**
	 * Submit a subject response (Stripe checkout entry point)
	 */
	public function subjectResponses(Request $request, $report_number)
	{
		$request->validate([
			'response_text' => 'required|string|max:10000',
		]);

		$report = Reports::where('report_number', $report_number)->firstOrFail();
		$user = auth()->user();

		// Store pending response in session
		session([
			'subject_response_data' => [
				'user_id'       => $user->id,
				'user_fullname' => $user->name,
				'report_id'     => $report->id,
				'report_number' => $report->report_number,
				'content'       => $request->response_text,
			],
		]);

		Stripe::setApiKey(config('services.stripe.secret'));

		$checkout = Session::create([
			'payment_method_types' => ['card'],
			'line_items' => [[
				'price_data' => [
					'currency' => 'usd',
					'unit_amount' => 4900, // $49.00 (+ Stripe fees disclosed elsewhere)
					'product_data' => [
						'name' => 'Subject Response - Report #' . $report->report_number,
					],
				],
				'quantity' => 1,
			]],
			'mode' => 'payment',
			'success_url' => route('user.subject-responses.success', $report->report_number),
			'cancel_url'  => route('user.subject-responses.cancel', $report->report_number),
		]);

		return redirect($checkout->url);
	}

	public function reporterReply(Request $request, $report_id)
	{
		$request->validate([
			'content' => 'required',
			'response_file' => 'nullable|file|max:10240', // giới hạn 10MB
		]);


		$filePath = null;

		if ($request->hasFile('response_file')) {
			$file = $request->file('response_file');

			$originalName = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
			$extension = $file->getClientOriginalExtension();

			$safeName = Str::slug($originalName); // 
			$timestamp = time();

			// new file: bang-chung-abc_1717039999.pdf
			$newFilename = $safeName . '_' . $timestamp . '.' . $extension;

			// save responses
			$filePath = $file->storeAs('reports_responses', $newFilename, 'public');
		}
		// get report number
		$report = Reports::where('id', $report_id)->first();

		session(['reporter_reply_data' => [
			'user_id' => auth()->id(),
			'report_id' => $report_id,
			'report_number' => $report->report_number,
			'user_fullname' => auth()->user()->name,
			'type' => 'reporter_reply',
			'content' => $request->content,
			'file_path' => $filePath, // lưu đường dẫn file
			'is_paid' => false,
			'payment_status' => 'unpaid',
		]]);

		Stripe::setApiKey(config('services.stripe.secret'));

		$checkout_session = Session::create([
			'payment_method_types' => ['card'],
			'line_items' => [[
				'price_data' => [
					'currency' => 'usd',
					'unit_amount' => 5077, // $50.77
					'product_data' => ['name' => 'Subject responses - Report #' . $report->report_number],
				],
				'quantity' => 1,
			]],
			'mode' => 'payment',
			'success_url' => route('user.reporter-reply.success'),
			'cancel_url' => route('user.reporter-reply.cancel'),
		]);

		return redirect($checkout_session->url);
	}

	/**
	 * Stripe success callback for subject responses
	 */
	public function subjectResponsesSuccess($report_number)
	{
		$data = session('subject_response_data');

		if (!$data) {
			return redirect()
				->route('report-detail', $report_number)
				->with('error', 'No pending response found.');
		}

		ReportResponse::create([
			'user_id'        => $data['user_id'],
			'user_fullname'  => $data['user_fullname'],
			'report_id'      => $data['report_id'],
			'type'           => 'subject_responses',
			'content'        => $data['content'],
			'is_paid'        => true,
			'payment_status' => 'paid',
			'paid_at'        => now(),
		]);

		session()->forget('subject_response_data');

		return redirect()
			->route('report-detail', $report_number)
			->with('success', 'Your response has been posted successfully.');
	}

	/**
	 * Stripe cancel callback for subject responses
	 */
	public function subjectResponsesCancel($report_number)
	{
		session()->forget('subject_response_data');

		return redirect()
			->route('report-detail', $report_number)
			->with('error', 'Payment was cancelled. Your response was not submitted.');
	}


	public function buyCommentPackage(Request $request, $report_id)
	{
		$credits = (int) $request->input('package');
		$price = match ($credits) {
			1 => 0.81,
			25 => 12.92,
			100 => 50.77,
			default => abort(400, 'Invalid package'),
		};
		// get report number
		$report = Reports::where('id', $report_id)->first();

		session(['buy_comment_package' => [
			'user_id' => auth()->id(),
			'report_id' => $report_id,
			'report_number' => $report->report_number,
			'credits' => $credits,
			'amount' => $price,
		]]);

		Stripe::setApiKey(config('services.stripe.secret'));

		$checkout_session = Session::create([
			'payment_method_types' => ['card'],
			'line_items' => [[
				'price_data' => [
					'currency' => 'usd',
					'unit_amount' => $price * 100,
					'product_data' => ['name' => "Comment Package ($credits)"],
				],
				'quantity' => 1,
			]],
			'mode' => 'payment',
			'success_url' => route('user.buycomments.success'),
			'cancel_url' => route('user.buycomments.cancel'),
		]);

		return redirect($checkout_session->url);
	}

	public function buyCommentSuccess()
	{
		$data = session('buy_comment_package');
		if (!$data) {
			return redirect()->route('user')->with('error', 'No session found.');
		}

		$user = User::find($data['user_id']);
		if ($user) {
			$user->increment('credits_comment', $data['credits']);
		}
		$report_number = $data['report_number'];
		session()->forget('buy_comment_package');

		return redirect()->route('report-detail', $report_number)->with('success', 'Your comment credits were added successfully!');
	}

	public function buyCommentCancel()
	{
		session()->forget('buy_comment_package');
		return redirect()->route('user')->with('error', 'Payment was cancelled.');
	}
}
