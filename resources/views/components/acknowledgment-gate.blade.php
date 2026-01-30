<div class="container mt-4">

    <div class="container mt-4">

        <form method="POST" action="/acknowledge">
            @csrf

            <div class="form-check">
                <input
                    class="form-check-input"
                    type="checkbox"
                    id="acknowledge_checkbox"
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


</div>
