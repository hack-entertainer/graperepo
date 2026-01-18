<?php

namespace Database\Seeders\Users;

use App\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class AdminUsersSeeder extends Seeder
{
    public function run(): void
    {
        $rawEmail = env('RRDB_ADMIN_EMAIL');

        // Explicit opt-in only
        if (! $rawEmail) {
            return;
        }

        $email = strtolower(trim($rawEmail));
        $name = env('RRDB_ADMIN_NAME', 'Administrator');
        $password = env('RRDB_ADMIN_PASSWORD');

        // Case-insensitive identity lookup
        $user = User::whereRaw('LOWER(email) = ?', [$email])->first();

        if (! $user) {
            if (! $password) {
                logger()->error(
                    'AdminUsersSeeder failed: RRDB_ADMIN_PASSWORD not set for new admin.',
                    ['email' => $email]
                );
                return;
            }

            if (! str_contains(trim($name), ' ')) {
                logger()->error(
                    'AdminUsersSeeder failed: RRDB_ADMIN_NAME must include first and last name.',
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

        // Assert admin authority only
        DB::table('system_roles')->updateOrInsert(
            ['user_id' => $user->id],
            ['role' => 'admin']
        );
    }
}
