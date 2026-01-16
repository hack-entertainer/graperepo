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

    {{-- System Overview --}}
    @include('widgets.admin.overview')

    {{-- Administration --}}
    @include('widgets.admin.administration')

    {{-- Configuration (Legacy Bridge) --}}
    @include('widgets.admin.configuration')

    {{-- Account --}}
    @include('widgets.common.account')

</div>
@endsection