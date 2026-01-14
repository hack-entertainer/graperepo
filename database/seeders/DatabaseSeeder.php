<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Database\Seeders\Users\AdminUsersSeeder;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        $this->call([
            AdminUsersSeeder::class,
        ]);
    }
}
