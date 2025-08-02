<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
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
        Schema::table('report_responses', function (Blueprint $table) {
            $table->foreign(['report_id'])->references(['id'])->on('reports')->onDelete('CASCADE');
            $table->foreign(['user_id'])->references(['id'])->on('users')->onDelete('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('report_responses', function (Blueprint $table) {
            $table->dropForeign('report_responses_report_id_foreign');
            $table->dropForeign('report_responses_user_id_foreign');
        });
    }
};
