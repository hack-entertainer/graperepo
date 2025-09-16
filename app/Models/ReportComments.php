<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReportComments extends Model
{
	use HasFactory;

	protected $fillable = [
		'user_id',
		'report_id',
		'user_fullname',
		'content',
		'is_paid',
		'payment_status',
		'paid_at',
	];

	protected $casts = [
		'is_paid' => 'boolean',
		'paid_at' => 'datetime',
	];

	public function report()
	{
		return $this->belongsTo(Reports::class, 'report_id');
	}
}
