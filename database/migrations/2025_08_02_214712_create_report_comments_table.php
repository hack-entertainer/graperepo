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
        DB::statement("DROP TYPE IF EXISTS report_comments_payment_status;");
        DB::statement("CREATE TYPE report_comments_payment_status AS ENUM ('unpaid', 'paid', 'refunded')");

        Schema::create('report_comments', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('user_id')->index('idx_16696_report_comments_user_id_foreign');
            $table->bigInteger('report_id')->index('idx_16696_report_comments_report_id_foreign');
            $table->string('user_fullname')->nullable();
            $table->text('content');
            $table->boolean('is_paid')->default(false);
            $table->timestampTz('paid_at')->nullable();
            $table->timestampsTz();
        });
        DB::statement("ALTER TABLE report_comments ADD payment_status report_comments_payment_status DEFAULT 'unpaid' NOT NULL");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('report_comments');
        DB::statement("DROP TYPE IF EXISTS report_comments_payment_status;");
    }
};
