<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateVotesTable extends Migration
{
    public function up(): void
    {
        Schema::create('votes', function (Blueprint $table) {
            $table->ulid('id')->primary();
            $table->foreignId('user_id')->constrained()->cascadeOnDelete();
            $table->string('target_type');
            $table->ulid('target_id');
            $table->enum('vote_value', ['support', 'oppose']);
            $table->unsignedInteger('cost');
            $table->string('purpose');
            $table->timestamps();

            $table->index(['target_type', 'target_id']);
            $table->index(['user_id', 'target_type', 'target_id']);
        });
    }

    public function down(): void
    {
        // Drop the trigger and function before dropping the table
        DB::unprepared('DROP TRIGGER IF EXISTS prevent_vote_update;');
        DB::unprepared('DROP TRIGGER IF EXISTS prevent_vote_delete;');

        Schema::dropIfExists('votes');
    }
}
