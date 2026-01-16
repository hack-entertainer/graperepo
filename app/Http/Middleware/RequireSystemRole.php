<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class RequireSystemRole
{
    public function handle(Request $request, Closure $next, ...$roles)
    {
        $user = $request->user();

        if (! $user) {
            abort(403);
        }

        // Admins are always allowed
        if ($user->systemRole === 'admin') {
            return $next($request);
        }

        if (in_array($user->systemRole, $roles, true)) {
            return $next($request);
        }

        abort(403);
    }
}
