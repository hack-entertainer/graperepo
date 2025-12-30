<?php

namespace App\Http\Controllers;

use App\Models\Document;
use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;
use Illuminate\Http\Request;

class DocumentController extends Controller
{
    public function download(Document $document, Request $request)
    {
        // ---------------------------------
        // Authorization (stub for now)
        // ---------------------------------
        // TODO: replace with role-based check
        if (!auth()->check()) {
            abort(403);
        }

        // ---------------------------------
        // Generate signed Cloudinary URL (10s)
        // ---------------------------------
        $signedUrl = Cloudinary::privateDownloadUrl(
            $document->cloudinary_public_id,
            $document->cloudinary_resource_type,
            [
                'expires_at' => now()->addSeconds(10)->timestamp,
            ]
        );

        // ---------------------------------
        // Access logging (minimal for now)
        // ---------------------------------
        // TODO: persist IP, UA, outcome, document_id
        logger()->info('document.download', [
            'document_id' => $document->id,
            'user_id'     => auth()->id(),
            'ip'          => $request->ip(),
            'ua'          => $request->userAgent(),
        ]);

        // ---------------------------------
        // Redirect user to Cloudinary
        // ---------------------------------
        return redirect()->away($signedUrl);
    }
}
