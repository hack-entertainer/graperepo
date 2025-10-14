@extends('frontend.layouts.master')

@section('title', 'List reports || PRODUCT PAGE')

@section('main-content')
<!-- Breadcrumbs -->
<div class="breadcrumbs">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="bread-inner">
					<ul class="bread-list">
						<li><a href="/">Home<i class="ti-arrow-right"></i></a></li>
						<li class="active"><a href="#">List reports</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Breadcrumbs -->

<section class="shop single section">
	<div class="container" data-aos="fade-up">
		<h3 class="mb-4">📋 List reports</h3>

		<!-- Search Bar -->
		<div class="mb-4">
			<form class="row g-3" method="GET" action="{{ route('list-reports') }}">
				<div class="col-md-4">
					<input type="text" class="form-control" name="q" value="{{ request('q') }}" placeholder="Search by Reporter or Subject">
				</div>
				<div class="col-md-3">
					<select class="form-select" name="type_event">
						<option value="">All Incident Types</option>
						<option value="Rape" {{ request('type_event') == 'Rape' ? 'selected' : '' }}>Rape</option>
						<option value="Sexual Assault" {{ request('type_event') == 'Sexual Assault' ? 'selected' : '' }}>Sexual Assault</option>
						<option value="Sexual Abuse" {{ request('type_event') == 'Sexual Abuse' ? 'selected' : '' }}>Sexual Abuse</option>
						<option value="Sexual Harassment" {{ request('type_event') == 'Sexual Harassment' ? 'selected' : '' }}>Sexual Harassment</option>
					</select>
				</div>
				<div class="col-md-2 d-grid">
					<button type="submit" class="btn btn-primary">Search</button>
				</div>
			</form>
		</div>

		<!-- Desktop Table (Modularized) -->
		<div class="hidden md:block">
			@include('frontend.pages.reports.components.table', ['reports' => $reports, 'answers' => $answers, 'comments' => $comments])
		</div>

		<!-- Mobile Cards Placeholder -->
		<div class="block md:hidden">
			<p class="text-gray-500 text-sm italic mb-2">Mobile view coming soon...</p>
			<!-- Eventually replace this with: -->
			{{-- @include('frontend.pages.reports.components.cards', ['reports' => $reports]) --}}
		</div>
	</div>
</section>
@endsection