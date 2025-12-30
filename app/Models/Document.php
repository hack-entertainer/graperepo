<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\User;

class Document extends Model
{
    use HasFactory;

    protected $fillable = [
        'report_id',
        'kind',
        'cloudinary_public_id',
        'cloudinary_resource_type',
        'original_filename',
        'mime_type',
        'uploaded_by_user_id',
    ];

    /**
     * The report this document belongs to.
     */
    public function report()
    {
        return $this->belongsTo(Reports::class);
    }

    /**
     * The user who uploaded the document.
     */
    public function uploader()
    {
        return $this->belongsTo(User::class, 'uploaded_by_user_id');
    }
}
