@extends('frontend.layouts.master')
@section('title','RapeReportDB || DOME TEST')
@section('main-content')

<header class="hero text-center py-5" style="background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%); color:white;">
  <div class="container">
    <h1 class="display-4 fw-bold mb-3">🏰 WELCOME TO THE DOME 🏰</h1>
    <p class="lead">This is a <strong>test redirect page</strong> for Stripe success/cancel routes.</p>

    <div class="d-flex justify-content-center gap-3 flex-wrap mt-4">
      <a href="{{route('home')}}" class="btn btn-warning" style="font-weight:bold;">
        ⬅ Return to Homepage
      </a>
      <a href="{{route('list-reports')}}" class="btn btn-light" style="font-weight:bold;">
        📜 Browse Reports
      </a>
    </div>
  </div>
</header>

<section class="py-5 text-center">
  <div class="container">
    <h2 class="mb-4">Distinct Test Symbols</h2>
    <div class="display-6 mb-3">🛡️ ⚔️ 🔮 🌌 🔥</div>
    <p class="text-muted">If you see these, you are <strong>inside the Dome</strong>.</p>
    <p class="mt-4"><em>Time of Arrival:</em> {{ now()->toDayDateTimeString() }}</p>
  </div>
</section>

@endsection

@push('styles')
<style>
  .hero {
    border-bottom: 5px solid gold;
  }
  .hero h1 {
    text-shadow: 2px 2px 6px rgba(0,0,0,0.5);
  }
</style>
@endpush
