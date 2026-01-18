<?php

namespace App\Http\Controllers;

use App\Models\Vote;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class VoteController extends Controller
{
    public function store(Request $request)
    {
        $validated = $request->validate([
            'target_type' => ['required', 'string', 'in:incident'],
            'target_id'   => ['required', 'string'],
            'vote_value'  => ['required', 'in:support,oppose'],
        ]);

        /** @var \App\Models\User $user */
        $user = Auth::user();

        // Pricing policy (incident votes)
        $cost = config('pricing.vote.incident');

        // Authoritative credit check
        if ($user->credits_comment < $cost) {
            return redirect()->back()->with(
                'error',
                'You need to purchase comment credits to vote.'
            );
        }

        // Record vote (append-only ledger)
        Vote::create([
            'user_id'     => $user->id,
            'target_type' => $validated['target_type'],
            'target_id'   => $validated['target_id'],
            'vote_value'  => $validated['vote_value'],
            'cost'        => $cost,
            'purpose'     => 'Vote on incident',
        ]);

        // Debit credits (explicit math, no helpers)
        $user->credits_comment -= $cost;
        $user->save();

        return redirect()->back()->with(
            'success',
            'Your vote has been recorded.'
        );
    }
}
