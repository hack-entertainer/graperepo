<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUlids;
use App\User;

class Document extends Model
{
    use HasFactory, HasUlids;

    protected $keyType = 'string';
    public $incrementing = false;

    protected $fillable = [
        'report_id',
        'kind',
        'cloudinary_public_id',
        'cloudinary_resource_type',
        'original_filename',
        'mime_type',
        'uploaded_by_user_id',
    ];

    public function report()
    {
        return $this->belongsTo(Reports::class);
    }

    public function uploader()
    {
        return $this->belongsTo(User::class, 'uploaded_by_user_id');
    }
}
