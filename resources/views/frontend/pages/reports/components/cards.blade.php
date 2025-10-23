@if($reports && $reports->count())
<div class="container-fluid py-2">
	<div class="d-flex flex-column gap-3">
		@foreach($reports as $report)
		<x-report-card
			:report="$report"
			:bgClass="$loop->odd ? 'bg-light' : 'bg-white'" />
		@endforeach
	</div>
</div>
@else
<p class="text-center text-muted py-4">No reports found.</p>
@endif