<?php

namespace Database\Seeders\Users;

use App\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

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
            // Creating a new admin user
            $user = User::create([
                'name'     => $name,
                'email'    => $email,
                'password' => $password
                    ? Hash::make($password)
                    : Hash::make(str()->random(64)),
            ]);
        }

        // Promote to admin if not already
        if ($user->role !== 'admin') {
            $user->role = 'admin';
            $user->save();
        }
    }
}
