<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('posts', function (Blueprint $table) {
            $table->foreign(['added_by'])->references(['id'])->on('users')->onUpdate('no action')->onDelete('set null');
            $table->foreign(['post_cat_id'])->references(['id'])->on('post_categories')->onUpdate('no action')->onDelete('set null');
            $table->foreign(['post_tag_id'])->references(['id'])->on('post_tags')->onUpdate('no action')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('posts', function (Blueprint $table) {
            $table->dropForeign('posts_added_by_foreign');
            $table->dropForeign('posts_post_cat_id_foreign');
            $table->dropForeign('posts_post_tag_id_foreign');
        });
    }
};
