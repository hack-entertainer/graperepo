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
        Schema::create('wishlists', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('product_id')->index('idx_16748_wishlists_product_id_foreign');
            $table->bigInteger('cart_id')->nullable()->index('idx_16748_wishlists_cart_id_foreign');
            $table->bigInteger('user_id')->nullable()->index('idx_16748_wishlists_user_id_foreign');
            $table->float('price', 0, 0);
            $table->integer('quantity');
            $table->float('amount', 0, 0);
            $table->timestampsTz();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('wishlists');
    }
};
