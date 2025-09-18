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

class ReportsController extends Controller
{
	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index(Request $request)
	{
		$reports = collect();
		$answers = collect();
		$comments = collect();

		if ($request->filled('q')) {
			$q = $request->q;

			// Build Reports query
			$reportsQuery = Reports::where(function ($qBuilder) use ($q) {
				$qBuilder->where('reporter_name', 'like', "%$q%")
					->orWhere('subject_fullname', 'like', "%$q%")
					->orWhere('report_number', 'like', "%$q%");
			});

			// Apply incident type filter
			if ($request->filled('type_event')) {
				$reportsQuery->where('type_event', $request->type_event);
			}

			// Paginate results
			$reports = $reportsQuery->latest()->paginate(50, ['*'], 'reports_page');

			// Search Answers
			$answers = ReportResponse::whereRaw('LOWER(user_fullname) LIKE ?', ['%' . strtolower($q) . '%'])
				->latest()
				->paginate(50, ['*'], 'answers_page');

			// Search Comments
			$comments = ReportComments::whereRaw('LOWER(user_fullname) LIKE ?', ['%' . strtolower($q) . '%'])
				->latest()
				->paginate(50, ['*'], 'comments_page');
		} else {
			// Default: just show reports (with optional type filter)
			$reportsQuery = Reports::query();

			if ($request->filled('type_event')) {
				$reportsQuery->where('type_event', $request->type_event);
			}

			$reports = $reportsQuery->latest()->paginate(50, ['*'], 'reports_page');
		}

		return view('frontend.pages.reports.index', compact('reports', 'answers', 'comments'));
	}



	/**
	 * Show the form for creating a new resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		// $categories=PostCategory::get();
		// $tags=PostTag::get();
		// $users=User::get();
		return view('frontend.pages.reports.add');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{
		// echo "<pre/>";print_r($request->all());die;
		$validated = $request->validate([
			'subject_fullname' => 'required|string|max:255',
			'subject_address' => 'required|string',
			'subject_city' => 'required|string',
			'subject_state' => 'required|string',
			'subject_zipcode' => 'required|string',
			'subject_country' => 'required|string',
			'subject_email' => 'nullable|email',
			'subject_phone' => 'nullable|string|max:50',
			'type_event' => 'required',
			'event_date' => 'required|date',
			'event_address' => 'required|string',
			'event_city' => 'required|string',
			'event_state' => 'required|string',
			'event_zipcode' => 'required|string',
			'event_country' => 'required|string',
			'description' => 'required|string',
			'video_link' => 'nullable|url',
			'alternate_reporter_name' => 'nullable|string',
			'video_file' => 'nullable|file|mimetypes:video/mp4,video/quicktime,video/x-msvideo|max:102400',
			'letter_file' => 'nullable|file|mimes:pdf,doc,docx|max:10240',
		]);

		$extraVideoFee = 0;
		$extraLetterFee = 0;
		$videoPath = null;
		$letterPath = null;

		if ($request->hasFile('video_file')) {
			$video_file = $request->file('video_file');

			$originalName = pathinfo($video_file->getClientOriginalName(), PATHINFO_FILENAME);
			$extension = $video_file->getClientOriginalExtension();

			$safeName = Str::slug($originalName);
			$timestamp = time();

			$newFilename_video = $safeName . '_' . $timestamp . '.' . $extension;

			$videoPath = $video_file->storeAs('reports_video', $newFilename_video, 'public');
			$extraVideoFee = 29;
		}

		if ($request->hasFile('letter_file')) {
			$letter_file = $request->file('letter_file');

			$originalName_letter = pathinfo($letter_file->getClientOriginalName(), PATHINFO_FILENAME);
			$extension_letter = $letter_file->getClientOriginalExtension();

			$safeName_letter = Str::slug($originalName_letter);
			$timestamp_letter = time();

			$newFilename_letter = $safeName_letter . '_' . $timestamp_letter . '.' . $extension_letter;

			$letterPath = $letter_file->storeAs('reports_letter', $newFilename_letter, 'public');
			$extraLetterFee = 29;
		}

		$totalAmount = 49 + $extraVideoFee + $extraLetterFee;
		$stripe_fee = round($totalAmount * 0.03 + 0.30, 2);
		$total_price = round($totalAmount + $stripe_fee, 2);


		unset($validated['video_file'], $validated['letter_file']);
		$validated['video_path'] = $videoPath;
		$validated['letter_path'] = $letterPath;

		session([
			'report_data' => array_merge($validated, [
				'video_path' => $videoPath,
				'letter_path' => $letterPath,
				'extra_video_fee' => $extraVideoFee,
				'extra_letter_fee' => $extraLetterFee,
				'reporter_name' => auth()->user()->name,
				'reporter_email' => auth()->user()->email,
			])
		]);

		// Khởi tạo Stripe Checkout Session
		Stripe::setApiKey(config('services.stripe.secret'));

		$session = Session::create([
			'payment_method_types' => ['card'],
			'line_items' => [[
				'price_data' => [
					'currency' => 'usd',
					'unit_amount' => $total_price * 100,
					'product_data' => [
						'name' => 'Submit RRDB Report',
					],
				],
				'quantity' => 1,
			]],
			'mode' => 'payment',
			'success_url' => route('user.report.success'),
			'cancel_url' => route('user.report.cancel'),
		]);

		return redirect($session->url);
	}

	public function success()
	{
		$data = session('report_data');

		if (!$data) {
			return redirect()->route('user.add-report.form')->with('error', 'No data found. Please resubmit your report.');
		}

		// Lưu report
		Reports::create([
			'reporter_id' => auth()->id(),
			'reporter_name' => $data['reporter_name'],
			'reporter_email' => $data['reporter_email'],
			'alternate_reporter_name' => $data['alternate_reporter_name'] ?? null,

			'subject_fullname' => $data['subject_fullname'],
			'subject_email' => $data['subject_email'],
			'subject_phone' => $data['subject_phone'],
			'subject_address' => $data['subject_address'],
			'subject_city' => $data['subject_city'],
			'subject_state' => $data['subject_state'],
			'subject_zipcode' => $data['subject_zipcode'],
			'subject_country' => $data['subject_country'],

			'type_event' => $data['type_event'],
			'event_date' => $data['event_date'],
			'event_address' => $data['event_address'],
			'event_city' => $data['event_city'],
			'event_state' => $data['event_state'],
			'event_zipcode' => $data['event_zipcode'],
			'event_country' => $data['event_country'],

			'description' => $data['description'],
			'video_link' => $data['video_link'] ?? null,
			'video_path' => $data['video_path'] ?? null,
			'letter_path' => $data['letter_path'] ?? null,

			'report_number' => now()->format('Y') . '-RRDB-' . strtoupper(uniqid()),
			'is_paid' => true,
			'payment_status' => 'paid',
			'paid_at' => now(),
		]);

		session()->forget('report_data');

		return redirect()->route('user')->with('success', 'Your report was submitted and paid successfully!');
	}

	public function cancel()
	{
		session()->forget('report_data');
		return redirect()->route('user.add-report.form')->with('error', 'Payment was cancelled or failed. Please try again.');
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function detail($report_number)
	{
		// get detail report
		$report = Reports::where('report_number', $report_number)->first();

		// check existence before accessing properties
		if (!$report) {
			abort(404, 'Report not found.');
		}

		// report responses
		$report_response = ReportResponse::where('report_id', $report->id)
			->orderBy('created_at', 'desc')
			->get();

		// get comments
		$report_comments = ReportComments::where('report_id', $report->id)
			->orderBy('created_at', 'desc')
			->get();

		return view('frontend.pages.reports.detail')
			->with('report', $report)
			->with('report_response', $report_response)
			->with('report_comments', $report_comments);
	}

	// public function detail($report_number)
	// {
	// 	// get detail report
	// 	$report = Reports::where('report_number', $report_number)->first();
	// 	// report responses
	// 	$report_response = ReportResponse::where('report_id', $report->id)->orderBy('created_at', 'desc')->get();
	// 	// get comment
	// 	$report_comments = ReportComments::where('report_id', $report->id)->orderBy('created_at', 'desc')->get();

	// 	if (!$report) {
	// 		abort(404, 'Report not found.');
	// 	}

	// 	return view('frontend.pages.reports.detail')->with('report', $report)->with('report_response', $report_response)->with('report_comments', $report_comments);
	// }

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
		$post = Post::findOrFail($id);
		$categories = PostCategory::get();
		$tags = PostTag::get();
		$users = User::get();
		return view('backend.post.edit')->with('categories', $categories)->with('users', $users)->with('tags', $tags)->with('post', $post);
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{
		$post = Post::findOrFail($id);
		// return $request->all();
		$this->validate($request, [
			'title' => 'string|required',
			'quote' => 'string|nullable',
			'summary' => 'string|required',
			'description' => 'string|nullable',
			'photo' => 'string|nullable',
			'tags' => 'nullable',
			'added_by' => 'nullable',
			'post_cat_id' => 'required',
			'status' => 'required|in:active,inactive'
		]);

		$data = $request->all();
		$tags = $request->input('tags');
		// return $tags;
		if ($tags) {
			$data['tags'] = implode(',', $tags);
		} else {
			$data['tags'] = '';
		}
		// return $data;

		$status = $post->fill($data)->save();
		if ($status) {
			request()->session()->flash('success', 'Post Successfully updated');
		} else {
			request()->session()->flash('error', 'Please try again!!');
		}
		return redirect()->route('post.index');
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		$post = Post::findOrFail($id);

		$status = $post->delete();

		if ($status) {
			request()->session()->flash('success', 'Post successfully deleted');
		} else {
			request()->session()->flash('error', 'Error while deleting post ');
		}
		return redirect()->route('post.index');
	}


	/** subject Responses Modal
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function subjectResponses(Request $request, $report_number)
	{
		// dd($report_number, $report = Reports::where('report_number', $report_number)->first());

		$request->validate([
			'response_text' => 'required', // ✅ match blade input
			'response_file' => 'nullable|file|max:10240', // 10MB max
		]);

		$filePath = null;

		if ($request->hasFile('response_file')) {
			$file = $request->file('response_file');

			$originalName = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
			$extension    = $file->getClientOriginalExtension();

			$safeName  = Str::slug($originalName);
			$timestamp = time();

			$newFilename = $safeName . '_' . $timestamp . '.' . $extension;

			$filePath = $file->storeAs('reports_responses', $newFilename, 'public');
		}

		// ✅ Load by report_number instead of id
		$report = Reports::where('report_number', $report_number)->firstOrFail();

		session(['subject_response_data' => [
			'user_id'        => auth()->id(),
			'report_id'      => $report->id,
			'report_number'  => $report->report_number,
			'user_fullname'  => auth()->user()->name,
			'type'           => 'subject_responses',
			'content'        => $request->response_text, // ✅ match input name
			'file_path'      => $filePath,
			'is_paid'        => false,
			'payment_status' => 'unpaid',
		]]);

		Stripe::setApiKey(config('services.stripe.secret'));

		$checkout_session = Session::create([
			'payment_method_types' => ['card'],
			'line_items' => [[
				'price_data' => [
					'currency'     => 'usd',
					'unit_amount'  => 5077, // $50.77
					'product_data' => [
						'name' => 'Subject Response - Report #' . $report->report_number,
					],
				],
				'quantity' => 1,
			]],
			'mode'        => 'payment',
			'success_url' => route('user.subject-responses.success'),
			'cancel_url'  => route('user.subject-responses.cancel'),
		]);

		return redirect($checkout_session->url);
	}



	public function showSubjectResponseForm($report_number)
	{
		$report = Reports::where('report_number', $report_number)->firstOrFail();
		return view('frontend.pages.reports.answer', compact('report'));
	}


	public function debugSuccess()
	{
		dd('hiya');
		return __FILE__;
	}



	public function subjectResponsesSuccess()
	{
		dd('method: ReportsController.php:subjectResponsesSuccess');
		dd(session('subject_response_data'));

		$data = session('subject_response_data');



		if (!$data) {
			return redirect()->route('reports.index')
				->with('error', 'No response data found. Please try again.');
		}

		// Insert clean data into DB
		ReportResponse::create([
			'user_id'       => $data['user_id'],
			'report_id'     => $data['report_id'],
			'content'       => $data['content'],
			'file_path'     => $data['file_path'],
			'is_paid'       => true,
			'payment_status' => 'paid',
			'paid_at'       => now(),
		]);

		$report_number = $data['report_number'];

		session()->forget('subject_response_data');

		return redirect()
			->route('report-detail', $report_number) // check your actual route name here
			->with('success', 'Your response was posted successfully!');
	}

	public function subjectResponsesCancel()
	{
		$data = session('subject_response_data');
		$report_number = $data['report_number'] ?? null;

		session()->forget('subject_response_data');

		if ($report_number) {
			return redirect()->route('report-detail', $report_number)
				->with('error', 'Payment was cancelled or failed. Please try again.');
		}

		return redirect()->route('reports.index')
			->with('error', 'Payment was cancelled. Please try again.');
	}

	// public function subjectResponsesSuccess()
	// {
	//     $data = session('subject_response_data');
	//     $data['is_paid'] = true;
	//     $data['payment_status'] = 'paid';
	//     $data['paid_at'] = now();

	//     ReportResponse::create($data);
	//     // echo "<pre/>";print_r($data);die;
	//     $report_number = $data['report_number'];
	//     session()->forget('subject_response_data');

	//     return redirect()->route('report-detail', $report_number)->with('success', 'Your response was posted successfully!');
	// }

	// public function subjectResponsesCancel()
	// {
	//     session()->forget('subject_response_data');
	//     return redirect()->back()->with('error', 'Payment was cancelled or failed. Please try again.');
	// }




	/**
	 * Reporter Reply Modal
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
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

	public function reporterReplySuccess()
	{
		$data = session('reporter_reply_data');
		$data['is_paid'] = true;
		$data['payment_status'] = 'paid';
		$data['paid_at'] = now();

		ReportResponse::create($data);
		// echo "<pre/>";print_r($data);die;
		$report_number = $data['report_number'];
		session()->forget('reporter_reply_data');

		return redirect()->route('report-detail', $report_number)->with('success', 'Your response was posted successfully!');
	}

	public function reporterReplyCancel()
	{
		session()->forget('reporter_reply_data');
		return redirect()->back()->with('error', 'Payment was cancelled or failed. Please try again.');
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
