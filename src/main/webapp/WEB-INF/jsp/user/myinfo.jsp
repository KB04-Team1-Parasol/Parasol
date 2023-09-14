<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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

<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700&display=swap" rel="stylesheet">

</head>
<body id="top">
	<main>

		<!-- header include -->
		<jsp:include page="/WEB-INF/jsp/common/header2.jsp" />


		<!-- 메인 바디 -->
	<section class="section-padding"></section>
		<div
			style=" margin-bottom: 180px; display: flex; justify-content: space-around;">
			<div class="profile_inner" style="margin-left: 120px;">
				<div
					style="display: flex; align-items: center; margin-bottom: 20px;">
					<img src="https://i.ibb.co/0MwnT7J/icon-set1.png" alt="icon-set1"
						border="0" width="120" height="120">
					<div class="now_asset_text">보유 자산 현황</div>
				</div>
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
					<div class="title">

						<span class="info_title_text">내프로필</span>
					</div>

					<ul class="base_row" style="font-family: 'Nunito', sans-serif;">
						<li>
							<div class="row_item id ">
								<span class="info_item_text"><b>아이디</b> : ${user.userId} </span>
							</div>
						</li>
						<li>
							<div class="row_item name">
								<span class="info_item_text"><b>이름</b> : ${user.userName } </span>
							</div>
						</li>
						<li>
							<div class="row_item age">
								<span class="info_item_text"><b>나이</b> : ${user.userAge } </span>
							</div>
						</li>


					</ul>

				</div>


				<div class="asset_box">
					<a href="/user/assetinput" class="title"
						onclick="nclk(this,'nid.myprofilego','','',event)"> <span
						class="asset_title_text">자산정보</span>

					</a>	
					<!--  신규 회원 가입 시 자산 정보 미기입 상태 -->


					<ul class="base_row" style="font-family: 'Nunito', sans-serif;">
					<c:choose>
					<c:when test="${empty userAsset.finAsset}">
						<span class="item_text">맞춤 서비스를 이용하시려면 자산 정보를 기입해주세요.</span>
					</c:when>
					<c:otherwise>
						<li>
							<div class="row_item phone ">
								<span class="item_text"> <b>금융자산</b> : ${userAsset.finAsset}</span>

							</div>
						</li>

						<li>
							<div class="row_item phone ">
								<span class="item_text"> <b>실물자산</b> : ${userAsset.realAsset}</span>

							</div>
						</li>

						<li>
							<div class="row_item phone">
								<span class="item_text"> <b>현금</b> :${userAsset.pureAsset - userAsset.realAsset - userAsset.finAsset + userAsset.debt }
								</span>
							</div>
						</li>

						<li>
							<div class="row_item phone ">
								<span class="item_text"> <b>부채</b> : ${userAsset.debt}</span>

							</div>
						</li>
						<li>
							<div class="row_item phone ">
								<span class="item_text"> <b>월 소득</b> :
									${userAsset.monthlyIncome}</span>

							</div>
						</li>
						<li>
							<div class="row_item phone ">
								<span class="item_text"> <b>연금</b> : ${userAsset.annuity}</span>

							</div>
						</li>
						<li>
							<div class="row_item phone ">
								<span class="item_text"> <b>입주 예상 나이</b> : ${userAsset.hopeAge}</span>

							</div>
						</li>
						<li>
							<div class="row_item phone ">
								<span class="item_text"> <b>희망 거주 기간</b> :
									${userAsset.hopePeriod}</span>

							</div>
						</li>
						</c:otherwise>
					</c:choose>
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