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
        DB::statement("CREATE TYPE post_status AS ENUM ('draft', 'published', 'archived')");

        Schema::create('posts', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title');
            $table->string('slug')->unique('idx_16668_posts_slug_unique');
            $table->text('summary');
            $table->text('description')->nullable();
            $table->text('quote')->nullable();
            $table->string('photo')->nullable();
            $table->string('tags')->nullable();
            $table->bigInteger('post_cat_id')->nullable()->index('idx_16668_posts_post_cat_id_foreign');
            $table->bigInteger('post_tag_id')->nullable()->index('idx_16668_posts_post_tag_id_foreign');
            $table->bigInteger('added_by')->nullable()->index('idx_16668_posts_added_by_foreign');
            $table->timestampsTz();
        });
        DB::statement("ALTER TABLE posts ADD status posts_status DEFAULT 'active' NOT NULL");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        DB::statement("DROP TYPE IF EXISTS post_status");
        Schema::dropIfExists('posts');
    }
};
