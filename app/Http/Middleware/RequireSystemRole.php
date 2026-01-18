<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class RequireSystemRole
{
    public function handle($request, \Closure $next, ...$roles)
    {
        $user = $request->user();

        if (! $user) {
            abort(403);
        }

        // systemRole is a relationship; role is the column
        $systemRole = optional($user->systemRole)->role;

        // Admins always pass
        if ($systemRole === 'admin') {
            return $next($request);
        }

        // Explicit role match
        if (in_array($systemRole, $roles, true)) {
            return $next($request);
        }

        abort(403);
    }
}
