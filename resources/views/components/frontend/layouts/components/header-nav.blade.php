<!-- resources/views/frontend/layouts/components/header-nav.blade.php -->
<nav 
    x-data="{ open: false }"
    class="bg-gray-800 text-gray-200"
>
    <div class="container mx-auto flex items-center justify-between px-4 py-3 sm:py-4">

        <!-- Left: Brand or Menu Label (optional) -->
        <div class="flex items-center space-x-2">
            <button 
                @click="open = !open" 
                class="sm:hidden p-2 rounded-md hover:bg-gray-700 focus:outline-none"
                aria-label="Toggle menu"
            >
                <!-- Hamburger Icon -->
                <svg x-show="!open" xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
                </svg>
                <!-- Close Icon -->
                <svg x-show="open" xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                </svg>
            </button>
        </div>

        <!-- Desktop Navigation -->
        <ul class="hidden sm:flex space-x-6 text-sm font-medium">
            <li><a href="{{ route('home') }}" class="hover:text-white transition">Home</a></li>
            <li><a href="{{ route('about-us') }}" class="hover:text-white transition">About</a></li>
            <li><a href="{{ route('product-grids') }}" class="hover:text-white transition">Products</a></li>
            <li><a href="{{ route('blog') }}" class="hover:text-white transition">Blog</a></li>
            <li><a href="{{ route('contact') }}" class="hover:text-white transition">Contact</a></li>
        </ul>

        <!-- Optional Right-Side Slot (icons, search, etc.) -->
        <div class="hidden sm:flex items-center space-x-3">
            {{ $slot ?? '' }}
        </div>
    </div>

    <!-- Mobile Navigation -->
    <div 
        x-show="open" 
        x-transition 
        class="sm:hidden bg-gray-700 border-t border-gray-600"
    >
        <ul class="flex flex-col space-y-1 px-4 py-3 text-sm font-medium">
            <li><a href="{{ route('home') }}" class="block hover:text-white transition">Home</a></li>
            <li><a href="{{ route('about-us') }}" class="block hover:text-white transition">About</a></li>
            <li><a href="{{ route('product-grids') }}" class="block hover:text-white transition">Products</a></li>
            <li><a href="{{ route('blog') }}" class="block hover:text-white transition">Blog</a></li>
            <li><a href="{{ route('contact') }}" class="block hover:text-white transition">Contact</a></li>
        </ul>
    </div>
</nav>
