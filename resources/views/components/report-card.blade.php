<div class="card shadow-sm border {{ $bgClass }}">

	{{-- Card Header: Report number --}}
	<div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
		<span>Report #{{ $report->report_number }}</span>
		<a href="{{ route('report-detail', $report->report_number) }}"
			class="text-white text-decoration-none small">
			View Details
			<i class="fa fa-chevron-right ms-1"></i>
		</a>
	</div>

	{{-- Card Body --}}
	<div class="card-body">
		<p class="mb-1"><strong>Reporter:</strong> {{ $report->reporter_name }}</p>
		<p class="mb-1"><strong>Subject:</strong> {{ $report->subject_fullname }}</p>
		<p class="mb-1"><strong>Type:</strong> {{ $report->type_event }}</p>
		<p class="mb-1"><strong>Location:</strong> {{ $report->event_location }}</p>
		<p class="mb-1"><strong>Date of Event:</strong>
			{{ \Carbon\Carbon::parse($report->event_date)->format('M d, Y') }}
		</p>
		<p class="mb-3"><strong>Date of Report:</strong>
			{{ \Carbon\Carbon::parse($report->created_at)->format('M d, Y') }}
		</p>

		{{-- Video link --}}
		@if($report->video_link)
		<p class="mb-3">
			<strong>Video:</strong>
			<a href="{{ $report->video_link }}"
				target="_blank"
				class="text-primary text-decoration-none">
				<i class="fa fa-video-camera me-1"></i> View
			</a>
		</p>
		@else
		<p class="text-muted mb-3"><strong>Video:</strong> --</p>
		@endif

		{{-- Action button --}}
		<a href="{{ route('report-detail', $report->report_number) }}"
			class="btn btn-primary btn-sm w-100">
			View Detail
		</a>
	</div>
</div>