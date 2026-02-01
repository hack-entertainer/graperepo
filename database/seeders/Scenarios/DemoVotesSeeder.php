<?php

namespace Database\Seeders\Scenarios;

use Illuminate\Database\Seeder;
use App\Models\Reports;
use App\User;
use App\Models\Vote;

class DemoVotesSeeder extends Seeder
{
    public function run(): void
    {
        // Only demo-origin reports
        $reports = Reports::where('origin_type', 'demo')->get();

        // All demo users (non-privileged assumption holds)
        $users = User::where('email', 'like', '%@demo.local')->get();

        foreach ($reports as $report) {
            foreach ($users as $user) {
                $this->seedVote($user, $report);
            }
        }
    }

    protected function seedVote(User $user, Reports $report): void
    {
        // Deterministic stance:
        // hash-based so it’s stable across runs
        $hash = crc32($user->email . $report->origin_key);
        $value = ($hash % 2 === 0) ? 'support' : 'oppose';

        Vote::firstOrCreate(
            [
                'user_id'     => $user->id,
                'target_type' => 'report',
                'target_id'   => $report->id,
            ],
            [
                'vote_value' => $value,
                'cost'       => 1,
                'purpose'    => 'demo_seed',
            ]
        );
    }
}
