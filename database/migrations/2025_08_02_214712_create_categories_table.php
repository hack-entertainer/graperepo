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
        // Ensure the enum type does not exist before creating it
        DB::statement("DROP TYPE IF EXISTS categories_status;");
        DB::statement("CREATE TYPE categories_status AS ENUM ('inactive', 'active', 'archived')"); // Use your actual enum values!
        Schema::create('categories', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title');
            $table->string('slug')->unique('idx_16580_categories_slug_unique');
            $table->text('summary')->nullable();
            $table->string('photo')->nullable();
            $table->boolean('is_parent')->default(true);
            $table->bigInteger('parent_id')->nullable()->index('idx_16580_categories_parent_id_foreign');
            $table->bigInteger('added_by')->nullable()->index('idx_16580_categories_added_by_foreign');
            $table->timestampsTz();
        });
        DB::statement("ALTER TABLE categories ADD status categories_status DEFAULT 'inactive' NOT NULL");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        // Drop the table first, then the enum type
        Schema::dropIfExists('categories');
        DB::statement("DROP TYPE IF EXISTS categories_status;");
    }
};
