<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Database\Seeders\Users\AdminUsersSeeder;
use Database\Seeders\SystemSettingsSeeder;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        $this->call([
            AdminUsersSeeder::class,
            SystemSettingsSeeder::class,
        ]);
    }
}
