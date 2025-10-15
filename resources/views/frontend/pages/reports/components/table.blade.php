	<table class="table table-striped table-bordered align-middle text-center table-hover">
		<thead class="table-dark">
			<tr>
				<th>Report #</th>
				<th>Reporter</th>
				<th>Subject</th>
				<th>Type</th>
				<th>Location</th>
				<th>Date Event</th>
				<th>Date of Report</th>
				<th>Video</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			@foreach($reports as $report)
			<tr>
				<td><a href="{{route('report-detail',$report->report_number)}}" style="color: #007bff;" title="View details">{{$report->report_number}}</a></td>
				<td><strong>{{$report->reporter_name}}</strong></td>
				<td>{{$report->subject_fullname}}</td>

				<td>{{$report->type_event}}</td>
				<td>{{$report->event_location}}</td>
				<td>{{$report->event_date}}</td>
				<td>{{$report->created_at}}</td>
				<td>
					@if($report->video_link)
					<a href="{{$report->video_link}}" target="_blank" style="color:#007bff" title="View video">
						<i class="fa fa-video-camera" aria-hidden="true"></i>
					</a>
					@else
					--
					@endif
				</td>
				<td><a href="{{route('report-detail',$report->report_number)}}" class="btn btn-primary btn-sm" title="View details"> Detail</a></td>
			</tr>
			@endforeach
			{{-- Existing Reports loop --}}

			@if(request()->filled('q')
			&& (!$reports || !$reports->count())
			&& (!$answers || !$answers->count())
			&& (!$comments || !$comments->count()))
			<p>No results found.</p>
			@endif

		</tbody>

	</table>