<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class Admin
{
    /**
     * Handle an incoming request.
     */
    public function handle(Request $request, Closure $next)
    {
        // Must be authenticated first (auth middleware should already enforce this)
        if (! auth()->check()) {
            return redirect()->route('login');
        }

        $userId = auth()->id();

        $isAdmin = DB::table('system_roles')
            ->where('user_id', $userId)
            ->where('role', 'admin')
            ->exists();

        if (! $isAdmin) {
            // Slap on the wrist, same behavior as legacy system
            return redirect('/user');
        }

        return $next($request);
    }
}
