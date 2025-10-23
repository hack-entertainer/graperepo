<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('report_responses', function (Blueprint $table) {
            $table->foreign(['report_id'])->references(['id'])->on('reports')->onUpdate('no action')->onDelete('cascade');
            $table->foreign(['user_id'])->references(['id'])->on('users')->onUpdate('no action')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('report_responses', function (Blueprint $table) {
            $table->dropForeign('report_responses_report_id_foreign');
            $table->dropForeign('report_responses_user_id_foreign');
        });
    }
};
