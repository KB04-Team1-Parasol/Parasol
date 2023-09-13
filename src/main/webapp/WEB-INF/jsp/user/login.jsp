<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="description" content="">
<meta name="author" content="">

<title>Parasol Sign In</title>

<!-- CSS FILES -->
<jsp:include page="/WEB-INF/jsp/settings/css.jsp" />
</head>

<body class="topics-listing-page" id="top">
	<main>
		<!-- header include -->
		<jsp:include page="/WEB-INF/jsp/common/header2.jsp"/>

		<section class="section-padding section-bg justify-content-center align-items-center">
			<div class="container">
				<div>

					<div class="col-lg-12 col-12">
						<h3 class="mb-4 pb-2 text-center">로그인 정보를 입력하세요</h3>
					</div>
					<div class="col-lg-12 col-6">
						<form action="login" method="post" class="custom-form contact-form"
							role="form">
								<div class="col-lg-6 col-12 mx-auto">
									<div class="form-floating">
										<input type="text" name="user_id"
											class="form-control" required/>
										<label for="floatingInput">ID</label>
									</div>
								</div>
								<div class="col-lg-6 col-12 mx-auto">
									<div class="form-floating">
										<input type="password"  name="user_pw"
											class="form-control" required/>
										<label for="floatingInput">Password</label>
									</div>
								</div>
								<div class="row justify-content-center">
									<div class="col-lg-3 col-6">
										<button type="submit" class="form-control">Login</button>
									</div>
									<div class="col-lg-3 col-6">
										<a href="signup" class="form-control btn" id="signupBtn">Sign Up</a>
									</div>
								</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</main>

	<footer class="site-footer section-padding">
		<div class="container">
			<div class="row">

				<div class="col-lg-3 col-12 mb-4 pb-2">
					<a class="navbar-brand mb-2" href="index.html"> <i
						class="bi-back"></i> <span>Topic</span>
					</a>
				</div>

				<div class="col-lg-3 col-md-4 col-6">
					<h6 class="site-footer-title mb-3">Resources</h6>

					<ul class="site-footer-links">
						<li class="site-footer-link-item"><a href="#"
							class="site-footer-link">Home</a></li>

						<li class="site-footer-link-item"><a href="#"
							class="site-footer-link">How it works</a></li>

						<li class="site-footer-link-item"><a href="#"
							class="site-footer-link">FAQs</a></li>

						<li class="site-footer-link-item"><a href="#"
							class="site-footer-link">Contact</a></li>
					</ul>
				</div>

				<div class="col-lg-3 col-md-4 col-6 mb-4 mb-lg-0">
					<h6 class="site-footer-title mb-3">Information</h6>

					<p class="text-white d-flex mb-1">
						<a href="tel: 305-240-9671" class="site-footer-link">
							305-240-9671 </a>
					</p>

					<p class="text-white d-flex">
						<a href="mailto:info@company.com" class="site-footer-link">
							info@company.com </a>
					</p>
				</div>

				<div class="col-lg-3 col-md-4 col-12 mt-4 mt-lg-0 ms-auto">
					<div class="dropdown">
						<button class="btn btn-secondary dropdown-toggle" type="button"
							data-bs-toggle="dropdown" aria-expanded="false">English</button>

						<ul class="dropdown-menu">
							<li><button class="dropdown-item" type="button">Thai</button></li>

							<li><button class="dropdown-item" type="button">Myanmar</button></li>

							<li><button class="dropdown-item" type="button">Arabic</button></li>
						</ul>
					</div>

					<p class="copyright-text mt-lg-5 mt-4">
						Copyright © 2048 Topic Listing Center. All rights reserved. <br>
						<br>Design: <a rel="nofollow" href="https://templatemo.com"
							target="_blank">TemplateMo</a> Distribution <a
							href="https://themewagon.com">ThemeWagon</a>
					</p>

				</div>

			</div>
		</div>
	</footer>

	<!-- JAVASCRIPT FILES -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.bundle.min.js"></script>
	<script src="/js/jquery.sticky.js"></script>
	<script src="/js/custom.js"></script>

</body>
</html>