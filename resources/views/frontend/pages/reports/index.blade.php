@extends('frontend.layouts.master')

@section('title', 'List Reports')

@section('main-content')
<section class="py-10">
	<div class="container mx-auto px-4">

		<!-- Page Header -->
		<div class="text-center mb-8">
			<h2 class="text-2xl sm:text-3xl font-semibold text-gray-800">Reports</h2>
			<p class="text-sm text-gray-500">Browse, search, and view all submitted reports.</p>
		</div>

		<!-- Search / Filter Form -->
		<div class="mb-6">
			<form method="GET" action="{{ route('list-reports') }}"
				class="flex flex-col sm:flex-row gap-3 sm:items-center">

				<!-- Search Input -->
				<input
					type="text"
					name="q"
					value="{{ request('q') }}"
					placeholder="Search by Reporter or Subject"
					class="w-full sm:w-1/2 border border-gray-300 rounded-lg py-2 px-4 text-sm
                           focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">

				<!-- Incident Type Select -->
				<select
					name="type_event"
					class="w-full sm:w-1/3 border border-gray-300 rounded-lg py-2 px-3 text-sm text-gray-700
                           focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 bg-white">
					<option value="">All Incident Types</option>
					<option value="Rape" {{ request('type_event') == 'Rape' ? 'selected' : '' }}>Rape</option>
					<option value="Sexual Assault" {{ request('type_event') == 'Sexual Assault' ? 'selected' : '' }}>Sexual Assault</option>
					<option value="Sexual Abuse" {{ request('type_event') == 'Sexual Abuse' ? 'selected' : '' }}>Sexual Abuse</option>
					<option value="Sexual Harassment" {{ request('type_event') == 'Sexual Harassment' ? 'selected' : '' }}>Sexual Harassment</option>
				</select>

				<!-- Submit Button -->
				<button
					type="submit"
					class="bg-blue-600 hover:bg-blue-700 text-white font-medium py-2 px-5 rounded-lg
                           transition-colors duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
					Search
				</button>

				<!-- Filter Button -->
				<button type="button"
					class="bg-[#F7941D] text-white px-4 py-2 rounded-md text-sm font-medium
                           hover:bg-[#e6860f] focus:ring-2 focus:ring-offset-2 focus:ring-[#F7941D]
                           transition duration-150">
					Filter
				</button>
			</form>
		</div>

		<!-- Report Listings -->
		@if($reports->count())

		<!-- Desktop: Table View -->
		<div class="hidden sm:block">
			@include('frontend.pages.reports.partials.table-view')
		</div>

		<!-- Mobile: Card View -->
		<div class="block sm:hidden">
			@include('frontend.pages.reports.partials.card-view')
		</div>

		<!-- Pagination -->
		<div class="mt-8 text-center">
			{{ $reports->links() }}
		</div>

		@else
		<div class="text-center py-16">
			<p class="text-gray-500 text-lg">No reports found.</p>
		</div>
		@endif

	</div>
</section>
@endsection

@push('styles')
<style>
	/* Keep pagination inline for Tailwind layout */
	.pagination {
		display: inline-flex;
		gap: 0.25rem;
	}
</style>
@endpush