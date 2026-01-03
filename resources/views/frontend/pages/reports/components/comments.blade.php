<div class="sticky-top-custom">
    <h5 class="mb-3">
        <i class="fa fa-commenting-o"></i> Community Comments
    </h5>

    @if($report_comments->count() > 0)
    <div class="card comment-section p-3 shadow-sm mb-3">
        @foreach($report_comments as $comment)
        <div class="mb-3">
            <strong>{{ $comment->user_fullname }}</strong>
            <small class="text-muted">
                ({{ $comment->created_at->format('M d, Y H:i') }})
            </small>
            <p class="mb-0">{{ $comment->content }}</p>
        </div>
        @if(!$loop->last)
        <hr>
        @endif
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
        <form action="{{ route('user.comments.submit', $report->id) }}" method="POST">
            @csrf

            <textarea
                name="content"
                class="form-control mb-3"
                rows="4"
                placeholder="Write your comment..."
                required></textarea>

            <div class="form-check mb-3">
                <input
                    class="form-check-input"
                    type="checkbox"
                    name="acknowledge"
                    value="1"
                    required>
                <label class="form-check-label">
                    I acknowledge that I, {{ auth()->user()->name }},
                    wrote this comment and stand behind every factual statement.
                </label>
            </div>

            <button type="submit" class="btn btn-primary w-100">
                Submit Comment
            </button>
        </form>
        @else
        <textarea
            class="form-control mb-2"
            rows="3"
            disabled
            placeholder="You must buy comment credits to comment..."></textarea>

        <button
            class="btn btn-warning btn-sm w-100"
            data-toggle="modal"
            data-target="#buyCommentModal">
            Buy Comment Credits
        </button>

        @endif
        @else
        <p class="text-danger">
            Please
            <a href="{{ route('login.form') }}"
                class="fw-bold text-decoration-underline">
                LOGIN
            </a>
            to comment.
        </p>
        @endauth
    </div>
</div>