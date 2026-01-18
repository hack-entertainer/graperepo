<div class="card mb-3 shadow-sm">
    <div class="card-header bg-light">
        <strong>{{ $purpose }}</strong>
    </div>

    <div class="card-body">

        @if ($latestVote)
        <p class="mb-1">
            Your latest vote:
            <strong>{{ ucfirst($latestVote->vote_value) }}</strong>
        </p>

        <p class="text-muted small mb-3">
            Cast on {{ $latestVote->created_at->format('M j, Y \\a\\t g:i A') }}.
            Only your <strong>most recent vote</strong> is counted.
        </p>
        @else
        <p class="text-muted small mb-3">
            You have not voted on this incident yet.
        </p>
        @endif

        @if (! $canVote)
        <p class="text-danger mb-2">
            {{ $reason }}
        </p>

        <button
            type="button"
            class="btn btn-warning btn-sm"
            data-toggle="modal"
            data-target="#buyCommentModal">
            Buy Comment Credits
        </button>
        @else
        <form method="POST" action="{{ route('votes.store') }}">
            @csrf

            <input type="hidden" name="target_type" value="{{ $targetType }}">
            <input type="hidden" name="target_id" value="{{ $targetId }}">

            <div class="btn-group" role="group">
                <button
                    type="submit"
                    name="vote_value"
                    value="support"
                    class="btn btn-success btn-sm">
                    Support
                </button>

                <button
                    type="submit"
                    name="vote_value"
                    value="oppose"
                    class="btn btn-danger btn-sm">
                    Oppose
                </button>
            </div>
        </form>

        <p class="text-muted small mt-2">
            Voting costs {{ $cost }} comment credits.
            You may vote again to change your position.
        </p>
        @endif

    </div>
</div>