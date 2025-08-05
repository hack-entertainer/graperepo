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
        // may need to be changed to match existing logic, or update existing logic
        DB::statement("CREATE TYPE orders_status AS ENUM ('pending', 'paid', 'shipped', 'cancelled')");

        Schema::create('orders', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('order_number')->unique('idx_16628_orders_order_number_unique');
            $table->bigInteger('user_id')->nullable()->index('idx_16628_orders_user_id_foreign');
            $table->float('sub_total', 0, 0);
            $table->bigInteger('shipping_id')->nullable()->index('idx_16628_orders_shipping_id_foreign');
            $table->float('coupon', 0, 0)->nullable();
            $table->float('total_amount', 0, 0);
            $table->integer('quantity');
            $table->string('first_name');
            $table->string('last_name');
            $table->string('email');
            $table->string('phone');
            $table->string('country');
            $table->string('post_code')->nullable();
            $table->text('address1');
            $table->text('address2')->nullable();
            $table->timestampsTz();
        });
        DB::statement("ALTER TABLE orders ADD payment_method orders_payment_method DEFAULT 'cod' NOT NULL");
        DB::statement("ALTER TABLE orders ADD payment_status orders_payment_status DEFAULT 'unpaid' NOT NULL");
        DB::statement("ALTER TABLE orders ADD status orders_status DEFAULT 'new' NOT NULL");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
        DB::statement('DROP TYPE IF EXISTS orders_status');
    }
};
