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
        // Drop enum types if they exist before creating them
        DB::statement("DROP TYPE IF EXISTS orders_status;");
        DB::statement("CREATE TYPE orders_status AS ENUM ('pending', 'paid', 'shipped', 'cancelled')");

        DB::statement("DROP TYPE IF EXISTS orders_payment_method;");
        DB::statement("CREATE TYPE orders_payment_method AS ENUM ('cod', 'credit_card', 'paypal')"); // <-- update as needed

        DB::statement("DROP TYPE IF EXISTS orders_payment_status;");
        DB::statement("CREATE TYPE orders_payment_status AS ENUM ('unpaid', 'paid', 'refunded')"); // <-- update as needed

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

        // Add the enum columns AFTER table creation
        DB::statement("ALTER TABLE orders ADD payment_method orders_payment_method DEFAULT 'cod' NOT NULL");
        DB::statement("ALTER TABLE orders ADD payment_status orders_payment_status DEFAULT 'unpaid' NOT NULL");
        DB::statement("ALTER TABLE orders ADD status orders_status DEFAULT 'pending' NOT NULL");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
        // Drop all enum types after dropping the table
        DB::statement('DROP TYPE IF EXISTS orders_status;');
        DB::statement('DROP TYPE IF EXISTS orders_payment_method;');
        DB::statement('DROP TYPE IF EXISTS orders_payment_status;');
    }
};
