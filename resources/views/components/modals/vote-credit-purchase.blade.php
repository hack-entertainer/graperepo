<div class="modal fade"
    id="buyVoteCreditsModal"
    tabindex="-1"
    aria-labelledby="buyVoteCreditsModalLabel"
    aria-hidden="true">

    <div class="modal-dialog">
        <form method="POST"
            action="/user/user-reports/buy-comment-package/{{ $report->id }}">
            @csrf

            <input type="hidden" name="package" value="{{ $voteCreditDeficit }}">

            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="buyVoteCreditsModalLabel">
                        Purchase Vote Credits
                    </h5>
                    <button type="button"
                        class="btn-close"
                        data-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>

                <div class="modal-body">
                    <p>
                        Voting requires
                        <strong>{{ $voteCost }}</strong>
                        comment credits.
                    </p>

                    <p>
                        You currently have
                        <strong>{{ $currentCredits }}</strong>
                        credit{{ $currentCredits === 1 ? '' : 's' }}.
                    </p>

                    <hr>

                    <p class="mb-0">
                        This purchase will add
                        <strong>{{ $voteCreditDeficit }}</strong>
                        credit{{ $voteCreditDeficit === 1 ? '' : 's' }}
                        so you can cast your vote.
                    </p>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-warning w-100">
                        Buy {{ $voteCreditDeficit }} Credit{{ $voteCreditDeficit === 1 ? '' : 's' }} & Vote
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>