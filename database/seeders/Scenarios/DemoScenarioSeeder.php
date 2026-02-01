<?php

namespace Database\Seeders\Scenarios;

use Illuminate\Database\Seeder;
use Database\Seeders\Users\DemoUsersSeeder;
use Database\Seeders\Scenarios\DemoVotesSeeder;
use App\Support\Scenarios\ReportScenarioBuilder;

/**
 * DemoScenarioSeeder
 *
 * Explicit, opt-in demo seeding.
 * Never wired into DatabaseSeeder.
 */
class DemoScenarioSeeder extends Seeder
{
    public function run(): void
    {
        // Ensure user pool exists
        $this->call(DemoUsersSeeder::class);

        // Materialize demo reports
        $scenarios = require __DIR__ . '/definitions/demo_reports.php';

        foreach ($scenarios as $scenario) {
            app(ReportScenarioBuilder::class)
                ->materialize($scenario);
        }

        // Seed advisory demo votes (depends on users + reports)
        $this->call(DemoVotesSeeder::class);
    }
}
