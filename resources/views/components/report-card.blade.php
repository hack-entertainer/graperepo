<div class="card {{ $bgClass }}">
	<div class="card-body">
		<h5 class="card-title">Report #{{ $report->report_number }}</h5>
		<p><strong>Reporter:</strong> {{ $report->reporter_name }}</p>
		<p><strong>Subject:</strong> {{ $report->subject_fullname }}</p>
	</div>
</div>