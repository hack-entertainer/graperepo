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
            // Short description used in headers / compact UI
            'short_des'  => 'RRDB — Reporting & Review Database',

            // Long-form description used in admin pages / about sections
            'description' =>
            'RRDB is a reporting and review platform designed to support '
                . 'structured submissions, responses, and community commentary. '
                . 'This configuration represents the initial system bootstrap '
                . 'and is expected to be edited by administrators.',

            // Optional hero / site image (left null until CMS is improved)
            'photo' => null,

            // Public-facing contact metadata
            'address' => 'Address not yet configured',
            'phone'   => 'Phone number not yet configured',
            'email'   => 'contact@example.com',

            // Logo asset (path or URL; null until asset pipeline is finalized)
            'logo' => null,
        ]);
    }
}
