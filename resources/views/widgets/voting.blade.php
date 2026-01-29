<div class="card shadow-sm mb-4">
    <div class="card-header bg-light">
        <strong>Community Signal</strong>
    </div>

    <div class="card-body text-center">

        {{-- Current vote status --}}
        @if ($currentVote)
        <p class="mb-2">
            Your current position:
            <strong>{{ ucfirst($currentVote) }}</strong>
        </p>
        @else
        <p class="text-muted mb-2">
            You have not recorded a vote.
        </p>
        @endif

        {{-- Interaction states --}}
        @if (! $canVote)

        <p class="text-muted mt-3 mb-0">
            Please log in to participate.
        </p>

        @elseif (! $canAffordVote)

        <p class="text-muted mt-3 mb-2">
            Voting requires {{ $voteCost }} comment credits.
        </p>

        <button
            type="button"
            class="btn btn-warning btn-sm"
            data-toggle="modal"
            data-target="#buyVoteCreditsModal">
            Purchase {{ $voteCreditDeficit }} Credit{{ $voteCreditDeficit === 1 ? '' : 's' }}
        </button>

        @else

        <div class="d-flex justify-content-center gap-2 mt-3">

            <form method="POST" action="{{ route('votes.store') }}">
                @csrf
                <input type="hidden" name="target_type" value="report">
                <input type="hidden" name="target_id" value="{{ $report->id }}">
                <input type="hidden" name="vote_value" value="support">
                <input type="hidden" name="purpose" value="{{ $purpose }}">

                <button type="submit" class="btn btn-outline-success btn-sm">
                    Support
                </button>
            </form>

            <form method="POST" action="{{ route('votes.store') }}">
                @csrf
                <input type="hidden" name="target_type" value="report">
                <input type="hidden" name="target_id" value="{{ $report->id }}">
                <input type="hidden" name="vote_value" value="oppose">
                <input type="hidden" name="purpose" value="{{ $purpose }}">

                <button type="submit" class="btn btn-outline-danger btn-sm">
                    Oppose
                </button>
            </form>

        </div>

        @endif

        {{-- Procedural note --}}
        <p class="text-muted mt-3 mb-0" style="font-size: 0.9em;">
            Votes are advisory and do not determine outcomes.
        </p>

    </div>
</div>