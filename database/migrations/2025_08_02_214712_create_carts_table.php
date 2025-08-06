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
        // Drop enum type if it exists before creating it (idempotent)
        DB::statement("DROP TYPE IF EXISTS carts_status;");
        DB::statement("CREATE TYPE carts_status AS ENUM ('new', 'pending', 'completed')"); // Use your actual enum values!

        Schema::create('carts', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('product_id')->index('idx_16574_carts_product_id_foreign');
            $table->bigInteger('order_id')->nullable()->index('idx_16574_carts_order_id_foreign');
            $table->bigInteger('user_id')->nullable()->index('idx_16574_carts_user_id_foreign');
            $table->float('price', 0, 0);
            $table->integer('quantity');
            $table->float('amount', 0, 0);
            $table->timestampsTz();
        });
        DB::statement("ALTER TABLE carts ADD status carts_status DEFAULT 'new' NOT NULL");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('carts');
        DB::statement("DROP TYPE IF EXISTS carts_status;");
    }
};
