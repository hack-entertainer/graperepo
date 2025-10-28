<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="csrf-token" content="{{ csrf_token() }}">
	<title>RRDB || DASHBOARD</title>

	<!-- Custom fonts for this template-->
	<link href="{{asset('backend/vendor/fontawesome-free/css/all.min.css')}}" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

	<!-- Custom styles for this template-->
	<link href="{{asset('backend/css/sb-admin-2.min.css')}}" rel="stylesheet">


	<style>
		/* Remove "Previous" and "Next" buttons from Laravel Tailwind pagination */
		nav[role="navigation"] span[aria-label*="Previous"],
		nav[role="navigation"] a[aria-label*="Previous"],
		nav[role="navigation"] span[aria-label*="Next"],
		nav[role="navigation"] a[aria-label*="Next"] {
			display: none !important;
		}

		/* Optional: center the numeric pagination */
		nav[role="navigation"]>div:first-child {
			justify-content: center !important;
		}
	</style>


	@stack('styles')

</head>