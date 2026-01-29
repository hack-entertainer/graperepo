<div class="card shadow-sm mb-4">
    <div class="card-header bg-light text-center">
        <strong>Community Signal</strong>
    </div>

    <div class="card-body text-center">

        {{-- Status --}}
        @if ($currentVote)
        <p class="mb-2">
            Your current vote:
            <strong class="{{ $currentVote === 'support' ? 'text-success' : 'text-danger' }}">
                {{ ucfirst($currentVote) }}
            </strong>
        </p>
        @else
        <p class="text-muted mb-2">
            You have not voted yet.
        </p>
        @endif

        <p class="small text-muted mb-3">
            Advisory-only signal. Voting does not determine outcomes.
        </p>

        {{-- Interaction --}}
        @if (! $canVote)

        <p class="text-muted">
            Log in to participate.
        </p>

        @elseif (! $canAffordVote)

        <p class="text-muted mb-2">
            Voting requires <strong>{{ $voteCost }}</strong> comment credits.
        </p>

        <button
            type="button"
            class="btn btn-warning btn-sm"
            data-toggle="modal"
            data-target="#buyVoteCreditsModal">
            Buy {{ $voteCreditDeficit }} Credit{{ $voteCreditDeficit === 1 ? '' : 's' }}
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
    </div>
</div>