@php
$collapseId = 'collapse-' . $report->report_number;
@endphp

<div class="card shadow-sm border {{ $bgClass }}">
	{{-- Card Header --}}
	<div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
		<span>Report #{{ $report->report_number }}</span>

		{{-- Collapse Toggle --}}
		<button class="btn btn-sm btn-outline-light"
			style="color:#fff; background-color:rgba(255,255,255,0.15); border-color:#fff;"
			type="button"
			data-bs-toggle="collapse"
			data-bs-target="#{{ $collapseId }}"
			aria-expanded="false"
			aria-controls="{{ $collapseId }}">
			Details
			<i class="fa fa-chevron-down ms-1"></i>
		</button>
	</div>

	{{-- Always-visible summary --}}
	<div class="card-body pb-1">
		<p class="mb-1"><strong>Reporter:</strong> {{ $report->reporter_name }}</p>
		<p class="mb-1"><strong>Subject:</strong> {{ $report->subject_fullname }}</p>
	</div>

	{{-- Collapsible section --}}
	<div class="collapse" id="{{ $collapseId }}">
		<div class="card-body pt-0">
			<p class="mb-1"><strong>Type:</strong> {{ $report->type_event }}</p>
			<p class="mb-1"><strong>Location:</strong> {{ $report->event_location }}</p>
			<p class="mb-1"><strong>Date of Event:</strong>
				{{ \Carbon\Carbon::parse($report->event_date)->format('M d, Y') }}
			</p>
			<p class="mb-1"><strong>Date of Report:</strong>
				{{ \Carbon\Carbon::parse($report->created_at)->format('M d, Y') }}
			</p>

			@if($report->video_link)
			<p class="mb-2">
				<strong>Video:</strong>
				<a href="{{ $report->video_link }}"
					target="_blank"
					class="text-primary text-decoration-none">
					<i class="fa fa-video-camera me-1"></i> View
				</a>
			</p>
			@else
			<p class="text-muted mb-2"><strong>Video:</strong> --</p>
			@endif

			<a href="{{ route('report-detail', $report->report_number) }}"
				class="btn btn-primary btn-sm w-100">
				View Full Report
			</a>
		</div>
	</div>
</div>