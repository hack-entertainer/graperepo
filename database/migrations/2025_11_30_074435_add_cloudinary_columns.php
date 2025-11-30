<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('reports', function (Blueprint $table) {
            $table->string('video_public_id')->nullable()->after('video_link');
            $table->string('video_public_url')->nullable()->after('video_public_id');

            $table->string('letter_public_id')->nullable()->after('video_public_url');
            $table->string('letter_public_url')->nullable()->after('letter_public_id');
        });
    }

    public function down(): void
    {
        Schema::table('reports', function (Blueprint $table) {
            $table->dropColumn([
                'video_public_id',
                'video_public_url',
                'letter_public_id',
                'letter_public_url',
            ]);
        });
    }
};
