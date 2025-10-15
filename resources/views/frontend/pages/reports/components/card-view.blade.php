<!-- resources/views/frontend/pages/reports/partials/card-view.blade.php -->
<div class="space-y-4">
	@foreach ($reports as $report)
	<div class="border rounded-lg shadow-sm bg-white p-4">
		<div class="flex justify-between items-center mb-2">
			<h2 class="font-semibold text-gray-800">{{ $report->title }}</h2>
			<span class="px-2 py-1 rounded-full text-xs 
                {{ $report->status === 'Open' ? 'bg-green-100 text-green-700' : 'bg-gray-100 text-gray-700' }}">
				{{ $report->status }}
			</span>
		</div>
		<p class="text-xs text-gray-500 mb-2">Report #: {{ $report->report_number }}</p>
		<p class="text-sm text-gray-600 mb-3">Created {{ $report->created_at->format('M d, Y') }}</p>
		<a href="{{ route('report-detail', $report->report_number) }}"
			class="inline-block text-blue-600 text-sm font-medium hover:underline">
			View Report →
		</a>
	</div>
	@endforeach
</div>