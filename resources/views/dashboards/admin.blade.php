@extends('layouts.app')

@section('content')
<div class="max-w-6xl mx-auto px-4 py-6 space-y-8">

    {{-- Header / Identity --}}
    <section class="bg-white shadow rounded p-6">
        <h1 class="text-2xl font-semibold">
            Admin Dashboard
        </h1>

        <p class="text-sm text-gray-600">
            Signed in as {{ $user->email }}
        </p>
    </section>

    {{-- System Overview (placeholder) --}}
    <section class="bg-white shadow rounded p-6">
        <h2 class="text-xl font-semibold mb-2">
            System Overview
        </h2>

        <p class="text-sm text-gray-500">
            System status and high-level metrics will appear here.
        </p>
    </section>

    {{-- Moderation & Administration (placeholder) --}}
    <section class="bg-white shadow rounded p-6">
        <h2 class="text-xl font-semibold mb-2">
            Administration
        </h2>

        <p class="text-sm text-gray-500">
            Administrative and moderation widgets will appear here.
        </p>
    </section>

    {{-- Configuration (legacy bridge) --}}
    <section class="bg-white shadow rounded p-6">
        <h2 class="text-xl font-semibold mb-4">
            Configuration
        </h2>

        <ul class="space-y-2 text-sm">
            <li>
                <a href="{{ route('settings') }}" class="text-blue-600 hover:underline">
                    Site settings
                </a>
            </li>
        </ul>
    </section>

    {{-- Account --}}
    <section class="bg-white shadow rounded p-6">
        <h2 class="text-xl font-semibold mb-4">
            Account
        </h2>

        <ul class="space-y-2 text-sm">
            <li>
                <a href="{{ route('admin-profile') }}" class="text-blue-600 hover:underline">
                    View profile
                </a>
            </li>

            <li>
                <a href="{{ route('logout') }}"
                    class="text-red-600 hover:underline"
                    onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                    Log out
                </a>
            </li>
        </ul>

        <form id="logout-form" action="{{ route('logout') }}" method="POST" class="hidden">
            @csrf
        </form>
    </section>

</div>
@endsection