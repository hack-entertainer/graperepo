<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Create the ENUM type first
        DB::statement("DROP TYPE IF EXISTS reports_payment_status;");
        DB::statement("CREATE TYPE reports_payment_status AS ENUM ('unpaid', 'paid', 'refunded')");

        Schema::create('reports', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('reporter_id')->index('idx_16714_reports_reporter_id_foreign');
            $table->string('reporter_name')->nullable();
            $table->string('reporter_email')->nullable();
            $table->string('type_event');
            $table->text('description');
            $table->date('event_date');
            $table->string('event_location')->nullable();
            $table->string('video_link')->nullable();
            $table->string('subject_fullname')->nullable();
            $table->string('subject_location')->nullable();
            $table->string('alternate_reporter_name')->nullable();
            $table->string('report_number')->unique('idx_16714_reports_report_number_unique');
            $table->string('status')->default('pending');
            $table->boolean('is_paid')->default(false);
            $table->timestampTz('paid_at')->nullable();
            $table->timestampsTz();
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
        DB::statement("ALTER TABLE reports ADD payment_status reports_payment_status DEFAULT 'unpaid' NOT NULL");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('reports');
        DB::statement("DROP TYPE IF EXISTS reports_payment_status;");
    }
};
