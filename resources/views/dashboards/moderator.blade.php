@extends('layouts.app')

@section('content')
<div class="max-w-6xl mx-auto px-4 py-6 space-y-8">

    {{-- Header / Identity --}}
    <section class="bg-white shadow rounded p-6">
        <h1 class="text-2xl font-semibold">
            Moderator Dashboard
        </h1>

        <p class="text-sm text-gray-600">
            Signed in as {{ $user->email }}
        </p>
    </section>

    {{-- Moderation Queue --}}
    @include('widgets.moderator.queue')

    {{-- Active Cases --}}
    @include('widgets.moderator.cases')

    {{-- Moderation Tools --}}
    @include('widgets.moderator.tools')

    {{-- Account --}}
    @include('widgets.common.account')

</div>
@endsection