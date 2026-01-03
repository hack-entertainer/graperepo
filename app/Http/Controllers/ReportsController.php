<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Reports;
use App\Models\ReportResponse;
use App\Models\ReportComments;
use Stripe\Stripe;
use Stripe\Checkout\Session;
use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;

use App\User;

class ReportsController extends Controller
{
	/**
	 * Display a listing of the resource.
	 */
	public function index(Request $request)
	{
		$reports = collect();
		$answers = collect();
		$comments = collect();

		if ($request->filled('q')) {
			$q = $request->q;

			$reportsQuery = Reports::where(function ($qBuilder) use ($q) {
				$qBuilder
					->where('reporter_name', 'like', "%$q%")
					->orWhere('subject_fullname', 'like', "%$q%")
					->orWhere('report_number', 'like', "%$q%");
			});

			if ($request->filled('type_event')) {
				$reportsQuery->where('type_event', $request->type_event);
			}

			$reports = $reportsQuery->latest()->paginate(50, ['*'], 'reports_page');

			$answers = ReportResponse::whereRaw(
				'LOWER(user_fullname) LIKE ?',
				['%' . strtolower($q) . '%']
			)->latest()->paginate(50, ['*'], 'answers_page');

			$comments = ReportComments::whereRaw(
				'LOWER(user_fullname) LIKE ?',
				['%' . strtolower($q) . '%']
			)->latest()->paginate(50, ['*'], 'comments_page');
		} else {
			$reportsQuery = Reports::query();

			if ($request->filled('type_event')) {
				$reportsQuery->where('type_event', $request->type_event);
			}

			$reports = $reportsQuery->latest()->paginate(50, ['*'], 'reports_page');
		}

		return view(
			'frontend.pages.reports.index',
			compact('reports', 'answers', 'comments')
		);
	}

	public function create()
	{
		return view('frontend.pages.reports.add');
	}

	public function store(Request $request)
	{
		logger()->info('FILES dump', [
			'files' => array_keys($_FILES),
			'video_error' => $_FILES['video_file']['error'] ?? null,
		]);

		logger()->info('Report submission received', [
			'has_video' => $request->hasFile('video_file'),
			'video_valid' => optional($request->file('video_file'))->isValid(),
			'video_size' => optional($request->file('video_file'))->getSize(),
			'video_mime' => optional($request->file('video_file'))->getClientMimeType(),
		]);

		try {
			$validated = $request->validate([
				'subject_fullname' => 'required|string|max:255',
				'subject_address'  => 'required|string',
				'subject_city'     => 'required|string',
				'subject_state'    => 'required|string',
				'subject_zipcode'  => 'required|string',
				'subject_country'  => 'required|string',
				'subject_email'    => 'nullable|email',
				'subject_phone'    => 'nullable|string|max:50',
				'type_event'       => 'required',
				'event_date'       => 'required|date',
				'event_address'    => 'required|string',
				'event_city'       => 'required|string',
				'event_state'      => 'required|string',
				'event_zipcode'    => 'required|string',
				'event_country'    => 'required|string',
				'description'      => 'required|string',
				'video_link'       => 'nullable|url',
				'alternate_reporter_name' => 'nullable|string',
				'video_file'       => 'nullable|file|max:102400',
				'letter_file'      => 'nullable|file|mimes:pdf,doc,docx|max:10240',
			]);
		} catch (\Illuminate\Validation\ValidationException $e) {
			logger()->error('Report submission validation failed', [
				'errors' => $e->errors(),
				'video_present' => $request->hasFile('video_file'),
				'video_mime' => optional($request->file('video_file'))->getClientMimeType(),
				'video_ext' => optional($request->file('video_file'))->getClientOriginalExtension(),
				'video_size_kb' => optional($request->file('video_file'))->getSize()
					? round($request->file('video_file')->getSize() / 1024, 2)
					: null,
			]);

			throw $e; // preserve normal Laravel behavior
		}


		$extraVideoFee  = 0;
		$extraLetterFee = 0;

		$video_doc  = null;
		$letter_doc = null;

		if ($request->hasFile('letter_file')) {
			$upload = Cloudinary::upload(
				$request->file('letter_file')->getRealPath(),
				[
					'folder'        => 'reports/letters',
					'resource_type' => 'raw',
					'type'          => 'authenticated',
				]
			);

			$letter_doc = [
				'type'          => 'letter',
				'resource_type' => 'raw',
				'public_id'     => $upload->getPublicId(),
				'original_name' => $request->file('letter_file')->getClientOriginalName(),
			];

			$extraLetterFee = 29;
		}

		if ($request->hasFile('video_file')) {
			$upload = Cloudinary::upload(
				$request->file('video_file')->getRealPath(),
				[
					'folder'        => 'reports/videos',
					'resource_type' => 'video',
					'type'          => 'authenticated',
				]
			);

			$video_doc = [
				'type'          => 'video',
				'resource_type' => 'video',
				'public_id'     => $upload->getPublicId(),
				'original_name' => $request->file('video_file')->getClientOriginalName(),
			];

			$extraVideoFee = 29;
		}

		$totalAmount = 49 + $extraVideoFee + $extraLetterFee;
		$stripeFee   = round($totalAmount * 0.03 + 0.30, 2);
		$totalPrice  = round($totalAmount + $stripeFee, 2);

		unset($validated['video_file'], $validated['letter_file']);

		session([
			'report_data' => array_merge($validated, [
				'video_doc'        => $video_doc,
				'letter_doc'       => $letter_doc,
				'extra_video_fee'  => $extraVideoFee,
				'extra_letter_fee' => $extraLetterFee,
				'reporter_name'    => auth()->user()->name,
				'reporter_email'   => auth()->user()->email,
			])
		]);

		Stripe::setApiKey(config('services.stripe.secret'));

		$session = Session::create([
			'payment_method_types' => ['card'],
			'line_items' => [[
				'price_data' => [
					'currency'     => 'usd',
					'unit_amount'  => $totalPrice * 100,
					'product_data' => [
						'name' => 'Submit RRDB Report',
					],
				],
				'quantity' => 1,
			]],
			'mode'        => 'payment',
			'success_url' => route('user.report.success'),
			'cancel_url'  => route('user.report.cancel'),
		]);

		return redirect($session->url);
	}


	public function success()
	{
		$data = session('report_data');

		if (!$data) {
			return redirect()
				->route('user.add-report.form')
				->with('error', 'No data found. Please resubmit your report.');
		}

		$report = Reports::create([
			'reporter_id'    => auth()->id(),
			'reporter_name'  => $data['reporter_name'],
			'reporter_email' => $data['reporter_email'],
			'alternate_reporter_name' => $data['alternate_reporter_name'] ?? null,

			'subject_fullname' => $data['subject_fullname'],
			'subject_email'    => $data['subject_email'],
			'subject_phone'    => $data['subject_phone'],
			'subject_address'  => $data['subject_address'],
			'subject_city'     => $data['subject_city'],
			'subject_state'    => $data['subject_state'],
			'subject_zipcode'  => $data['subject_zipcode'],
			'subject_country'  => $data['subject_country'],

			'type_event'    => $data['type_event'],
			'event_date'    => $data['event_date'],
			'event_address' => $data['event_address'],
			'event_city'    => $data['event_city'],
			'event_state'   => $data['event_state'],
			'event_zipcode' => $data['event_zipcode'],
			'event_country' => $data['event_country'],

			'description' => $data['description'],
			'video_link'  => $data['video_link'] ?? null,

			'report_number'  => now()->format('Y') . '-RRDB-' . strtoupper(uniqid()),
			'is_paid'        => true,
			'payment_status' => 'paid',
			'paid_at'        => now(),
		]);

		// ---------------------------------
		// Persist documents
		// ---------------------------------

		if (!empty($data['letter_doc'])) {
			\App\Models\Document::create([
				'report_id'                 => $report->id,
				'kind'                      => 'letter',
				'cloudinary_public_id'      => $data['letter_doc']['public_id'],
				'cloudinary_resource_type'  => $data['letter_doc']['resource_type'],
				'original_filename'         => $data['letter_doc']['original_name'],
				'mime_type'                 => $data['letter_doc']['mime_type'] ?? null,
				'uploaded_by_user_id'       => auth()->id(),
			]);
		}

		if (!empty($data['video_doc'])) {
			\App\Models\Document::create([
				'report_id'                 => $report->id,
				'kind'                      => 'video',
				'cloudinary_public_id'      => $data['video_doc']['public_id'],
				'cloudinary_resource_type'  => $data['video_doc']['resource_type'],
				'original_filename'         => $data['video_doc']['original_name'],
				'mime_type'                 => $data['video_doc']['mime_type'] ?? null,
				'uploaded_by_user_id'       => auth()->id(),
			]);
		}

		session()->forget('report_data');

		return redirect()
			->route('user')
			->with('success', 'Your report was submitted and paid successfully!');
	}


	public function cancel()
	{
		$data = session('report_data');

		if ($data) {

			// ---------------------------------
			// Delete letter document from Cloudinary
			// ---------------------------------
			if (!empty($data['letter_doc']['public_id'])) {
				Cloudinary::destroy(
					$data['letter_doc']['public_id'],
					['resource_type' => $data['letter_doc']['resource_type']]
				);
			}

			// ---------------------------------
			// Delete video document from Cloudinary
			// ---------------------------------
			if (!empty($data['video_doc']['public_id'])) {
				Cloudinary::destroy(
					$data['video_doc']['public_id'],
					['resource_type' => $data['video_doc']['resource_type']]
				);
			}
		}

		session()->forget('report_data');

		return redirect()
			->route('user.add-report.form')
			->with('error', 'Payment was cancelled or failed. Please try again.');
	}


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

		return view('frontend.pages.reports.detail', [
			'report' => $report,
			'report_response' => $report_response,
			'report_comments' => $report_comments,
			'documents' => $documents,
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
