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
        Schema::create('products', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title');
            $table->string('slug')->unique('idx_16685_products_slug_unique');
            $table->text('summary');
            $table->text('description')->nullable();
            $table->text('photo');
            $table->integer('stock')->default(1);
            $table->string('size')->nullable()->default('M');
            $table->float('price', 0, 0);
            $table->float('discount', 0, 0);
            $table->boolean('is_featured');
            $table->bigInteger('cat_id')->nullable()->index('idx_16685_products_cat_id_foreign');
            $table->bigInteger('child_cat_id')->nullable()->index('idx_16685_products_child_cat_id_foreign');
            $table->bigInteger('brand_id')->nullable()->index('idx_16685_products_brand_id_foreign');
            $table->timestampsTz();
        });
        DB::statement("ALTER TABLE products ADD condition products_condition DEFAULT 'default' NOT NULL");
        DB::statement("ALTER TABLE products ADD status products_status DEFAULT 'inactive' NOT NULL");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
};
