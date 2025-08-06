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
        // Drop enum types if they exist, then create them
        DB::statement("DROP TYPE IF EXISTS users_role;");
        DB::statement("CREATE TYPE users_role AS ENUM ('user', 'admin', 'moderator')");

        DB::statement("DROP TYPE IF EXISTS users_status;");
        DB::statement("CREATE TYPE users_status AS ENUM ('active', 'inactive', 'banned')"); // Add or edit values as needed

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
        Schema::dropIfExists('users');
        DB::statement("DROP TYPE IF EXISTS users_role;");
        DB::statement("DROP TYPE IF EXISTS users_status;");
    }
};
