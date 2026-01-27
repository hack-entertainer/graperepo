<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Concerns\HasUlids;

class Vote extends Model
{
    use HasFactory, HasUlids;

    protected $fillable = [
        'user_id',
        'target_type',
        'target_id',
        'vote_value',
        'cost',
        'purpose',
    ];

    /**
     * Get the latest vote for a user on a target.
     */
    public static function latestForUser(
        int $userId,
        string $targetType,
        string $targetId
    ): ?self {
        return self::where('user_id', $userId)
            ->where('target_type', $targetType)
            ->where('target_id', $targetId)
            ->latest()
            ->first();
    }
}
