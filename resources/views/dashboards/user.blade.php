@extends('layouts.app')

@section('content')
<div class="max-w-6xl mx-auto px-4 py-6 space-y-8">

    {{-- Header / Identity --}}
    <section class="bg-white shadow rounded p-6">
        <h1 class="text-2xl font-semibold">
            Dashboard
        </h1>

        <p class="text-sm text-gray-600">
            Signed in as {{ $user->email }}
        </p>
    </section>

    {{-- Activity (placeholder) --}}
    <section class="bg-white shadow rounded p-6">
        <h2 class="text-xl font-semibold mb-2">
            Your Activity
        </h2>

        <p class="text-sm text-gray-500">
            Activity widgets will appear here.
        </p>
    </section>

    {{-- Actions (placeholder) --}}
    <section class="bg-white shadow rounded p-6">
        <h2 class="text-xl font-semibold mb-2">
            Actions
        </h2>

        <p class="text-sm text-gray-500">
            Action widgets will appear here.
        </p>
    </section>

    {{-- Account (safe links only) --}}
    <section class="bg-white shadow rounded p-6">
        <h2 class="text-xl font-semibold mb-4">
            Account
        </h2>

        <ul class="space-y-2 text-sm">
            <li>
                <a href="{{ route('user-profile') }}" class="text-blue-600 hover:underline">
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
