<?php

namespace App\Http\Controllers;

use App\Models\Document;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\StreamedResponse;
use GuzzleHttp\Client;

class DocumentController extends Controller
{
    public function download(Document $document, Request $request)
    {
        // -------------------------------------------------
        // Authorization (stub for now)
        // -------------------------------------------------
        if (!auth()->check()) {
            abort(403);
        }

        // -------------------------------------------------
        // Build Cloudinary API URL (NOT CDN)
        // -------------------------------------------------
        $cloudName   = config('cloudinary.cloud_name');
        $resource    = $document->cloudinary_resource_type; // raw | video | image
        $publicId    = $document->cloudinary_public_id;

        $apiUrl = "https://api.cloudinary.com/v1_1/{$cloudName}/{$resource}/download";

        // -------------------------------------------------
        // HTTP client with Cloudinary credentials
        // -------------------------------------------------
        $client = new Client([
            'auth' => [
                config('cloudinary.api_key'),
                config('cloudinary.api_secret'),
            ],
            'stream' => true,
        ]);

        $response = $client->post($apiUrl, [
            'form_params' => ['public_id' => $publicId],
        ]);

        dd(
            $response->getStatusCode(),
            $response->getHeader('Content-Type')
        );


        // -------------------------------------------------
        // Stream Cloudinary → Laravel → User
        // -------------------------------------------------
        return new StreamedResponse(function () use ($client, $apiUrl, $publicId) {
            try {
                $response = $client->post($apiUrl, [
                    'form_params' => [
                        'public_id' => $publicId,
                    ],
                ]);

                $body = $response->getBody();

                while (!$body->eof()) {
                    echo $body->read(8192);
                    flush();
                }
            } catch (\Throwable $e) {
                logger()->error('Cloudinary stream failed', [
                    'message' => $e->getMessage(),
                ]);
            }
        }, 200, [
            'Content-Type'        => $document->mime_type ?? 'application/octet-stream',
            'Content-Disposition' => 'attachment; filename="' . addslashes($document->original_filename) . '"',
        ]);
    }
}
