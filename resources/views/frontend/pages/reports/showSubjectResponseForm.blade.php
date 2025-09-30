@extends('frontend.layouts.master')

@section('title', 'Submit Subject Response')

@section('content')
<div class="container py-5">
	<div class="row justify-content-center">
		<div class="col-md-8">
			<h2 class="mb-4">Respond to Report #{{ $report->report_number }}</h2>

			<div class="card shadow-sm">
				<div class="card-body">
					<form method="POST" action="{{ route('user.subject-responses.submit', $report->report_number) }}" enctype="multipart/form-data">
						@csrf

						{{-- Response Content --}}
						<div class="form-group mb-3">
							<label for="content">Your Response</label>
							<textarea id="content" name="content" class="form-control @error('content') is-invalid @enderror" rows="6" required>{{ old('content') }}</textarea>
							@error('content')
							<span class="invalid-feedback">{{ $message }}</span>
							@enderror

						</div>

						{{-- File Upload --}}
						<div class="form-group mb-3">
							<label for="response_file">Attach Supporting File (optional)</label>
							<input type="file" id="response_file" name="response_file" class="form-control @error('response_file') is-invalid @enderror" accept=".pdf,.doc,.docx,.jpg,.jpeg,.png">
							@error('response_file')
							<span class="invalid-feedback">{{ $message }}</span>
							@enderror
						</div>

						{{-- Stripe Payment Reminder --}}
						<div class="alert alert-info">
							<i class="fas fa-credit-card"></i>
							A payment will be required to complete submission.
						</div>

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

						<button type="submit" class="btn btn-primary w-100">Proceed to Payment</button>
					</form>
				</div>
			</div>

			<div class="mt-4">
				<a href="{{ url()->previous() }}" class="btn btn-link">← Back</a>
			</div>
		</div>
	</div>
</div>
@endsection