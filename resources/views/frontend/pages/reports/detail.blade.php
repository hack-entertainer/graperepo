@extends('frontend.layouts.master')

@section('title','Sexual Misconduct Report || PRODUCT PAGE')

@section('main-content')

@php
// Cloudinary URL builder
$uploader = app(\App\Services\UploadService::class);
@endphp

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
	<div class="container py-4" data-aos="fade-up">
		<div class="row">

			<!-- Main Content -->
			<div class="col-lg-7">
				<h5 class="mb-3"><i class="fa fa-address-card-o"></i> Sexual Misconduct Report <u>#{{$report->report_number}}</u></h5>

				<div class="card mb-3 shadow-sm">
					<div class="card-header bg-danger text-white">
						<i class="fa fa-info-circle"></i> Incident Details
					</div>

					<div class="card-body">

						@if($report->alternate_reporter_name)
						<p><strong>Reporter name:</strong> {{$report->alternate_reporter_name}}</p>
						@else
						<p><strong>Reporter name:</strong> {{$report->reporter_name}}</p>
						@endif

						<p><strong>Type:</strong> {{$report->type_event}}</p>
						<p><strong>Date of Event:</strong> {{$report->event_date}}</p>

						<p><strong>Location:</strong>
							{{$report->event_city}},
							{{$report->event_state}},
							{{$report->event_zipcode}},
							{{$report->event_country}}
						</p>

						<hr>

						<p><strong>Subject name:</strong> {{$report->subject_fullname}}</p>
						<p><strong>Subject address:</strong>
							{{$report->subject_city}},
							{{$report->subject_state}},
							{{$report->subject_zipcode}},
							{{$report->subject_country}}
						</p>

						<hr>

						<p><strong>Description:</strong></p>
						<p>{{$report->description}}</p>

						<hr>

						@if($report->video_link)
						<p><strong>Video Evidence link:</strong>
							<a href="{{$report->video_link}}" target="_blank" class="text-primary">
								<u>View Video</u>
							</a>
						</p>
						@endif

						<br>

						{{-- LETTER (PDF/DOC) --}}
						@if ($report->letter_public_id)
						<div class="mb-3">
							<label class="fw-bold">Letter to Subject:</label>
							<a href="{{ $uploader->publicUrl($report->letter_public_id) }}"
								target="_blank" class="text-primary">
								📄 View Letter
							</a>
						</div>
						@endif

						<br>

						{{-- VIDEO --}}
						@if($report->video_public_id)
						<div class="card mb-4">
							<div class="card-header fw-bold">Video Evidence</div>
							<div class="card-body">
								<video class="w-100 rounded shadow" controls>
									<source src="{{ $uploader->publicUrl($report->video_public_id) }}" type="video/mp4">
									Your browser does not support the video tag.
								</video>
							</div>
						</div>
						@endif

					</div>
				</div>

				{{-- RESPONSES --}}
				@if(count($report_response)>0)
				@foreach($report_response as $response)
				<div class="card mb-3 shadow-sm">

					@if($response->type == "reporter_reply")
					<div class="card-header bg-info text-white">
						<i class="fa fa-reply"></i> Reporter's Reply
					</div>
					@else
					<div class="card-header bg-secondary text-white">
						<i class="fa fa-user-circle-o"></i> Subject's Response
					</div>
					@endif

					<div class="card-body">
						<p><strong>Date of Reply:</strong> {{$response->created_at}}</p>

						@if($response->type == "subject_responses")
						<p><strong>Subject Name:</strong> {{$response->user_fullname}}</p>
						@endif

						<p>{{$response->content}}</p>

						@if($response->file_path)
						<p>
							<a href="{{ Storage::url($response->file_path) }}"
								target="_blank"
								class="text-primary text-decoration-underline">
								Additional Evidence
							</a>
						</p>
						@endif
					</div>
				</div>
				@endforeach
				@endif

				{{-- ACTION BUTTONS --}}
				<div class="mt-4">
					@auth
					@if(auth()->id() === $report->reporter_id)
					<button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#reporterReplyModal">
						Post Reply ($49)
					</button>
					@else
					<button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#subjectResponsesModal">
						Post Response ($49)
					</button>
					@endif
					@else
					<p class="text-danger" style="font-size: 17px;">
						If you are the reported subject, please
						<a href="{{ route('login.form') }}" class="text-primary"><b>LOGIN</b></a>
						to post a response.
					</p>
					@endauth
				</div>

				<br>

				{{-- SUBJECT RESPONSE MODAL --}}
				@include('frontend.pages.reports.partials.subject-modal')

				{{-- REPORTER REPLY MODAL --}}
				@include('frontend.pages.reports.partials.reporter-modal')

			</div> <!-- END LEFT COLUMN -->

			{{-- RIGHT COLUMN: COMMENTS --}}
			@include('frontend.pages.reports.partials.comments')

		</div>

		@include('frontend.pages.reports.partials.fee-notice')

	</div>
</section>
@endsection

@push('styles')
<style>
	.pagination {
		display: inline-flex;
	}

	.filter_button {
		text-align: center;
		background: #F7941D;
		padding: 8px 16px;
		margin-top: 10px;
		color: #fff;
	}

	.sticky-top-custom {
		position: sticky;
		top: 10px;
	}
</style>
@endpush

@push('scripts')
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
@endpush