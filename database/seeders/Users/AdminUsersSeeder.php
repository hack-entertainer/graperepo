<?php

namespace Database\Seeders\Users;

use App\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;

class AdminUsersSeeder extends Seeder
{
    public function run(): void
    {
        $email = env('RRDB_ADMIN_EMAIL');

        // Hard safety gate: do nothing unless explicitly configured
        if (! $email) {
            return;
        }

        $name = env('RRDB_ADMIN_NAME', 'Administrator');
        $password = env('RRDB_ADMIN_PASSWORD');

        $user = User::where('email', $email)->first();

        if (! $user) {
            if (! $password) {
                Log::warning(
                    'AdminUsersSeeder skipped admin creation: RRDB_ADMIN_PASSWORD not set.',
                    ['email' => $email]
                );
                return;
            }

            if (! str_contains(trim($name), ' ')) {
                Log::warning(
                    'AdminUsersSeeder skipped admin creation: RRDB_ADMIN_NAME must include first and last name.',
                    ['email' => $email, 'name' => $name]
                );
                return;
            }

            $user = User::create([
                'name'     => $name,
                'email'    => $email,
                'password' => Hash::make($password),
            ]);
        }


        // Assert system role (idempotent, env-gated)
        DB::table('system_roles')->updateOrInsert(
            ['user_id' => $user->id],
            ['role' => 'admin']
        );
    }
}
