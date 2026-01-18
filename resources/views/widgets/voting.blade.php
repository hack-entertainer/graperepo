<div class="border rounded p-4 space-y-3 bg-gray-50">

    <h3 class="font-semibold text-sm text-gray-700">
        {{ $purpose }}
    </h3>

    @if ($currentVote)
    <p class="text-sm text-gray-600">
        Your current vote: <strong>{{ ucfirst($currentVote) }}</strong>
    </p>
    @endif

    @if (! $canVote)
    <p class="text-sm text-gray-500">
        {{ $reason }}
    </p>
    @else
    <form method="POST" action="{{ route('votes.store') }}" class="flex gap-2">
        @csrf

        <input type="hidden" name="target_type" value="{{ $targetType }}">
        <input type="hidden" name="target_id" value="{{ $targetId }}">

        <button
            type="submit"
            name="vote_value"
            value="support"
            class="px-3 py-1 text-sm rounded bg-green-600 text-white hover:bg-green-700">
            Support
        </button>

        <button
            type="submit"
            name="vote_value"
            value="oppose"
            class="px-3 py-1 text-sm rounded bg-red-600 text-white hover:bg-red-700">
            Oppose
        </button>
    </form>

    <p class="text-xs text-gray-500">
        Voting costs {{ $cost }} comments.
    </p>
    @endif

</div>