@extends('frontend.layouts.master')

@section('title','Post to the Database || PRODUCT PAGE')

@section('main-content')
<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="bread-inner">
                    <ul class="bread-list">
                        <li><a href="/">Home<i class="ti-arrow-right"></i></a></li>
                        <li class="active"><a href="#">Post to the Database</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Breadcrumbs -->
<section class="shop single section">
    <div class="container">
        <h3 class="mb-4">📢 Submit a Sexual Misconduct Report</h3>

        <form action="{{ route('user.add-report') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="card mb-3">
                <div class="card-header" style="font-weight: bold;text-transform: uppercase;color:#3F8DDB">
                    Reporter Information
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <label style="font-weight: bold;padding-bottom:10px;">Your Full Name <span class="text-danger">*</span></label>
                        <div class="row g-3">
                            <div class="col-md-12">
                                <input type="text" class="form-control" value="{{ Auth::user()->name }}" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label style="font-weight: bold;padding-bottom:10px;">Email (private) <span class="text-danger">*</span></label>
                        <div class="row g-3">
                            <div class="col-md-12">
                                <input type="email" class="form-control" value="{{ Auth::user()->email }}" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label style="font-weight: bold;padding-bottom:10px;">Alternate Reporter Name (optional)</label>
                        <div class="row g-3">
                            <div class="col-md-12">
                                <input type="text" name="alternate_reporter_name" class="form-control" value="{{ old('alternate_reporter_name') }}">
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="card mb-3">
                <div class="card-header" style="font-weight: bold;text-transform: uppercase;color:#3F8DDB">
                    Subject (Person who Committed Sexual Misconduct)
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <label style="font-weight: bold;padding-bottom:10px;">Subject's Full Name <span class="text-danger">*</span></label>
                        <div class="row g-3">
                            <div class="col-md-12">
                                <input type="text" placeholder="Name of Subject *" name="subject_fullname" class="form-control" value="{{ old('subject_fullname') }}" required>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label style="font-weight: bold;padding-bottom:10px;">Subject's Phone Number </label>
                        <div class="row g-3">
                            <div class="col-md-12">
                                <input type="text" placeholder="Phone Number" name="subject_phone" class="form-control" value="{{ old('subject_phone') }}">
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label style="font-weight: bold;padding-bottom:10px;">Subject's Email </label>
                        <div class="row g-3">
                            <div class="col-md-12">
                                <input type="text" placeholder="Email" name="subject_email" class="form-control" value="{{ old('subject_email') }}">
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label style="font-weight: bold;padding-bottom:10px;">Subject's Location<span class="text-danger">*</span></label>
                        <div class="row g-3">
                            <div class="col-md-7">
                                <input type="text" placeholder="Address *" name="subject_address" id="subject_address" class="form-control" value="{{ old('subject_address') }}" required>
                                @error('subject_address') <div class="invalid-feedback">{{ $message }}</div> @enderror
                            </div>
                            <div class="col-md-5"><input type="text" name="subject_city" id="subject_city" class="form-control" value="{{ old('subject_city') }}" placeholder="City *" required></div>
                            <div class="col-md-5"><input type="text" name="subject_state" id="subject_state" class="form-control" value="{{ old('subject_state') }}" placeholder="State *" required></div>
                            <div class="col-md-2"><input type="text" name="subject_zipcode" id="subject_zipcode" class="form-control" value="{{ old('subject_zipcode') }}" placeholder="Zip Code *" required></div>
                            <div class="col-md-5"><input type="text" name="subject_country" id="subject_country" class="form-control" value="{{ old('subject_country') }}" placeholder="Country *" required></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card mb-3">
                <div class="card-header" style="font-weight: bold;text-transform: uppercase;color:#3F8DDB">
                    Incident Details
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <label style="font-weight: bold;padding-bottom:10px;">Type of Event <span class="text-danger">*</span></label>
                        <div class=" row g-3">
                            <div class="col-md-3">
                                <select class=" @error('type_event') is-invalid @enderror" name="type_event" required>
                                    <option selected disabled>Type of Incident *</option>
                                    <option value="Rape" {{ old('type_event') == 'Rape' ? 'selected' : '' }}>Rape</option>
                                    <option value="Sexual Assault" {{ old('type_event') == 'Sexual Assault' ? 'selected' : '' }}>Sexual Assault</option>
                                    <option value="Sexual Abuse" {{ old('type_event') == 'Sexual Abuse' ? 'selected' : '' }}>Sexual Abuse</option>
                                    <option value="Sexual Harassment" {{ old('type_event') == 'Sexual Harassment' ? 'selected' : '' }}>Sexual Harassment</option>
                                </select>
                            </div>
                        </div>
                        @error('type_event') <div class="invalid-feedback">{{ $message }}</div> @enderror

                    </div>
                    <div style="clear:both;"></div>
                    <div class="mb-3">
                        <label style="font-weight: bold;padding-bottom:10px;">Location of Event <span class="text-danger">*</span></label>

                        <div class="row g-3">
                            <div class="col-md-7">
                                <input type="text" placeholder="Address *" name="event_address" id="event_address" class="form-control" value="{{ old('event_address') }}" required>
                                @error('event_address') <div class="invalid-feedback">{{ $message }}</div> @enderror
                            </div>
                            <div class="col-md-5"><input type="text" name="event_city" id="event_city" class="form-control" value="{{ old('event_city') }}" placeholder="City *" required=""></div>
                            <div class="col-md-5"><input type="text" name="event_state" id="event_state" class="form-control" value="{{ old('event_state') }}" placeholder="State *" required=""></div>
                            <div class="col-md-2"><input type="text" name="event_zipcode" id="event_zipcode" class="form-control" value="{{ old('event_zipcode') }}" placeholder="Zip Code *" required=""></div>
                            <div class="col-md-5"><input type="text" name="event_country" id="event_country" class="form-control" value="{{ old('event_country') }}" placeholder="Country *" required=""></div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label style="font-weight: bold;padding-bottom:10px;">Date of Event <span class="text-danger">*</span></label>
                        <div class="row g-3">
                            <div class="col-md-3">
                                <input type="date" name="event_date" class="form-control @error('event_date') is-invalid @enderror" value="{{ old('event_date') }}" required>
                                @error('event_date') <div class="invalid-feedback">{{ $message }}</div> @enderror
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label style="font-weight: bold;padding-bottom:10px;">Detailed Description <span class="text-danger">*</span></label>
                        <div class="row g-3">
                            <div class="col-md-12">
                                <textarea name="description" class="form-control @error('description') is-invalid @enderror" rows="5" required>{{ old('description') }}</textarea>
                                @error('description') <div class="invalid-feedback">{{ $message }}</div> @enderror
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label style="font-weight: bold;padding-bottom:10px;">Video Evidence Link (optional)</label>
                        <div class="row g-3">
                            <div class="col-md-12">
                                <input type="url" name="video_link" id="video_link" class="form-control @error('video_link') is-invalid @enderror" value="{{ old('video_link') }}">
                                @error('video_link') <div class="invalid-feedback">{{ $message }}</div> @enderror
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Upload Video File Statement (optional + Fee $29)</label>
                        <div class="d-flex align-items-center gap-2">
                            <input type="file" class="form-control" name="video_file" accept="video/*" id="video_file">
                            <button type="button" id="clearVideo" class="btn btn-sm btn-outline-danger  d-none" style="font-size:7px">❌ Remove</button>
                        </div>
                        <small class="form-text text-muted">
                            Optional: You may upload a video file (maximum 100MB). An additional fee of <b>$29</b> will apply if a video is attached.
                        </small><br />
                        <small id="videoWarning" class="form-text text-danger d-none">
                            ⚠️ The selected video exceeds 100MB. Please choose a smaller file.
                        </small>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Upload Letter to Subject (optional + Fee $29)</label>
                        <div class="d-flex align-items-center gap-2">
                            <input type="file" class="form-control" name="letter_file" accept=".pdf,.doc,.docx" id="letter_file">
                            <button type="button" id="clearLetter" class="btn btn-sm btn-outline-danger  d-none" style="font-size:7px">❌ Remove</button>
                        </div>
                        <small id="letterHelp" class="form-text text-muted">
                            You may upload a formal letter (PDF/DOC maximum 10MB) to be physically mailed to the Subject's address. A separate fee of <b>$29</b> applies.
                        </small>
                        <small id="letterWarning" class="form-text text-danger d-none">
                            ⚠️ Letter file is too large. Maximum allowed is 10MB.
                        </small>
                    </div>
                </div>
            </div>

            <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input @error('confirmation') is-invalid @enderror" name="confirmation" id="confirmation" required>
                <label class="form-check-label" for="confirmation">
                    I confirm that the above information is true and accurate.
                </label>
                @error('confirmation') <div class="invalid-feedback">{{ $message }}</div> @enderror
            </div>
            <div class="mb-3">
                <label class="fw-bold">Total Fee:</label>
                <p id="totalFee" class="fs-5 text-primary fw-semibold">$49</p>
            </div>
            <button type="submit" class="btn btn-danger btn-lg">Pay <span id="payAmount">$49</span> & Submit Report</button>
        </form>
        <br />
        <center>(Payments are made through the Stripe Payment Platform, so the Prices stated above are subject to an additional 3% plus 30 cents per Transaction to cover Stripe’s Fees. --- So: -- $49.00 = $50.77, actual; -- $12.25 = $12.92, actual; -- $29.00 = $30.17, actual; -- and, finally -- $300 = $309.30, actual.)</center>
        <br />
        <div class="small mt-4" style="background-color: #fff3cd;padding:10px;">
            <strong>⚠️ Refund Policy:</strong><br>
            <ul class="mb-0 ps-3">
                <li>❌ <strong>No refunds</strong> will be issued for submitted <strong>Reports (Posts)</strong></li>
                <li>❌ <strong>No refunds</strong> for uploaded <strong>Videos</strong></li>
                <li>❌ <strong>No refunds</strong> for <strong>Physical Letters</strong> sent to Subjects</li>
                <li>❌ <strong>No refunds</strong> for <strong>Comment Credits</strong>, whether used or unused</li>
            </ul>
            Please review your submission and selections carefully before paying.
        </div>
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
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const videoInput = document.getElementById('video_file');
        const letterInput = document.getElementById('letter_file');
        const clearVideoBtn = document.getElementById('clearVideo');
        const clearLetterBtn = document.getElementById('clearLetter');
        const videoWarning = document.getElementById('videoWarning');
        const letterWarning = document.getElementById('letterWarning');
        const totalFeeDisplay = document.getElementById('totalFee');
        const payAmountSpan = document.getElementById('payAmount');

        const baseFee = 49,
            videoFee = 29,
            letterFee = 29;
        const maxVideoSize = 104857600; // 100MB
        const maxLetterSize = 10485760; // 10MB

        function updateFee() {
            let total = baseFee;
            let parts = [];

            const videoOk = videoInput.files.length && videoInput.files[0].size <= maxVideoSize;
            const letterOk = letterInput.files.length && letterInput.files[0].size <= maxLetterSize;

            if (videoOk) {
                total += videoFee;
                parts.push(`$${videoFee}`);
            }
            if (letterOk) {
                total += letterFee;
                parts.push(`$${letterFee}`);
            }

            totalFeeDisplay.textContent = parts.length > 0 ?
                `$${baseFee} + ${parts.join(' + ')} = $${total}` :
                `$${baseFee}`;
            payAmountSpan.textContent = `$${total}`;
        }

        videoInput?.addEventListener('change', function() {
            if (videoInput.files[0]?.size > maxVideoSize) {
                videoWarning.classList.remove('d-none');
                videoInput.value = '';
                clearVideoBtn.classList.add('d-none');
            } else {
                videoWarning.classList.add('d-none');
                clearVideoBtn.classList.remove('d-none');
            }
            updateFee();
        });

        letterInput?.addEventListener('change', function() {
            if (letterInput.files[0]?.size > maxLetterSize) {
                letterWarning.classList.remove('d-none');
                letterInput.value = '';
                clearLetterBtn.classList.add('d-none');
            } else {
                letterWarning.classList.add('d-none');
                clearLetterBtn.classList.remove('d-none');
            }
            updateFee();
        });

        clearVideoBtn?.addEventListener('click', () => {
            videoInput.value = '';
            clearVideoBtn.classList.add('d-none');
            updateFee();
        });

        clearLetterBtn?.addEventListener('click', () => {
            letterInput.value = '';
            clearLetterBtn.classList.add('d-none');
            updateFee();
        });

        updateFee(); // Init on page load
    });
</script>
@endpush