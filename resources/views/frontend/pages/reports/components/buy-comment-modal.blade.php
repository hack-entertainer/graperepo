<div class="modal fade" id="buyCommentModal" tabindex="-1" aria-labelledby="buyCommentModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<form action="{{ route('user.buycomments.submit', $report->id) }}" method="POST">
				@csrf
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Purchase Comment/Vote Credits</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p>The Fee to Post a Comment and/or a Vote is $0.50 each.</p>
						<select name="package" required>
							<option value="1">1 comment - $0.50</option>
							<option value="25">25 comments - $12.25</option>
							<option value="100">100 comments - $49.00</option>
						</select>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">Pay with Stripe</button>
					</div>
				</div>
			</form>
		</div>
	</div>