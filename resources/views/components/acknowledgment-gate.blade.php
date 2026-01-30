<div class="container mt-4">

    @if(!session('landing_acknowledged'))
    <div class="container mt-4">

        @if(session('ack_required'))
        <div
            id="ack-required-alert"
            class="alert alert-danger fw-bold text-center mb-4"
            role="alert">
            ⚠️ You must confirm the checkbox below before you can continue.
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const checkbox = document.getElementById('acknowledge_checkbox');
                if (!checkbox) return;

                const container = checkbox.closest('.form-check');

                container.scrollIntoView({
                    behavior: 'smooth',
                    block: 'center'
                });

                container.classList.add(
                    'border',
                    'border-danger',
                    'rounded',
                    'p-3',
                    'bg-warning-subtle'
                );

                setTimeout(() => {
                    container.classList.remove(
                        'border',
                        'border-danger',
                        'rounded',
                        'p-3',
                        'bg-warning-subtle'
                    );
                }, 6000);
            });
        </script>
        @endif

        <form method="POST" action="/acknowledge" id="acknowledge-form">
            @csrf
            <div class="form-check">
                <input
                    class="form-check-input"
                    type="checkbox"
                    id="acknowledge_checkbox"
                    name="acknowledge"
                    value="1"
                    required>
                <label class="form-check-label" for="acknowledge_checkbox">
                    I have read the information above, understand it, and agree to follow the rules of this site.
                </label>
            </div>
            <div class="mt-3">
                <button type="submit" class="btn btn-primary">
                    Continue
                </button>
            </div>
        </form>

    </div>
    @endif

</div>