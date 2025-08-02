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
        Schema::create('coupons', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('code')->unique('idx_16589_coupons_code_unique');
            $table->decimal('value', 20);
            $table->timestampsTz();
        });
        DB::statement("ALTER TABLE coupons ADD type coupons_type DEFAULT 'fixed' NOT NULL");
        DB::statement("ALTER TABLE coupons ADD status coupons_status DEFAULT 'inactive' NOT NULL");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('coupons');
    }
};
