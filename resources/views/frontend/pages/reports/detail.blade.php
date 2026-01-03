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
				@include('frontend.pages.reports.components.comments', [
				'report' => $report,
				'report_comments' => $report_comments
				])
			</div>
		</div>
	</div>
</section>
@endsection