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
        Schema::dropIfExists('documents');

        Schema::create('documents', function (Blueprint $table) {
            $table->ulid('id')->primary();

            $table->foreignId('report_id')
                ->constrained('reports')
                ->cascadeOnDelete();

            $table->string('kind'); // letter, video, etc.

            $table->string('cloudinary_public_id');
            $table->string('cloudinary_resource_type'); // raw, video

            $table->string('original_filename')->nullable();
            $table->string('mime_type')->nullable();

            $table->foreignId('uploaded_by_user_id')
                ->constrained('users');

            $table->timestamps();

            $table->index(['report_id', 'kind']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('documents');
    }
};
