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
        Schema::create('post_comments', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('user_id')->nullable()->index('idx_16654_post_comments_user_id_foreign');
            $table->bigInteger('post_id')->nullable()->index('idx_16654_post_comments_post_id_foreign');
            $table->text('comment');
            $table->text('replied_comment')->nullable();
            $table->bigInteger('parent_id')->nullable();
            $table->timestampsTz();
        });
        DB::statement("ALTER TABLE post_comments ADD status post_comments_status DEFAULT 'active' NOT NULL");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('post_comments');
    }
};
