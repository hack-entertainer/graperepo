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

						{{-- ✅ Cloudinary Letter Download --}}
						@if ($report->letter_public_url)
						<div class="report-attachment">
							<strong>Attached Document:</strong>
							<a
								href="{{ $report->letter_public_url }}"
								target="_blank"
								rel="noopener">
								Download PDF
							</a>
						</div>
						@endif

						{{-- ✅ Cloudinary Video Download --}}
						@if ($report->video_public_url)
						<div class="report-attachment">
							<strong>Attached Video:</strong>
							<a
								href="{{ $report->video_public_url }}"
								target="_blank"
								rel="noopener">
								View / Download Video
							</a>
						</div>
						@endif

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
		</div>
	</div>
</section>
@endsection