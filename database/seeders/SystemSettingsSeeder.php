<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Settings;

class SystemSettingsSeeder extends Seeder
{
    public function run(): void
    {
        // This system currently assumes a singleton settings row.
        // If one exists, do nothing. Admins manage it via the UI.
        if (Settings::count() > 0) {
            return;
        }

        Settings::create([
            'short_des'  => 'RRDB — Reporting & Review Database',

            'description' =>
            'RRDB is a reporting and review platform designed to support '
                . 'structured submissions, responses, and community commentary. '
                . 'This configuration represents the initial system bootstrap '
                . 'and is expected to be edited by administrators.',

            // Sentinel placeholders (schema requires non-null)
            'photo' => 'unset',
            'logo'  => 'unset',

            'address' => 'Address not yet configured',
            'phone'   => 'Phone number not yet configured',
            'email'   => 'contact@example.com',
        ]);
    }
}
