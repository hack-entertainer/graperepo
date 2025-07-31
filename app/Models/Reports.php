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
        'subject_location',
        'type_event',
        'event_date',
        'description',
        'video_link',
        'report_number',
        'is_paid',
        'payment_status',
        'paid_at',
        'subject_address',
        'subject_city',
        'subject_state',
        'subject_zipcode',
        'subject_country',
        'event_address',
        'event_city',
        'event_state',
        'event_zipcode',
        'event_country',
        'video_path',
        'letter_path',
        'total_comment',
        'subject_email',
        'subject_phone',
    ];
}

