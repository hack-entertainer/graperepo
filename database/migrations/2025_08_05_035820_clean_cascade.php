<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Drop the banners table if it exists
        DB::statement('DROP TABLE IF EXISTS banners CASCADE;');
        // Drop the banners_status enum type if it exists (for Postgres)
        DB::statement('DROP TYPE IF EXISTS banners_status;');
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // No rollback necessary for cleanup
    }
};
