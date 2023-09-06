<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실버타운 상세보기</title>
<!-- CSS FILES -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700&family=Open+Sans&display=swap"
	rel="stylesheet">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap-icons.css" rel="stylesheet">
<link href="../css/templatemo-topic-listing.css" rel="stylesheet">
<link href="../css/custom.css" rel="stylesheet">
</head>
<body id="top">
	<main>
		<nav class="navbar navbar-expand-lg">
			<div class="container">
				<a class="navbar-brand" href="index.html"> <i class="bi-back"></i>
					<span>Topic</span>
				</a>
				<div class="d-lg-none ms-auto me-4">
					<a href="#top" class="navbar-icon bi-person smoothscroll"></a>
				</div>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav ms-lg-5 me-lg-auto">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarLightDropdownMenuLink" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">실버타운</a>
							<ul class="dropdown-menu dropdown-menu-light"
								aria-labelledby="navbarLightDropdownMenuLink">
								<li><a class="dropdown-item" href="silver/search">실버타운 검색</a></li>
								<li><a class="dropdown-item" href="silver/custom">맞춤 실버타운 찾기</a></li>
							</ul>
						</li>
						<li class="nav-item"><a class="nav-link click-scroll"
							href="#section_2">금융상품</a></li>
						<li class="nav-item"><a class="nav-link click-scroll"
							href="#section_3">Information</a></li>
						<li class="nav-item"><a class="nav-link click-scroll"
							href="#section_4">FAQs</a></li>
						<li class="nav-item"><a class="nav-link click-scroll"
							href="#section_5">Contact</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarLightDropdownMenuLink" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">Pages</a>
							<ul class="dropdown-menu dropdown-menu-light"
								aria-labelledby="navbarLightDropdownMenuLink">
								<li><a class="dropdown-item" href="topics-listing.html">Topics Listing</a></li>
								<li><a class="dropdown-item" href="contact.html">Contact Form</a></li>
							</ul>
						</li>
					</ul>
					<div class="d-none d-lg-block">
						<a href="#top" class="navbar-icon bi-person smoothscroll"></a>
					</div>
				</div>
			</div>
		</nav>
		
		<section class="contact-section section-padding section-bg"
			id="section_5">
			<div class="container">
				<div class="row">

					<div class="col-lg-12 col-12 text-center">
						<h2 class="mb-5">${ dto.getStName() }</h2>
					</div>

					<div class="col-lg-5 col-12 mb-4 mb-lg-0">
						<iframe class="google-map"
							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2595.065641062665!2d-122.4230416990949!3d37.80335401520422!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80858127459fabad%3A0x808ba520e5e9edb7!2sFrancisco%20Park!5e1!3m2!1sen!2sth!4v1684340239744!5m2!1sen!2sth"
							width="100%" height="250" style="border: 0;" allowfullscreen=""
							loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
						${ dto.getStImgUrl() }
					</div>

					<div class="col-lg-3 col-md-6 col-12 mb-3 mb-lg- mb-md-0 ms-auto">
						<h4 class="mb-3">${ dto.getStdRoomType() }</h4>

						<hr>

						<p class="d-flex align-items-center mb-1">
							<span class="me-2">보증금 ${ dto.getStdDeposit()*10000 }원</span>
						</p>

						<p class="d-flex align-items-center">
							<span class="me-2">월세 ${ dto.getStdMonthlyCost()*10000 }원</span>
						</p>
					</div>

					<div class="col-lg-3 col-md-6 col-12 mx-auto">
						<h4 class="mb-3">Dubai office</h4>

						<p>Burj Park, Downtown Dubai, United Arab Emirates</p>

						<hr>

						<p class="d-flex align-items-center mb-1">
							<span class="me-2">Phone</span> <a href="tel: 110-220-3400"
								class="site-footer-link"> 110-220-3400 </a>
						</p>

						<p class="d-flex align-items-center">
							<span class="me-2">Email</span> <a href="mailto:info@company.com"
								class="site-footer-link"> info@company.com </a>
						</p>
					</div>

				</div>
			</div>
		</section>
		
	</main>
</body>
</html>