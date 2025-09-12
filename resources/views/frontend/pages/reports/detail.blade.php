@extends('frontend.layouts.master')

@section('title','Sexual Misconduct Report || PRODUCT PAGE')

@section('main-content')
<!-- Breadcrumbs -->
<div class="breadcrumbs">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="bread-inner">
          <ul class="bread-list">
            <li><a href="/">Home<i class="ti-arrow-right"></i></a></li>
            <li class="active"><a href="#">Report detail</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
@if(session('success'))
<div class="alert alert-success">
  {{ session('success') }}
</div>
@endif

@if(session('error'))
<div class="alert alert-danger">
  {{ session('error') }}
</div>
@endif
<!-- End Breadcrumbs -->
<section class="shop single section">
  <div class="container py-4" data-aos="fade-up">
    <div class="row">
      <!-- Main Content -->
      <div class="col-lg-7">
        <h5 class="mb-3"><i class="fa fa-address-card-o" aria-hidden="true"></i> Sexual Misconduct Report <u>#{{$report->report_number}}</u></h5>

        <div class="card mb-3 shadow-sm">
          <div class="card-header bg-danger text-white"><i class="fa fa-info-circle" aria-hidden="true"></i> Incident Details</div>
          <div class="card-body">
            @if($report->alternate_reporter_name)
            <p><strong>Reporter name:</strong> {{$report->alternate_reporter_name}}</p>
            @else
            <p><strong>Reporter name:</strong> {{$report->reporter_name}}</p>
            @endif
            <p><strong>Type:</strong> {{$report->type_event}}</p>
            <p><strong>Date of Event:</strong> {{$report->event_date}}</p>
            <p><strong>Location of Event:</strong> {{$report->event_city}}, {{$report->event_state }}, {{$report->event_zipcode }}, {{$report->event_country }}</p>
            <hr>
            <p><strong>Subject name:</strong> {{$report->subject_fullname}}</p>
            <p><strong>Subject address:</strong> {{$report->subject_city}}, {{$report->subject_state}}, {{$report->subject_zipcode}}, {{$report->subject_country}}</p>
            <hr>
            <p><strong>Description:</strong></p>
            <p>{{$report->description}}</p>
            <hr>
            @if($report->video_link)
            <p><strong>Video Evidence link:</strong> <a href="{{$report->video_link}}" target="_blank" title="View Video" style="color:#007bff"><u>View Video</u></a></p>
            @endif
            <br />
            @if ($report->letter_path)
            <div class="mb-3">
              <label class="fw-bold">Letter to Subject:</label>
              <a href="{{ asset('storage/' . $report->letter_path) }}" target="_blank" style="color:#007bff">
                📄 View Letter
              </a>
            </div>
            @endif
            <br />
            @if($report->video_path)
            <div class="card mb-4">
              <div class="card-header fw-bold">Video Evidence</div>
              <div class="card-body">
                <video class="w-100 rounded shadow" controls>
                  <source src="{{ asset('storage/' . $report->video_path) }}" type="video/mp4">
                  Your browser does not support the video tag.
                </video>
              </div>
            </div>
            @endif
          </div>
        </div>

        @if(count($report_response)>0)
        @foreach($report_response as $response)
        <div class="card mb-3 shadow-sm">

          @if($response->type == "reporter_reply")
          <div class="card-header bg-info text-white">
            <i class="fa fa fa-reply" aria-hidden="true"></i> Reporter's Reply
          </div>
          @else
          <div class="card-header bg-secondary text-white">
            <i class="fa fa-user-circle-o" aria-hidden="true"></i> Subject's Response
          </div>
          @endif


          <div class="card-body">
            <p><strong>Date of Reply:</strong> {{$response->created_at}}</p>
            @if($response->type == "subject_responses")
            <p><strong>Subject Name:</strong> {{$response->user_fullname}}</p>
            @endif
            <p>{{$response->content}}</p>
            @if($response->file_path)
            <p>
              <a href="{{ Storage::url($response->file_path) }}" target="_blank" class="text-primary text-decoration-underline">
                Additional Evidence
              </a>
            </p>
            @endif
          </div>
        </div>

        @endforeach
        @endif




        <div class="mt-4">
          @auth
          @if(auth()->id() === $report->reporter_id)
          <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#reporterReplyModal" data-type="reporter_reply">
            Post Reply ($49)
          </button>
          @else
          <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#subjectResponsesModal" data-type="subject_responses">
            Post Response ($49)
          </button>
          @endif
          @else

          <p class="text-danger" style="font-size: 17px;">
            If you are the reported subject, please <a href="{{ route('login.form') }}" style="color:#007bff"><b>LOGIN</b></a> to post a response.
          </p>
          @endauth
        </div>
        <br />

        <!-- Subject Response Modal -->
        <div class="modal fade" id="subjectResponsesModal" tabindex="-1" aria-hidden="true">
          <div class="modal-dialog">
            <form method="POST" action="{{ route('user.subject-responses.submit', $report->report_number) }}" enctype="multipart/form-data">
              @csrf
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Post Your Response</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                  <textarea name="response_text" class="form-control mb-3" rows="4" placeholder="Write your response..." required></textarea>

                  <label for="response_file" class="form-label"><strong>Upload Evidence File (optional)</strong></label>
                  <input type="file" name="response_file" class="form-control mt-3">
                </div>
                <div class="modal-footer">
                  <button type="submit" class="btn btn-primary">Submit & Pay ($49)</button>
                </div>
              </div>
            </form>
          </div>
        </div>

        <!-- Reporter Reply Modal -->
        <div class="modal fade" id="reporterReplyModal" tabindex="-1" aria-hidden="true">
          <div class="modal-dialog">
            <form method="POST" action="{{ route('user.reporter-reply.submit', $report->id) }}" enctype="multipart/form-data">
              @csrf
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Reporter Reply</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                  <textarea class="form-control mb-3" name="content" rows="10" required placeholder="Write your response..."></textarea>

                  <label for="response_file" class="form-label"><strong>Upload Evidence File (optional)</strong></label>
                  <input type="file" class="form-control" id="response_file" name="response_file">
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  <button type="submit" class="btn btn-primary">Submit & Pay ($49)</button>
                </div>
              </div>
            </form>
          </div>
        </div>

      </div>


      @if($report->responses && $report->responses->count())
      <div class="mt-6 p-4 border rounded bg-gray-50">
        <h3 class="text-lg font-semibold mb-3">Subject Responses</h3>
        @foreach($report->responses as $response)
        <div class="mb-4 p-3 border-b last:border-0">
          <p><strong>Submitted by:</strong> {{ $response->user->name ?? 'Unknown User' }}</p>
          <p><strong>Date:</strong> {{ $response->created_at->format('M d, Y H:i') }}</p>
          <p><strong>Status:</strong>
            @if($response->is_paid)
            <span class="text-green-600">Paid</span>
            @else
            <span class="text-red-600">Unpaid</span>
            @endif
          </p>
          <p class="mt-2">{{ $response->content }}</p>
          @if($response->file_path)
          <p class="mt-2">
            <a href="{{ asset('storage/' . $response->file_path) }}"
              target="_blank"
              class="text-blue-600 underline">Download Attachment</a>
          </p>
          @endif
        </div>
        @endforeach
      </div>
      @endif

      <!-- Comment & Vote Section -->
      <div class="col-lg-5">
        <div class="sticky-top-custom">
          <h5 class="mb-3"> <i class="fa fa-commenting-o" aria-hidden="true"></i> Community Comments</h5>
          @if(count($report_comments)>0)
          <div class="card comment-section p-3 shadow-sm">

            @foreach($report_comments as $comment)
            <div class="mb-3">
              <strong>{{$comment->user_fullname}}</strong> <small class="text-muted">({{$comment->created_at}})</small>
              <p>{{$comment->content}}</p>
            </div>
            <hr>
            @endforeach


          </div>
          @endif
          @if ($errors->any())
          <div class="alert alert-danger">
            <ul class="mb-0">
              @foreach ($errors->all() as $error)
              <li>{{ $error }}</li>
              @endforeach
            </ul>
          </div>
          @endif
          <div class="mt-3">
            @auth
            @if(auth()->user()->credits_comment > 0)
            <!-- Cho phép comment -->
           <form action="{{ route('user.comments.submit', $report->id) }}" method="POST">
    @csrf
    <textarea name="content" class="form-control mb-3" rows="4" placeholder="Write your comment..." required></textarea>

    <div class="form-check mt-3">
        <input class="form-check-input" type="checkbox" name="acknowledge" id="acknowledge" value="1" required>
        <label class="form-check-label" for="acknowledge">
            I acknowledge that I, {{ Auth::user()->name ?? "this user" }}, wrote this comment and stand behind every factual statement made herein.
        </label>
    </div>

    <button type="submit" class="btn btn-primary">Submit Comment</button>
</form>

            @else
            <!-- Không đủ lượt, hiển thị modal mua -->
            <textarea class="form-control mb-2" rows="3" placeholder="You must buy comment credits to comment..." disabled></textarea>
            <button class="btn btn-warning btn-sm w-100" data-bs-toggle="modal" data-bs-target="#buyCommentModal">
              Buy Comment Credits
            </button>
            @endif
            @else
            <p class="text-danger">
              Please <a href="{{ route('login.form') }}" class="fw-bold text-decoration-underline" style="color:#007bff">LOGIN</a> to comment.
            </p>
            @endauth
          </div>
        </div>
      </div>
    </div>
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

  <div class="modal fade" id="buyCommentModal" tabindex="-1" aria-labelledby="buyCommentModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <form action="{{ route('user.buycomments.submit', $report->id) }}" method="POST">
        @csrf
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Purchase Comment/Vote Credits</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <p>The Fee to Post a Comment and/or a Vote is $0.50 each.</p>
            <select name="package" required>
              <option value="1">1 comment - $0.50</option>
              <option value="25">25 comments - $12.25</option>
              <option value="100">100 comments - $49.00</option>
            </select>
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-primary">Pay with Stripe</button>
          </div>
        </div>
      </form>
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

  .sticky-top-custom {
    position: sticky;
    top: 10px;
  }
</style>
@endpush
@push('scripts')
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
@endpush