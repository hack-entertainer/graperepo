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
        // Authorization (INTENTIONALLY SIMPLE FOR NOW)
        // -------------------------------------------------
        // Replace later with report ownership / role checks
        if (!auth()->check()) {
            abort(403);
        }

        // -------------------------------------------------
        // Build authenticated Cloudinary delivery URL
        // -------------------------------------------------
        // NOTE:
        // - This does NOT enforce TTL at CDN level (plan limitation)
        // - Access control lives HERE, not at Cloudinary
        // - Cloudinary URL signing prevents guessing public IDs
        $cloudinary = new Cloudinary([
            'cloud' => [
                'cloud_name' => config('cloudinary.cloud_name'),
                'api_key'    => config('cloudinary.api_key'),
                'api_secret' => config('cloudinary.api_secret'),
            ],
        ]);

        if ($document->cloudinary_resource_type === 'video') {
            $url = $cloudinary
                ->video($document->cloudinary_public_id)
                ->deliveryType('authenticated')
                ->signUrl(true)
                ->toUrl();
        } else {
            // raw (PDF, DOC, etc.)
            $url = $cloudinary
                ->raw($document->cloudinary_public_id)
                ->deliveryType('authenticated')
                ->signUrl(true)
                ->toUrl();
        }

        // -------------------------------------------------
        // Optional: minimal access logging
        // -------------------------------------------------
        logger()->info('document.download', [
            'document_id' => $document->id,
            'user_id'     => auth()->id(),
            'ip'          => $request->ip(),
            'ua'          => $request->userAgent(),
        ]);

        // -------------------------------------------------
        // Redirect to Cloudinary (no caching)
        // -------------------------------------------------
        return redirect()->away($url)->withHeaders([
            'Cache-Control' => 'no-store, no-cache, must-revalidate, max-age=0',
            'Pragma'        => 'no-cache',
            'Expires'       => '0',
        ]);
    }
}
