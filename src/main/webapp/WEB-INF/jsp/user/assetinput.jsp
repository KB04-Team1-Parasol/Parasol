<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>자산 기입 페이지</title>
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




		<section class="section-padding section-bg">
			<div class="container">
				<div class="row">
					<!-- 자산 정보 기입란 -->
					<div class="col-lg-6 col-12">
						<form action="assetinput_action" method="post"
							class="custom-form contact-form" role="form">
							<div class="row">
								<div class="col-lg-12 col-12">
									<h3 class="mb-4 pb-2">자산 정보를 입력하세요</h3>
									<h6 class="mb-4 pb-2">단, 모르는 정보는 입력하지 마세요 (연금은 현재 기준으로 작성)</h6>
									<!-- <h6 class="mb-4 pb-2">모르는 항목은 0으로 기입 해주세요.</h6> -->
								</div>
								<!-- 폼 필드 및 내용을 추가하십시오 -->
								<!-- 예시: -->
								<div class="col-lg-10 col-12">
									<div class="form-floating">
										<input type="text" name="pure_asset" class="form-control"
											required="" value=0 onfocus="clearDefaultValue(this)"
											onblur="restoreDefaultValue(this)" /> <label
											for="floatingInput"><b>순자산(만원)</b></label>
									</div>
								</div>

								<div class="col-lg-10 col-12">
									<div class="form-floating">
										<input type="text" name="fin_asset" class="form-control"
											required="" value=0 onfocus="clearDefaultValue(this)"
											onblur="restoreDefaultValue(this)" /> <label
											for="floatingInput"><b>금융자산(만원)</b></label>
									</div>
								</div>
								<div class="col-lg-10 col-12">
									<div class="form-floating">
										<input type="text" name="real_asset" class="form-control"
											required="" value=0 onfocus="clearDefaultValue(this)"
											onblur="restoreDefaultValue(this)" /> <label
											for="floatingInput"><b>실물자산(만원)</b></label>
									</div>
								</div>
								<div class="col-lg-10 col-12">
									<div class="form-floating">
										<input type="text" name="debt" class="form-control"
											required="" value=0 onfocus="clearDefaultValue(this)"
											onblur="restoreDefaultValue(this)" /> <label
											for="floatingInput"><b>부채(만원)</b></label>
									</div>
								</div>
								<div class="col-lg-10 col-12">
									<div class="form-floating">
										<input type="text" name="monthly_income" class="form-control"
											required="" value=0 onfocus="clearDefaultValue(this)"
											onblur="restoreDefaultValue(this)" /> <label
											for="floatingInput"><b>월 소득(만원)</b></label>
									</div>
								</div>
								<div class="col-lg-10 col-12">
									<div class="form-floating">
										<input type="text" name="annuity" class="form-control"
											required="" value=0 onfocus="clearDefaultValue(this)"
											onblur="restoreDefaultValue(this)" /> <label
											for="floatingInput"><b>연금(만원)</b></label>
									</div>
								</div>
								<div class="col-lg-10 col-12">
									<div class="form-floating">
										<input type="text" name="hope_age" class="form-control"
											required="" value=60 onfocus="clearDefaultValue(this)"
											onblur="restoreDefaultValue(this)" /> <label
											for="floatingInput"><b>입주 예상 (만)나이</b></label>
									</div>
								</div>
								<div class="col-lg-10 col-12">
									<div class="form-floating">
										<input type="text" name="hope_period" class="form-control"
											required="" value=1 onfocus="clearDefaultValue(this)"
											onblur="restoreDefaultValue(this)" /> <label
											for="floatingInput"><b>희망 거주 기간(년)</b></label>
									</div>
								</div>
								<!-- 다른 폼 필드도 유사하게 추가하십시오 -->

								<div class="col-lg-6 col-12" id="asset_input_bt">
									<button type="submit" class="form-control">등록하기</button>
								</div>
							</div>
						</form>
					</div>

					<!-- 상세 보기란 -->
					<div class="col-lg-6 col-12">
						<form class="custom-form contact-form" role="form">
							<div class="row">
								<div class="col-lg-12 col-12">
									<h3 class="mb-4 pb-2">궁금해요 ! !</h3>
									<div style="margin-left: 100px">
										<img src="https://i.ibb.co/C50116J/friends-Bibi.png"
											alt="friends-Bibi" border="0"> 
											<img
											src="https://i.ibb.co/1q2ynH4/friends-Ramu.png"
											alt="friends-Ramu" border="0"> <img
											src="https://i.ibb.co/4JzFLjb/friends-Cauli.png"
											alt="friends-Cauli" border="0"><img
											src="https://i.ibb.co/60VVQCn/friends-Kiki.png"
											alt="friends-Kiki" border="0">
									</div>
									<!-- 폼 필드 및 내용을 추가하십시오 -->
								</div>

								<!-- 탭 네비게이션 -->
								<ul class="nav nav-tabs" id="myTabs" role="tablist">
									<li class="nav-item" role="presentation"><a
										class="nav-link active" id="tab1-tab" data-toggle="tab"
										href="#tab1" role="tab" aria-controls="tab1"
										aria-selected="true"><b>순자산</b></a></li>
									<li class="nav-item" role="presentation"><a
										class="nav-link" id="tab2-tab" data-toggle="tab" href="#tab2"
										role="tab" aria-controls="tab2" aria-selected="false"><b>금융자산</b></a>
									</li>
									<li class="nav-item" role="presentation"><a
										class="nav-link" id="tab3-tab" data-toggle="tab" href="#tab3"
										role="tab" aria-controls="tab3" aria-selected="false"><b>실물자산</b></a>
									</li>
									<li class="nav-item" role="presentation"><a
										class="nav-link" id="tab4-tab" data-toggle="tab" href="#tab4"
										role="tab" aria-controls="tab4" aria-selected="false"><b>부채</b></a></li>
								</ul>

								<!-- 탭 콘텐츠 -->
								<div class="tab-content" id="myTabsContent">
									<div class="tab-pane fade show active" id="tab1"
										role="tabpanel" aria-labelledby="tab1-tab">
										<p>
											<b>순자산</b>은 개인 또는 가구의 금융적인 상태를 나타내는 지표로, <b>모든 자산에서 부채를 뺀
												금액</b>입니다.
										</p>
									</div>
									<div class="tab-pane fade" id="tab2" role="tabpanel"
										aria-labelledby="tab2-tab">
										<p>
											<b>금융자산</b>은 현금, 은행 예금, 주식, 채권, 투자 펀드 등과 같은 <b>보유 하신
												금융상품의 재산</b>입니다.
										</p>
									</div>
									<div class="tab-pane fade" id="tab3" role="tabpanel"
										aria-labelledby="tab3-tab">
										<p>
											<b>실물자산</b>은 부동산, 자동차, 보석, 예술품, 비즈니스 등과 같은 <b>실질적인 물건</b>을
											나타냅니다.
										</p>
									</div>
									<div class="tab-pane fade" id="tab4" role="tabpanel"
										aria-labelledby="tab4-tab">
										<p>
											<b>부채</b>는 개인 또는 가구가 다른 개인, 기업 또는 <b>금융 기관에 대해 갚아야 할 돈</b>을
											나타냅니다. 주택 대출, 신용카드 빚, 학자금 대출 등이 예시입니다.
										</p>
									</div>
								</div>


								<!-- 다른 폼 필드도 유사하게 추가하십시오 -->
								<div></div>

							</div>
						</form>
					</div>
				</div>
			</div>
		</section>



		<!-- 하단 부분 -->
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

		<!--  자산 정보 기입란에 사용 -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<script>
			function clearDefaultValue(input) {
				if (input.value === input.defaultValue) {
					input.value = '';
				}
			}
			function restoreDefaultValue(input) {
				if (input.value === '') {
					input.value = input.defaultValue;
				}
			}
		</script>


	</main>
</body>
</html>