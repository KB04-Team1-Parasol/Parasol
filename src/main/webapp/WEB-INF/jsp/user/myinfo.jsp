<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>마이페이지</title>
<!-- CSS FILES -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700&family=Open+Sans&display=swap"
	rel="stylesheet">
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/bootstrap-icons.css" rel="stylesheet">
<link href="/css/templatemo-topic-listing.css" rel="stylesheet">
<link href="/css/custom.css" rel="stylesheet">
</head>
<body id="top">
	<main>

		<nav class="navbar navbar-expand-lg">
			<div class="container">
				<a class="navbar-brand" href="index.html"> <i class="bi-back"></i>
					<span>Parasol</span>
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
						<li class="nav-item"><a class="nav-link click-scroll"
							href="#section_1">실버타운</a></li>
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
								<li><a class="dropdown-item" href="topics-listing.html">Topics
										Listing</a></li>
								<li><a class="dropdown-item" href="contact.html">Contact
										Form</a></li>
							</ul></li>
					</ul>
					<div class="d-none d-lg-block">
						<a href="#top" class="navbar-icon bi-person smoothscroll"></a>
					</div>
				</div>
			</div>
		</nav>


		<!-- 메인 바디 -->

		<div
			style="margin-top: 180px; margin-bottom: 180px; margin-left : 180px; display: flex; justify-content: space-around;">
			<div class="profile_inner">
				<canvas id="myChart" width="400" height="400"></canvas>

				<script>
					// EL을 사용하여 JSP 페이지에서 데이터를 JavaScript 변수로 초기화
					var pureAsset = "${userAsset.pureAsset}";
					var finAsset = "${userAsset.finAsset}";
					var realAsset = "${userAsset.realAsset}";
					var debt = "${userAsset.debt}";
					var monthlyIncome = "${userAsset.monthlyIncome}";
					var annuity = "${userAsset.annuity}";
				</script>

			</div>


			<div class="info_box">
				<div class="base_box">
					<a href="/user2/help/myInfoV2?m=viewProfile&amp;lang=ko_KR"
						class="title" onclick="nclk(this,'nid.myprofilego','','',event)">

						<span class="title_text">내프로필</span>
					</a>

					<ul class="base_row">
						<li>
							<div class="row_item name ">
								<span class="item_text"></span>

							</div>
						</li>

						<li>
							<div id="phoneNoRegDiv" class="row_item phone ">
								<span id="phoneNoRegSpan" class="item_text"> </span>

								<table>
									<tr>
										<td>User ID:</td>
										<td>${user.userId}</td>
									</tr>
									<tr>
										<td>User Name:</td>
										<td>${user.userName }</td>
									</tr>
									<tr>
										<td>User Age:</td>
										<td>${user.userAge }</td>
									</tr>
								</table>
							</div>
						</li>


					</ul>

				</div>


				<div class="asset_box">
					<a href="/user/assetinput" class="title"
						onclick="nclk(this,'nid.myprofilego','','',event)"> <span
						class="title_text">자산정보</span>

					</a>



					<ul class="base_row">
						<li>
							<div id="phoneNoRegDiv" class="row_item phone ">
								<span id="phoneNoRegSpan" class="item_text"> 순자산 :
									${userAsset.pureAsset}</span>

							</div>
						</li>

						<li>
							<div id="phoneNoRegDiv" class="row_item phone ">
								<span id="phoneNoRegSpan" class="item_text"> 금융자산 :
									${userAsset.finAsset}</span>

							</div>
						</li>

						<li>
							<div id="phoneNoRegDiv" class="row_item phone ">
								<span id="phoneNoRegSpan" class="item_text"> 실물자산 :
									${userAsset.realAsset}</span>

							</div>
						</li>
						<li>
							<div id="phoneNoRegDiv" class="row_item phone ">
								<span id="phoneNoRegSpan" class="item_text"> 부채 :
									${userAsset.debt}</span>

							</div>
						</li>
						<li>
							<div id="phoneNoRegDiv" class="row_item phone ">
								<span id="phoneNoRegSpan" class="item_text"> 월 소득 :
									${userAsset.monthlyIncome}</span>

							</div>
						</li>
						<li>
							<div id="phoneNoRegDiv" class="row_item phone ">
								<span id="phoneNoRegSpan" class="item_text"> 연금 :
									${userAsset.annuity}</span>

							</div>
						</li>
						<li>
							<div id="phoneNoRegDiv" class="row_item phone ">
								<span id="phoneNoRegSpan" class="item_text"> 입주 예상 나이 :
									${userAsset.hopeAge}</span>

							</div>
						</li>
						<li>
							<div id="phoneNoRegDiv" class="row_item phone ">
								<span id="phoneNoRegSpan" class="item_text"> 희망 거주 기간 :
									${userAsset.hopePeriod}</span>

							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<a href="logout" class="form-control btn" id="logoutBtn">Log Out</a>


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
		<script src="/js/click-scroll.js"></script>
		<script src="/js/custom.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
		<script src="/js/asset_info_chart.js"></script>

	</main>
</body>
</html>