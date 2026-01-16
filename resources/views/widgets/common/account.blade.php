<section class="bg-white shadow rounded p-6">
    <h2 class="text-xl font-semibold">
        Account
    </h2>

    <p class="text-sm text-gray-500 mt-1">
        Manage your session.
    </p>

    <div class="mt-4">
        <form method="POST" action="{{ route('logout') }}">
            @csrf
            <button
                type="submit"
                class="text-sm text-blue-600 hover:underline"
            >
                Log out
            </button>
        </form>
    </div>
</section>
