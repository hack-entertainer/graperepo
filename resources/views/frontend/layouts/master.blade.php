<!DOCTYPE html>
<html lang="zxx">
<head>
	@include('frontend.layouts.head')	
</head>
<body class="js">
	
	<!-- Preloader -->
	<!-- <div class="preloader">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span>
				<span></span>
			</div>
		</div>
	</div> -->
	<!-- End Preloader -->
	
	<!-- Header -->
	@include('frontend.layouts.header')
	@include('frontend.layouts.notification') 
	<!--/ End Header -->
	@yield('main-content')
	
	@include('frontend.layouts.footer')

	<!-- Breakpoint Logger -->
	<script>
	(function() {
	  function logLayout() {
	    const w = window.innerWidth;
	    let bp = 'xl';
	    if (w < 640) bp = 'sm';
	    else if (w < 768) bp = 'md';
	    else if (w < 1024) bp = 'lg';
	    const info = {
	      layout: {
	        width: w,
	        breakpoint: bp,
	        height: window.innerHeight,
	        orientation: (w > window.innerHeight) ? 'landscape' : 'portrait',
	        devicePixelRatio: window.devicePixelRatio,
	        timestamp: new Date().toISOString()
	      }
	    };
	    console.clear();
	    console.log('%c📐 Layout Debug Info', 'color: #00ffff; font-weight: bold; font-size: 14px;');
	    console.table(info.layout);
	  }

	  logLayout();
	  window.addEventListener('resize', logLayout);
	  window.addEventListener('orientationchange', logLayout);
	})();
	</script>

</body>
</html>
