<?php

namespace Database\Seeders\Users;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\User;

/**
 * DemoUsersSeeder
 *
 * Creates a deterministic pool of non-privileged users used by
 * demo and scenario seeders.
 *
 * - Idempotent
 * - Non-destructive
 * - No implicit authority assignment
 * - Safe to re-run on every reset
 */
class DemoUsersSeeder extends Seeder
{
    public function run(): void
    {
        // Primary demo actors
        $this->ensureUser(
            email: 'aiden.brooks@demo.local',
            name: 'Aiden Brooks'
        );

        $this->ensureUser(
            email: 'trevor.hollowell@demo.local',
            name: 'Trevor Hollowell'
        );

        // Rotating community commenter pool
        foreach (range(1, 5) as $i) {
            $this->ensureUser(
                email: "commenter{$i}@demo.local",
                name: "Community Member {$i}"
            );
        }
    }

    protected function ensureUser(string $email, string $name): User
    {
        return User::firstOrCreate(
            ['email' => $email],
            [
                'name'     => $name,
                // Password is deterministic but irrelevant for demos
                'password' => Hash::make('password'),
            ]
        );
    }
}
