<div class="text-center">
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
        <p class="mb-0">
            Your current vote: <strong>{{ $currentVote }}</strong>
        </p>
    @else
        <p class="mb-0">
            You have not voted yet.
        </p>
    @endif

    <p class="text-muted mt-2 mb-0">
        Voting enabled: {{ $canVote ? 'yes' : 'no' }}
    </p>
</div>
