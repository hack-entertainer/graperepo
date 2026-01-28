@extends('frontend.layouts.master')

@section('title','Sexual Misconduct Report || PRODUCT PAGE')

@section('main-content')
<!-- Breadcrumbs -->
<div class="breadcrumbs">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="bread-inner">
					<ul class="bread-list">
						<li><a href="/">Home<i class="ti-arrow-right"></i></a></li>
						<li class="active"><a href="#">Report detail</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

@if(session('success'))
<div class="alert alert-success">
	{{ session('success') }}
</div>
@endif

@if(session('error'))
<div class="alert alert-danger">
	{{ session('error') }}
</div>
@endif

<section class="shop single section">
	<div class="container py-4">
		<div class="row">
			<div class="col-lg-7">
				<h5 class="mb-3">
					<i class="fa fa-address-card-o"></i>
					Sexual Misconduct Report
					<u>#{{ $report->report_number }}</u>
				</h5>

				<div class="card mb-3 shadow-sm">
					<div class="card-header bg-danger text-white">
						<i class="fa fa-info-circle"></i> Incident Details
					</div>

					<div class="card-body">
						<p>
							<strong>Reporter name:</strong>
							{{ $report->alternate_reporter_name ?? $report->reporter_name }}
						</p>

						<p><strong>Type:</strong> {{ $report->type_event }}</p>
						<p><strong>Date of Event:</strong> {{ $report->event_date }}</p>

						<p>
							<strong>Location of Event:</strong>
							{{ $report->event_city }},
							{{ $report->event_state }},
							{{ $report->event_zipcode }},
							{{ $report->event_country }}
						</p>

						<hr>

						<p><strong>Subject name:</strong> {{ $report->subject_fullname }}</p>
						<p>
							<strong>Subject address:</strong>
							{{ $report->subject_city }},
							{{ $report->subject_state }},
							{{ $report->subject_zipcode }},
							{{ $report->subject_country }}
						</p>

						<hr>

						<p><strong>Description:</strong></p>
						<p>{{ $report->description }}</p>

						<hr>

						@if($report->video_link)
						<p>
							<strong>Video Evidence link:</strong>
							<a href="{{ $report->video_link }}" target="_blank">
								<u>View Video</u>
							</a>
						</p>
						@endif

						{{-- 📎 Attached Documents --}}
						@if($documents->isNotEmpty())
						<hr>
						<div class="report-attachments">
							<strong>Attachments:</strong>
							<ul class="mt-2">
								@foreach ($documents as $document)
								<li>
									@if ($document->kind === 'letter')
									📄 Letter:
									@elseif ($document->kind === 'video')
									🎥 Video:
									@else
									📎 Document:
									@endif

									<a href="{{ route('documents.download', $document->id) }}">
										{{ $document->original_filename ?? 'Download' }}
									</a>
								</li>
								@endforeach
							</ul>
						</div>
						@endif
					</div>

					{{-- Response Action Buttons (BS4) --}}
					<div class="mt-4">
						@auth
						@if(auth()->id() === $report->reporter_id)
						{{-- Reporter can post a reply --}}
						<button
							class="btn btn-warning"
							data-toggle="modal"
							data-target="#reporterReplyModal">
							Post Reply ($49)
						</button>
						@else
						{{-- Subject can post a response --}}
						<button
							class="btn btn-success"
							data-toggle="modal"
							data-target="#subjectResponsesModal">
							Post Response ($49)
						</button>
						@endif
						@else
						<p class="text-danger" style="font-size: 17px;">
							If you are the reported subject, please
							<a href="{{ route('login.form') }}" style="color:#007bff">
								<strong>LOGIN</strong>
							</a>
							to post a response.
						</p>
						@endauth
					</div>


					<!-- Subject Response Modal (BS4) -->
					<div class="modal fade" id="subjectResponsesModal" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<form method="POST" action="{{ route('user.subject-responses.submit', $report->report_number) }}" enctype="multipart/form-data">
								@csrf
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Post Your Response</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>

									<div class="modal-body">
										<textarea name="response_text" class="form-control mb-3" rows="4" placeholder="Write your response..." required></textarea>

										<label for="subject_response_file" class="form-label"><strong>Upload Evidence File (optional)</strong></label>
										<input type="file" id="subject_response_file" name="response_file" class="form-control mt-3">
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-primary">Submit & Pay ($49)</button>
									</div>
								</div>
							</form>
						</div>
					</div>

					<!-- Reporter Reply Modal (BS4) -->
					<div class="modal fade" id="reporterReplyModal" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<form method="POST" action="{{ route('user.reporter-reply.submit', $report->id) }}" enctype="multipart/form-data">
								@csrf
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Reporter Reply</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>

									<div class="modal-body">
										<textarea class="form-control mb-3" name="content" rows="10" required placeholder="Write your response..."></textarea>

										<label for="reporter_response_file" class="form-label"><strong>Upload Evidence File (optional)</strong></label>
										<input type="file" class="form-control" id="reporter_response_file" name="response_file">
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-primary">Submit & Pay ($49)</button>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>

				@foreach($report_response as $response)
				<div class="card mb-3 shadow-sm">
					<div class="card-header {{ $response->type === 'reporter_reply' ? 'bg-info' : 'bg-secondary' }} text-white">
						{{ $response->type === 'reporter_reply' ? "Reporter's Reply" : "Subject's Response" }}
					</div>

					<div class="card-body">
						<p><strong>Date:</strong> {{ $response->created_at }}</p>
						<p>{{ $response->content }}</p>

						<!-- TODO -- UPDATE TO USE DOCUMENT TABLE -->
						@if($response->file_path)
						<p>
							<a href="{{ Storage::url($response->file_path) }}" target="_blank">
								Additional Evidence
							</a>
						</p>
						@endif
					</div>
				</div>
				@endforeach
			</div>

			<div class="col-lg-5 mt-4 mt-lg-0">

				{{-- Voting --}}
				@include('widgets.voting', [
				'report' => $report,
				'purpose' => 'incident',
				'reason' => 'advisory-only',
				'currentVote' => null,
				'canVote' => false,
				])



				@include('frontend.pages.reports.components.comments', [
				'report' => $report,
				'report_comments' => $report_comments
				])

			</div>

		</div>
	</div>
</section>
@include('frontend.pages.reports.components.buy-comment-modal', [
'report' => $report
])

@endsection