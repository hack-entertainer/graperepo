<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * Adds explicit creation-origin metadata to reports.
     *
     * - origin_type anchors *how* the report entered the system
     * - origin_key provides a deterministic, replay-safe identifier
     *
     * These fields are system-managed and immutable after creation.
     */
    public function up(): void
    {
        Schema::table('reports', function (Blueprint $table) {
            $table->enum('origin_type', [
                'ui',
                'api',
                'demo',
                'legacy',
            ])
                ->notNullable()
                ->default('ui')
                ->after('id');

            $table->string('origin_key')
                ->nullable()
                ->unique()
                ->after('origin_type');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('reports', function (Blueprint $table) {
            $table->dropUnique(['origin_key']);
            $table->dropColumn(['origin_key', 'origin_type']);
        });
    }
};
