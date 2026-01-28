<?php

namespace App\Http\Controllers;

use App\Models\Vote;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class VoteController extends Controller
{
    public function store(Request $request)
    {
        // Auth is required
        if (! Auth::check()) {
            abort(403);
        }

        $validated = $request->validate([
            'target_type' => ['required', 'string'],
            'target_id'   => ['required', 'string'],
            'vote_value'  => ['required', 'in:support,oppose'],
            'purpose'     => ['required', 'string'],
        ]);

        /** @var \App\Models\User $user */
        $user = Auth::user();

        // Pricing policy (incident votes)
        $cost = config('pricing.vote.incident');

        // Credit check
        if ($user->credits_comment < $cost) {
            return back()->with('vote_debug', [
                'error' => 'insufficient_credits',
                'required' => $cost,
                'available' => $user->credits_comment,
            ]);
        }

        // Append-only vote ledger
        Vote::create([
            'user_id'     => $user->id,
            'target_type' => $validated['target_type'],
            'target_id'   => $validated['target_id'],
            'vote_value'  => $validated['vote_value'],
            'cost'        => $cost,
            'purpose'     => $validated['purpose'],
        ]);

        // Debit credits
        $user->credits_comment -= $cost;
        $user->save();

        return back()->with('vote_debug', [
            'status' => 'recorded',
            'vote' => $validated['vote_value'],
            'remaining_credits' => $user->credits_comment,
        ]);
    }
}
