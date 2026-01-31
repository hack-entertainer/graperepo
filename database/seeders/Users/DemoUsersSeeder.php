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
 * Invariants:
 * - Idempotent
 * - Non-destructive (never updates existing users)
 * - No implicit authority assignment
 * - Safe to re-run on every reset
 */
class DemoUsersSeeder extends Seeder
{
    public function run(): void
    {
        // Primary demo actors
        $this->ensureUser('aiden.brooks@demo.local',  'Aiden Brooks');
        $this->ensureUser('trevor.hollowell@demo.local', 'Trevor Hollowell');

        // Second demo report actors
        $this->ensureUser('evan.morales@demo.local', 'Evan Morales');
        $this->ensureUser('priya.khatri@demo.local', 'Priya N. Khatri');

        $this->ensureUser('lena.whitfield@demo.local', 'Lena Whitfield');
        $this->ensureUser('marcus.rowe@demo.local', 'Marcus Rowe');
        $this->ensureUser('hannah.price@demo.local', 'Hannah Price');
        $this->ensureUser('michael.avery@demo.local', 'Michael Avery');
        $this->ensureUser('isabella.moreno@demo.local', 'Isabella Moreno');
        $this->ensureUser('roly.nelson@demo.local', 'Roly Nelson');
        $this->ensureUser('noah.feldman@demo.local', 'Noah Feldman');
        $this->ensureUser('caroline.whitfield@demo.local', 'Caroline Whitfield');


        // Rotating community commenter pool
        foreach (range(1, 5) as $i) {
            $this->ensureUser(
                "commenter{$i}@demo.local",
                "Community Member {$i}"
            );
        }
    }

    /**
     * Ensure a demo user exists.
     *
     * Uses email as the natural key.
     * Will NOT modify existing users.
     */
    protected function ensureUser(string $email, string $name): User
    {
        return User::firstOrCreate(
            ['email' => $email],
            [
                'name'     => $name,
                // Deterministic, demo-only credential
                'password' => Hash::make('password'),
            ]
        );
    }
}
