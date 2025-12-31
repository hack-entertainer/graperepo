<!-- resources/views/frontend/layouts/components/header-topbar.blade.php -->
<div class="bg-gray-900 text-gray-200 text-sm py-2">
    <div class="container mx-auto flex flex-col sm:flex-row justify-between items-center px-4 space-y-2 sm:space-y-0">
        
        <!-- Left: Contact Info -->
        <div class="flex flex-wrap items-center justify-center sm:justify-start space-x-4">
            @if(isset($phone))
                <span class="flex items-center space-x-1">
                    <i class="lni lni-phone"></i>
                    <a href="tel:{{ $phone }}" class="hover:text-white transition">{{ $phone }}</a>
                </span>
            @endif

            @if(isset($email))
                <span class="flex items-center space-x-1">
                    <i class="lni lni-envelope"></i>
                    <a href="mailto:{{ $email }}" class="hover:text-white transition">{{ $email }}</a>
                </span>
            @endif
        </div>

        <!-- Right: Authentication Links -->
        <div class="flex items-center space-x-3">
            @guest
                <a href="{{ route('login.form') }}" class="hover:text-white transition">Login</a>
                <span class="hidden sm:inline">|</span>
                <a href="{{ route('register.form') }}" class="hover:text-white transition">Register</a>
            @else
                <a href="{{ route('user.dashboard') }}" class="hover:text-white transition">Dashboard</a>
                <span class="hidden sm:inline">|</span>
                <a href="{{ route('user.logout') }}" 
                   onclick="event.preventDefault(); document.getElementById('logout-form').submit();" 
                   class="hover:text-white transition">Logout</a>
                <form id="logout-form" action="{{ route('user.logout') }}" method="POST" class="hidden">
                    @csrf
                </form>
            @endguest
        </div>
    </div>
</div>
