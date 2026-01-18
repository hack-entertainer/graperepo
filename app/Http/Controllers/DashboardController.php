<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DashboardController extends Controller
{
    /**
     * End-user dashboard.
     */
    public function user(Request $request)
    {
        return view('dashboards.user', [
            'user' => $request->user(),
        ]);
    }

    /**
     * Administrator dashboard.
     */
    public function admin(Request $request)
    {
        return view('dashboards.admin', [
            'user' => $request->user(),
        ]);
    }

    /**
     * Moderator dashboard.
     */
    public function moderator(Request $request)
    {
        return view('dashboards.moderator', [
            'user' => $request->user(),
        ]);
    }
}
