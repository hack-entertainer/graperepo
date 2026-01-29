<div class="text-center">

    {{-- Debug feedback after POST --}}
    @if (session('vote_debug'))
    <div class="alert alert-info mb-3">
        <strong>Vote POST received</strong>
        <pre class="mb-0">{{ json_encode(session('vote_debug'), JSON_PRETTY_PRINT) }}</pre>
    </div>
    @endif

    <p class="mb-1">
        <strong>Community Signal</strong>
    </p>

    <p class="text-muted mb-2">
        Purpose: {{ $purpose }}
    </p>

    <p class="text-muted mb-2">
        Reason: {{ $reason }}
    </p>

    @if ($currentVote)
    <p class="mb-2">
        Your current vote:
        <strong>{{ ucfirst($currentVote) }}</strong>
    </p>
    @else
    <p class="mb-2">
        You have not voted yet.
    </p>
    @endif

    {{-- Voting interaction --}}
    @if (! $canVote)

    <p class="text-muted mt-3">
        Log in to participate.
    </p>

    @elseif (! $canAffordVote)

    <p class="text-muted mt-3 mb-2">
        Voting requires {{ $voteCost }} comment credits.
    </p>

    <button
        type="button"
        class="btn btn-warning"
        data-toggle="modal"
        data-target="#buyVoteCreditsModal">
        Buy {{ $voteCreditDeficit }} Credit{{ $voteCreditDeficit === 1 ? '' : 's' }} to Vote
    </button>

    @else

    <div class="d-flex justify-content-center gap-2 mt-3">

        <form method="POST" action="{{ route('votes.store') }}">
            @csrf
            <input type="hidden" name="target_type" value="report">
            <input type="hidden" name="target_id" value="{{ $report->id }}">
            <input type="hidden" name="vote_value" value="support">
            <input type="hidden" name="purpose" value="{{ $purpose }}">
            <button type="submit" class="btn btn-outline-success">
                Support
            </button>
        </form>

        <form method="POST" action="{{ route('votes.store') }}">
            @csrf
            <input type="hidden" name="target_type" value="report">
            <input type="hidden" name="target_id" value="{{ $report->id }}">
            <input type="hidden" name="vote_value" value="oppose">
            <input type="hidden" name="purpose" value="{{ $purpose }}">
            <button type="submit" class="btn btn-outline-danger">
                Oppose
            </button>
        </form>

    </div>

    @endif

</div>