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

    <div class="d-flex justify-content-center gap-2 mt-3">

        {{-- Support --}}
        <form method="POST" action="{{ route('votes.store') }}">
            @csrf

            <input type="hidden" name="target_type" value="report">
            <input type="hidden" name="target_id" value="{{ $report->id }}">
            <input type="hidden" name="vote_value" value="support">
            <input type="hidden" name="purpose" value="{{ $purpose }}">

            <!-- <button
                type="submit"
                class="btn btn-outline-success"
                @disabled(! $canVote)>
                Support
            </button> -->
            <button
                type="submit"
                class="btn btn-outline-success"
                onclick="alert('clicked')"
                @disabled(! $canVote)>
                Support
            </button>

        </form>

        {{-- Oppose --}}
        <form method="POST" action="{{ route('votes.store') }}">
            @csrf

            <input type="hidden" name="target_type" value="report">
            <input type="hidden" name="target_id" value="{{ $report->id }}">
            <input type="hidden" name="vote_value" value="oppose">
            <input type="hidden" name="purpose" value="{{ $purpose }}">

            <button
                type="submit"
                class="btn btn-outline-danger"
                @disabled(! $canVote)>
                Oppose
            </button>
        </form>

    </div>

    {{-- Explicit state indicator --}}
    <p class="text-muted mt-3 mb-0">
        Voting enabled: {{ $canVote ? 'yes' : 'no' }}
    </p>

</div>