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
use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;

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

	/**
	 * Show the form for creating a new resource.
	 */
	public function create()
	{
		return view('frontend.pages.reports.add');
	}

	/**
	 * Store a newly created resource in storage (pre-payment).
	 */
	public function store(Request $request)
	{
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

		$extraVideoFee  = 0;
		$extraLetterFee = 0;

		// -------------------------
		// PDF / Letter (Cloudinary)
		// -------------------------
		$letterPublicId  = null;
		$letterPublicUrl = null;

		if ($request->hasFile('letter_file')) {
			$upload = Cloudinary::upload(
				$request->file('letter_file')->getRealPath(),
				[
					'folder'        => 'reports/letters',
					'resource_type' => 'raw',
				]
			);

			$letterPublicId  = $upload->getPublicId();
			$letterPublicUrl = $upload->getSecurePath();

			$extraLetterFee = 29;
		}

		// -------------------------
		// Video (LEGACY — untouched)
		// -------------------------
		$videoPath = null;

		if ($request->hasFile('video_file')) {
			$video = $request->file('video_file');

			$safeName = Str::slug(
				pathinfo($video->getClientOriginalName(), PATHINFO_FILENAME)
			);

			$newName = $safeName . '_' . time() . '.' . $video->getClientOriginalExtension();

			$videoPath = $video->storeAs('reports_video', $newName, 'public');
			$extraVideoFee = 29;
		}

		$totalAmount = 49 + $extraVideoFee + $extraLetterFee;
		$stripeFee   = round($totalAmount * 0.03 + 0.30, 2);
		$totalPrice  = round($totalAmount + $stripeFee, 2);

		unset($validated['video_file'], $validated['letter_file']);

		session([
			'report_data' => array_merge($validated, [
				'video_path'        => $videoPath, // legacy
				'letter_public_id'  => $letterPublicId,
				'letter_public_url' => $letterPublicUrl,
				'extra_video_fee'   => $extraVideoFee,
				'extra_letter_fee'  => $extraLetterFee,
				'reporter_name'     => auth()->user()->name,
				'reporter_email'    => auth()->user()->email,
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

		// dd(session('report_data'));

		return redirect($session->url);
	}

	/**
	 * Stripe success callback.
	 */
	public function success()
	{
		$data = session('report_data');

		if (!$data) {
			return redirect()
				->route('user.add-report.form')
				->with('error', 'No data found. Please resubmit your report.');
		}

		Reports::create([
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

			'description'   => $data['description'],
			'video_link'    => $data['video_link'] ?? null,

			// Cloudinary (PDF)
			'letter_public_id'  => $data['letter_public_id'] ?? null,
			'letter_public_url' => $data['letter_public_url'] ?? null,

			// legacy
			'video_path' => $data['video_path'] ?? null,

			'report_number'   => now()->format('Y') . '-RRDB-' . strtoupper(uniqid()),
			'is_paid'         => true,
			'payment_status'  => 'paid',
			'paid_at'         => now(),
		]);

		session()->forget('report_data');

		return redirect()
			->route('user')
			->with('success', 'Your report was submitted and paid successfully!');
	}

	public function cancel()
	{
		$data = session('report_data');

		if ($data) {
			// Delete uploaded PDF if it exists
			if (!empty($data['letter_public_id'])) {
				Cloudinary::destroy(
					$data['letter_public_id'],
					['resource_type' => 'raw']
				);
			}

			// Delete uploaded video if it exists (future-proof)
			if (!empty($data['video_public_id'])) {
				Cloudinary::destroy(
					$data['video_public_id'],
					['resource_type' => 'video']
				);
			}
		}

		session()->forget('report_data');

		return redirect()
			->route('user.add-report.form')
			->with('error', 'Payment was cancelled. Uploaded files were removed.');
	}


	/**
	 * Display the specified report.
	 */
	public function detail($report_number)
	{
		$report = Reports::where('report_number', $report_number)->firstOrFail();

		$report_response = ReportResponse::where('report_id', $report->id)
			->orderBy('created_at', 'desc')
			->get();

		$report_comments = ReportComments::where('report_id', $report->id)
			->orderBy('created_at', 'desc')
			->get();

		return view('frontend.pages.reports.detail', [
			'report' => $report,
			'report_response' => $report_response,
			'report_comments' => $report_comments,
		]);
	}
}
