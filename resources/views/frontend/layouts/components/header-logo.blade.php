<!-- resources/views/frontend/layouts/header.blade.php -->
<header class="header shadow-sm border-b border-gray-200">

	<!-- Topbar: contact info + auth links -->
	<x-frontend.layouts.components.header-topbar
		:phone="$settings->phone ?? null"
		:email="$settings->email ?? null" />

	<!-- Logo section: centered on mobile, left-aligned on desktop -->
	<x-frontend.layouts.components.header-logo
		:logo="$settings->logo ?? asset('frontend/img/logo.png')"
		alt="Your Brand">
		<!-- Optional tagline or secondary element -->
		<span class="text-sm text-gray-500 hidden sm:inline">
			Trusted Reports Since 2024
		</span>
	</x-frontend.layouts.components.header-logo>

	<!-- Navigation: responsive + Alpine-driven -->
	<x-frontend.layouts.components.header-nav>
		<!-- Slot content for desktop right side -->
		<a href="{{ route('cart') }}" class="hover:text-white transition">Cart</a>
		<a href="{{ route('wishlist') }}" class="hover:text-white transition">Wishlist</a>
		@auth
		<a href="{{ route('user.dashboard') }}" class="hover:text-white transition">Dashboard</a>
		@endauth
	</x-frontend.layouts.components.header-nav>

</header>