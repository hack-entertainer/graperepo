<?php

namespace App\Http\Controllers;

use App\Models\Document;
use Cloudinary\Cloudinary;
use Illuminate\Http\Request;

class DocumentController extends Controller
{
    public function download(Document $document, Request $request)
    {
        // -------------------------------------------------
        // Authorization (stub — intentionally minimal)
        // -------------------------------------------------
        if (!auth()->check()) {
            abort(403);
        }

        // -------------------------------------------------
        // Cloudinary client
        // -------------------------------------------------
        $cloudinary = new Cloudinary(config('cloudinary.cloud_url'));

        // -------------------------------------------------
        // HARD expiration (seconds)
        // -------------------------------------------------
        // NOTE:
        // - This ONLY works with authenticated delivery
        // - Signed URLs alone do NOT enforce expiration
        $expiresAt = now()->addSeconds(5)->timestamp;

        // -------------------------------------------------
        // Build authenticated, time-limited URL
        // -------------------------------------------------
        $options = [
            'resource_type' => $document->cloudinary_resource_type,
            'type'          => 'authenticated',
            'sign_url'      => true,
            'auth_token'    => [
                'expiration' => $expiresAt,
            ],
        ];

        if ($document->cloudinary_resource_type === 'video') {
            $signedUrl = $cloudinary
                ->video($document->cloudinary_public_id)
                ->toUrl($options);
        } else {
            // raw (PDF, DOC, etc.)
            $signedUrl = $cloudinary
                ->raw($document->cloudinary_public_id)
                ->toUrl($options);
        }

        // -------------------------------------------------
        // Access logging (ephemeral for now)
        // -------------------------------------------------
        logger()->info('document.download', [
            'document_id' => $document->id,
            'user_id'     => auth()->id(),
            'ip'          => $request->ip(),
            'ua'          => $request->userAgent(),
            'expires_at'  => $expiresAt,
        ]);

        // -------------------------------------------------
        // Redirect to Cloudinary
        // -------------------------------------------------
        return redirect()->away($signedUrl);
    }
}
