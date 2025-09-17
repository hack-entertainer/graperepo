<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReportResponse extends Model
{
	use HasFactory;

	protected $fillable = [
		'user_id',
		'report_id',
		'user_fullname',
		'type',
		'content',
		'file_path',
		'is_paid',
		'payment_status',
		'paid_at',
	];

	public function report()
	{
		return $this->belongsTo(Reports::class, 'report_id');
	}
}
