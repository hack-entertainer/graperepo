<?php

namespace App\Services;

use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;

class UploadService
{
    /**
     * Upload a file to Cloudinary and return the public ID.
     *
     * @param \Illuminate\Http\UploadedFile $file
     * @param string $folder
     * @return string
     */
    public function upload($file, string $folder): string
    {
        // Get real temp path
        $path = $file->getRealPath();

        // Upload using the modern Cloudinary Laravel facade
        $result = Cloudinary::uploadFile($path, [
            'folder' => $folder,
            'resource_type' => 'auto', // Supports images, videos, PDFs, raw files
        ]);

        return $result->getPublicId();
    }

    /**
     * Generate a public URL from a Cloudinary public ID.
     *
     * @param string $publicId
     * @return string
     */
    public function publicUrl(string $publicId): string
    {
        return Cloudinary::url($publicId)->generate();
    }
}
