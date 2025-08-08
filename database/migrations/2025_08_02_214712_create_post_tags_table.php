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
        DB::statement("DROP TYPE IF EXISTS post_tags_status;");
        DB::statement("CREATE TYPE post_tags_status AS ENUM ('active', 'inactive', 'archived')");

        Schema::create('post_tags', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title');
            $table->string('slug')->unique('idx_16662_post_tags_slug_unique');
            $table->timestampsTz();
        });
        DB::statement("ALTER TABLE post_tags ADD status post_tags_status DEFAULT 'active' NOT NULL");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('post_tags');
        DB::statement("DROP TYPE IF EXISTS post_tags_status;");
    }
};
