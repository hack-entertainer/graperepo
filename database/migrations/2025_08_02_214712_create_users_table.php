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
        DB::statement("CREATE TYPE user_role AS ENUM ('user', 'admin', 'moderator')");

        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name');
            $table->string('email')->nullable()->unique('idx_16738_users_email_unique');
            $table->timestampTz('email_verified_at')->nullable();
            $table->string('password')->nullable();
            $table->string('photo')->nullable();
            $table->string('provider')->nullable();
            $table->string('provider_id')->nullable();
            $table->rememberToken();
            $table->integer('credits_comment')->default(0);
            $table->timestampsTz();
        });
        DB::statement("ALTER TABLE users ADD role users_role DEFAULT 'user' NOT NULL");
        DB::statement("ALTER TABLE users ADD status users_status DEFAULT 'active' NOT NULL");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        DB::statement("DROP TYPE IF EXISTS user_role");
        Schema::dropIfExists('users');
    }
};
