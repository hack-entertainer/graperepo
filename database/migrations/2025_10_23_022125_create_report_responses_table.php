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
        Schema::create('report_responses', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('user_id')->index('report_responses_user_id_foreign');
            $table->unsignedBigInteger('report_id')->index('report_responses_report_id_foreign');
            $table->string('user_fullname')->nullable();
            $table->enum('type', ['subject_responses', 'reporter_reply']);
            $table->text('content')->nullable();
            $table->string('file_path')->nullable();
            $table->boolean('is_paid')->default(false);
            $table->enum('payment_status', ['unpaid', 'paid', 'failed'])->default('unpaid');
            $table->timestamp('paid_at')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('report_responses');
    }
};
