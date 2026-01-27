<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class RequireLandingAcknowledgment
{
    public function handle(Request $request, Closure $next)
    {
        // Allow landing page and acknowledgment submit
        if ($request->is('/') || $request->is('acknowledge')) {
            return $next($request);
        }

        // Gate everything else
        if (! $request->session()->get('landing_acknowledged')) {
            return redirect('/')
                ->with('ack_required', true);
        }

        return $next($request);
    }
}
