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
        DB::statement("DROP TYPE IF EXISTS product_reviews_status;");
        DB::statement("CREATE TYPE product_reviews_status AS ENUM ('active', 'inactive', 'archived')");

        Schema::create('product_reviews', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('user_id')->nullable()->index('idx_16676_product_reviews_user_id_foreign');
            $table->bigInteger('product_id')->nullable()->index('idx_16676_product_reviews_product_id_foreign');
            $table->smallInteger('rate')->default(0);
            $table->text('review')->nullable();
            $table->timestampsTz();
        });
        DB::statement("ALTER TABLE product_reviews ADD status product_reviews_status DEFAULT 'active' NOT NULL");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('product_reviews');
        DB::statement("DROP TYPE IF EXISTS product_reviews_status;");
    }
};
