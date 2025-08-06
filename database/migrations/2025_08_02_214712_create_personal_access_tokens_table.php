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
        Schema::create('personal_access_tokens', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('tokenable_type');
            $table->bigInteger('tokenable_id');
            $table->string('name');
            $table->string('token', 64)->unique('idx_16641_personal_access_tokens_token_unique');
            $table->text('abilities')->nullable();
            $table->timestampTz('last_used_at')->nullable();
            $table->timestampTz('expires_at')->nullable();
            $table->timestampsTz();

            $table->index(['tokenable_type', 'tokenable_id'], 'idx_16641_personal_access_tokens_tokenable_type_tokenable_id_in');
        });
    }

    /**
     * Reverse the migrations.
     *              
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('personal_access_tokens');
    }
};
