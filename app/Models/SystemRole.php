<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\User;

class SystemRole extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'system_roles';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id',
        'role',
    ];

    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = true;

    /**
     * Get the user that owns this system role.
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
