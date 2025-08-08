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
        // Create ENUM types first
        DB::statement("DROP TYPE IF EXISTS report_responses_type;");
        DB::statement("CREATE TYPE report_responses_type AS ENUM ('direct', 'indirect', 'other')"); // Adjust values as needed

        DB::statement("DROP TYPE IF EXISTS report_responses_payment_status;");
        DB::statement("CREATE TYPE report_responses_payment_status AS ENUM ('unpaid', 'paid', 'refunded')");

        Schema::create('report_responses', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('user_id')->index('idx_16705_report_responses_user_id_foreign');
            $table->bigInteger('report_id')->index('idx_16705_report_responses_report_id_foreign');
            $table->string('user_fullname')->nullable();
            $table->text('content')->nullable();
            $table->string('file_path')->nullable();
            $table->boolean('is_paid')->default(false);
            $table->timestampTz('paid_at')->nullable();
            $table->timestampsTz();
        });
        DB::statement("ALTER TABLE report_responses ADD type report_responses_type NOT NULL");
        DB::statement("ALTER TABLE report_responses ADD payment_status report_responses_payment_status DEFAULT 'unpaid' NOT NULL");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('report_responses');
        DB::statement("DROP TYPE IF EXISTS report_responses_type;");
        DB::statement("DROP TYPE IF EXISTS report_responses_payment_status;");
    }
};
