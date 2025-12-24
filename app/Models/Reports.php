<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reports extends Model
{
    use HasFactory;

    protected $fillable = [
        'reporter_id',
        'reporter_name',
        'reporter_email',
        'alternate_reporter_name',

        'subject_fullname',
        'subject_email',
        'subject_phone',
        'subject_address',
        'subject_city',
        'subject_state',
        'subject_zipcode',
        'subject_country',

        'type_event',
        'event_date',
        'event_address',
        'event_city',
        'event_state',
        'event_zipcode',
        'event_country',

        'description',
        'video_link',

        // Cloudinary
        'letter_public_id',
        'letter_public_url',

        'video_path',

        'report_number',
        'status',
        'is_paid',
        'payment_status',
        'paid_at',
    ];
}
