<!-- resources/views/frontend/pages/reports/components/table.blade.php -->

<div class="overflow-x-auto w-full">
	@if(($reports && $reports->count()) || ($answers && $answers->count()) || ($comments && $comments->count()))
	<table class="min-w-full border border-gray-200 text-sm align-middle text-center table-hover">
		<thead class="bg-gray-100 text-gray-700">
			<tr>
				<th class="px-4 py-2 text-left">Report #</th>
				<th class="px-4 py-2 text-left">Reporter</th>
				<th class="px-4 py-2 text-left">Subject</th>
				<th class="px-4 py-2 text-left">Type</th>
				<th class="px-4 py-2 text-left">Status</th>
				<th class="px-4 py-2 text-right">Actions</th>
			</tr>
		</thead>
		<tbody class="divide-y divide-gray-200">
			@foreach($reports as $report)
			<tr class="hover:bg-gray-50">
				<td class="px-4 py-2 font-medium text-gray-800">{{ $report->id }}</td>
				<td class="px-4 py-2">{{ $report->reporter->name ?? 'N/A' }}</td>
				<td class="px-4 py-2">{{ $report->subject_name ?? 'N/A' }}</td>
				<td class="px-4 py-2">{{ $report->type_event ?? '—' }}</td>
				<td class="px-4 py-2">
					<span class="px-2 py-1 rounded-full text-xs
                                @if($report->status === 'Resolved') bg-green-100 text-green-800
                                @elseif($report->status === 'Pending') bg-yellow-100 text-yellow-800
                                @else bg-gray-100 text-gray-800 @endif">
						{{ ucfirst($report->status ?? 'unknown') }}
					</span>
				</td>
				<td class="px-4 py-2 text-right">
					<a href="{{ route('report-detail', $report->id) }}"
						class="text-blue-600 hover:underline font-medium">View</a>
				</td>
			</tr>
			@endforeach

			{{-- Optional: Display Answers --}}
			@if(isset($answers))
			@foreach($answers as $answer)
			<tr class="bg-gray-50 hover:bg-gray-100">
				<td class="px-4 py-2 text-gray-500">{{ $answer->report_id }}</td>
				<td class="px-4 py-2 text-gray-600">—</td>
				<td class="px-4 py-2 text-gray-600">—</td>
				<td class="px-4 py-2 italic text-gray-500">Answer</td>
				<td class="px-4 py-2">{{ $answer->status ?? '—' }}</td>
				<td class="px-4 py-2 text-right">
					<a href="{{ route('answer.show', $answer->id) }}"
						class="text-blue-500 hover:underline">View</a>
				</td>
			</tr>
			@endforeach
			@endif

			{{-- Optional: Display Comments --}}
			@if(isset($comments))
			@foreach($comments as $comment)
			<tr class="bg-gray-50 hover:bg-gray-100">
				<td class="px-4 py-2 text-gray-500">{{ $comment->report_id }}</td>
				<td class="px-4 py-2 text-gray-600">{{ $comment->user->name ?? 'Anonymous' }}</td>
				<td class="px-4 py-2">—</td>
				<td class="px-4 py-2 italic text-gray-500">Comment</td>
				<td class="px-4 py-2">—</td>
				<td class="px-4 py-2 text-right">
					<a href="{{ route('comment.show', $comment->id) }}"
						class="text-blue-500 hover:underline">View</a>
				</td>
			</tr>
			@endforeach
			@endif
		</tbody>
	</table>
	@else
	<p class="text-center text-gray-500 py-6 italic">No reports or related entries found.</p>
	@endif
</div>