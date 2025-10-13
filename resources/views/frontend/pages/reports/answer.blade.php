@extends('frontend.layouts.master')

@section('title','Submit Answer')

@section('main-content')
<div class="container mt-5">
	
	<div class="row justify-content-center">
		<div class="col-lg-10">

			<h2 class="mb-4 text-center">Submit Answer to Report #{{ $report->report_number }}</h2>

			<form action="{{ route('user.subject-responses.submit', $report->report_number) }}" method="POST" enctype="multipart/form-data">
				@csrf

				<!-- Defendant Answer -->
				<div class="mb-3">
					<label for="content" class="form-label fw-bold">Your Answer <span class="text-danger">*</span></label>
					<textarea id="content" name="content" class="form-control @error('content') is-invalid @enderror"
						rows="8" required>{{ old('content') }}</textarea>
					@error('content')
					<div class="invalid-feedback">{{ $message }}</div>
					@enderror
				</div>

				<!-- Optional File Upload -->
				<div class="mb-3">
					<label for="response_file" class="form-label fw-bold">Attach Supporting Document (optional)</label>
					<input type="file" name="response_file" id="response_file" class="form-control @error('response_file') is-invalid @enderror">
					@error('response_file')
					<div class="invalid-feedback">{{ $message }}</div>
					@enderror
				</div>

				<!-- Acknowledgment Checkbox -->
				<div class="form-check mb-3">
					<input type="checkbox"
						class="form-check-input @error('confirmation') is-invalid @enderror"
						name="confirmation"
						id="confirmation"
						required>
					<label class="form-check-label" for="confirmation">
						I confirm that the above information is true and accurate.
					</label>
					@error('confirmation')
					<div class="invalid-feedback">{{ $message }}</div>
					@enderror
				</div>
				<!-- <div class="form-check mb-3">
          <input class="form-check-input @error('acknowledge') is-invalid @enderror" type="checkbox" id="acknowledge" name="acknowledge" value="1" required>
          <label class="form-check-label" for="acknowledge">
            I confirm that this Answer is truthful and submitted by me.
          </label>
          @error('acknowledge')
          <div class="invalid-feedback">{{ $message }}</div>
          @enderror
        </div> -->

				<!-- Buttons -->
				<div class="d-flex justify-content-between">
					<button type="submit" class="btn btn-primary">Submit Answer</button>
					<a href="{{ route('list-reports') }}" class="btn btn-secondary">Return to Reports</a>
				</div>

			</form>
		</div>
	</div>
</div>
@endsection