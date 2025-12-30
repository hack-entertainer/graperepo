<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reports extends Model
{
    use HasFactory;

    protected $fillable = [
        // Reporter
        'reporter_id',
        'reporter_name',
        'reporter_email',
        'alternate_reporter_name',

        // Subject
        'subject_fullname',
        'subject_email',
        'subject_phone',
        'subject_address',
        'subject_city',
        'subject_state',
        'subject_zipcode',
        'subject_country',

        // Event
        'type_event',
        'event_date',
        'event_address',
        'event_city',
        'event_state',
        'event_zipcode',
        'event_country',

        // Content
        'description',
        'video_link',

        // -----------------------------
        // Cloudinary (PDF / Letter)
        // -----------------------------
        'letter_public_id',
        'letter_public_url',

        // -----------------------------
        // Cloudinary (Video) ✅ FIX
        // -----------------------------
        'video_public_id',
        'video_public_url',

        // Legacy (still allowed, untouched)
        'video_path',

        // Payment / Meta
        'report_number',
        'status',
        'is_paid',
        'payment_status',
        'paid_at',
    ];

    public function documents()
    {
        return $this->hasMany(Document::class);
    }
}
