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
        DB::statement("DROP TYPE IF EXISTS shippings_status;");
        DB::statement("CREATE TYPE shippings_status AS ENUM ('active', 'inactive', 'archived')");

        Schema::create('shippings', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('type');
            $table->decimal('price');
            $table->timestampsTz();
        });
        DB::statement("ALTER TABLE shippings ADD status shippings_status DEFAULT 'active' NOT NULL");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('shippings');
        DB::statement("DROP TYPE IF EXISTS shippings_status;");
    }
};
