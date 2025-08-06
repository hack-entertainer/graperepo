<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up()
    {
        // Drop enum types if they exist before creating them
        DB::statement("DROP TYPE IF EXISTS coupons_type;");
        DB::statement("CREATE TYPE coupons_type AS ENUM ('fixed', 'percent')"); // Adjust as needed

        DB::statement("DROP TYPE IF EXISTS coupons_status;");
        DB::statement("CREATE TYPE coupons_status AS ENUM ('inactive', 'active', 'expired')"); // Adjust as needed

        Schema::create('coupons', function (Blueprint $table) {
            $table->id();
            $table->string('code')->unique();
            $table->enum('type', ['fixed', 'percent'])->default('fixed'); // uses coupons_type
            $table->decimal('value', 10, 2);
            $table->decimal('min_order_amount', 10, 2)->nullable();
            $table->integer('usage_limit')->nullable();
            $table->integer('used')->default(0);
            $table->timestamp('start_date')->nullable();
            $table->timestamp('end_date')->nullable();
            $table->enum('status', ['inactive', 'active', 'expired'])->default('active'); // uses coupons_status
            $table->boolean('active')->default(true);
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('coupons');

        // Drop the enum types after dropping the table
        DB::statement("DROP TYPE IF EXISTS coupons_type;");
        DB::statement("DROP TYPE IF EXISTS coupons_status;");
    }
};
