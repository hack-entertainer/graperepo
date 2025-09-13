@extends('frontend.layouts.master')

@section('title','List reports || PRODUCT PAGE')

@section('main-content')
<!-- Breadcrumbs -->
<div class="breadcrumbs">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="bread-inner">
					<ul class="bread-list">
						<li><a href="/">Home<i class="ti-arrow-right"></i></a></li>
						<li class="active"><a href="#">List reports</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Breadcrumbs -->
<section class="shop single section">
	<div class="container" data-aos="fade-up">
		<h3 class="mb-4">📋 List reports</h3>
		<div class="mb-4">
			<form class="row g-3" method="GET" action="{{ route('list-reports') }}">
				<div class="col-md-4">
					<input type="text" class="form-control" name="q" value="{{ request('q') }}" placeholder="Search by Reporter or Subject">
				</div>
				<div class="col-md-3">
					<select class="form-select" name="type_event">
						<option value="">All Incident Types</option>
						<option value="Rape" {{ request('type_event') == 'Rape' ? 'selected' : '' }}>Rape</option>
						<option value="Sexual Assault" {{ request('type_event') == 'Sexual Assault' ? 'selected' : '' }}>Sexual Assault</option>
						<option value="Sexual Abuse" {{ request('type_event') == 'Sexual Abuse' ? 'selected' : '' }}>Sexual Abuse</option>
						<option value="Sexual Harassment" {{ request('type_event') == 'Sexual Harassment' ? 'selected' : '' }}>Sexual Harassment</option>
					</select>
				</div>

				<div class="col-md-2 d-grid">
					<button type="submit" class="btn btn-primary">Search</button>
				</div>
			</form>
		</div>

		<div class="table-responsive">
			@if(count($reports)>0)
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

					{{-- New: Answers --}}
					@if(isset($answers) && $answers->count())
					<h3 class="mt-5">📝 Answers</h3>
					@foreach($answers as $answer)
					<div class="card mb-3">
						<div class="card-body">
							<p>{{ Str::limit($answer->content, 200) }}</p>
							<small>By {{ $answer->user_fullname }}
								in <a href="{{ route('report-detail',$answer->report_id) }}">
									Report #{{ $answer->report_id }}
								</a>
							</small>
						</div>
					</div>
					@endforeach
					{{ $answers->withQueryString()->links() }}
					@endif
					<!-- 
					{{-- New: Comments --}}
					@if(isset($comments) && $comments->count())
					<h3 class="mt-5">💬 Comments</h3>
					@foreach($comments as $comment)
					<div class="card mb-3">
						<div class="card-body">
							<p>{{ Str::limit($comment->content, 200) }}</p>
							<small>By {{ $comment->user_fullname }}
								in <a href="{{ route('report-detail',$comment->report_id) }}">
									Report #{{ $comment->report_id }}
								</a>
							</small>
						</div>
					</div>
					@endforeach
					{{ $comments->withQueryString()->links() }}
					@endif -->

					{{-- Comments --}}
					@if(isset($comments) && $comments->count())
					<h3 class="mt-5">💬 Comments</h3>
					@foreach($comments as $comment)
					<div class="card mb-3">
						<div class="card-body">
							<p>{{ Str::limit($comment->content, 200) }}</p>
							<small>
								By {{ $comment->user_fullname }}
								in <a href="{{ route('report-detail',$comment->report_id) }}">
									Report #{{ $comment->report_id }}
								</a>
							</small>
						</div>
					</div>
					@endforeach
					{{ $comments->withQueryString()->links() }}
					@endif


					{{-- Empty results --}}
					@if(request()->filled('q') && !$reports->count() && !$answers->count() && !$comments->count())
					<p>No results found.</p>
					@endif


















				</tbody>

			</table>

			@else
			<h6 class="text-center">No report found!!! </h6>
			@endif

		</div>

		<!-- <div class="d-flex justify-content-center mt-4">
              {{ $reports->withQueryString()->links() }}
          </div> -->
	</div>
</section>
@endsection
@push('styles')
<style>
	.pagination {
		display: inline-flex;
	}

	.filter_button {
		/* height:20px; */
		text-align: center;
		background: #F7941D;
		padding: 8px 16px;
		margin-top: 10px;
		color: white;
	}
</style>
@endpush
@push('scripts')
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
@endpush