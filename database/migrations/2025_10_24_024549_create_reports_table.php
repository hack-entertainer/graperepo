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
        Schema::create('reports', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('reporter_id')->index('reports_reporter_id_foreign');
            $table->string('reporter_name')->nullable();
            $table->string('reporter_email')->nullable();
            $table->string('type_event');
            $table->longText('description');
            $table->date('event_date');
            $table->string('event_location')->nullable();
            $table->string('video_link')->nullable();
            $table->string('subject_fullname')->nullable();
            $table->string('subject_location')->nullable();
            $table->string('alternate_reporter_name')->nullable();
            $table->string('report_number')->unique();
            $table->string('status')->default('pending');
            $table->boolean('is_paid')->default(false);
            $table->enum('payment_status', ['unpaid', 'paid', 'failed'])->default('unpaid');
            $table->timestamp('paid_at')->nullable();
            $table->timestamps();
            $table->string('subject_address')->nullable();
            $table->string('subject_city')->nullable();
            $table->string('subject_state')->nullable();
            $table->string('subject_zipcode')->nullable();
            $table->string('subject_country')->nullable();
            $table->string('event_address')->nullable();
            $table->string('event_city')->nullable();
            $table->string('event_state')->nullable();
            $table->string('event_zipcode')->nullable();
            $table->string('event_country')->nullable();
            $table->string('video_path')->nullable();
            $table->string('letter_path')->nullable();
            $table->integer('total_comment')->default(0);
            $table->string('subject_email')->nullable();
            $table->string('subject_phone')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('reports');
    }
};
