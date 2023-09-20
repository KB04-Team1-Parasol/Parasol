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
<jsp:include page="/WEB-INF/jsp/settings/css.jsp"/>
<link href="/css/common.css" rel="stylesheet">
</head>
<body id="top">
	<main>

		<!-- header include -->
		<jsp:include page="/WEB-INF/jsp/common/header2.jsp" />
		
		<header
			class="site-header-finance d-flex flex-column justify-content-center align-items-center">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-5 col-12">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/index">HOME</a></li>
								<li class="breadcrumb-item active" aria-current="page">마이페이지</li>
							</ol>
						</nav>

						<h2 class="text-white">자산정보 기입</h2>
					</div>
				</div>
			</div>
		</header>
		
		<section class="section-padding section-bg">
			<div class="container shadow-lg custom-block1">
				<div class="row align-items-center">
					<h3 class="text-center mb-5">자산정보 입력</h3>
					<!-- 상세 보기란 -->
					<div class="col-lg-6 col-12">
						<form class="custom-form contact-form" role="form">
							<div class="row">
								<div class="col-lg-12 col-12 text-center">
									<div id="imageContainer">

										<a href="#;" id="image1-link" class="img_class"
											style="text-decoration: none; cursor: pointer;"> <img
											src="https://i.ibb.co/C50116J/friends-Bibi.png"
											alt="friends-Bibi" border="0" id="image1"
											style="opacity: 1; margin-left: 5px;">
										</a> <a href="#;" id="image2-link" class="img_class"
											style="text-decoration: none; cursor: pointer;"> <img
											src="https://i.ibb.co/4JzFLjb/friends-Cauli.png"
											alt="friends-Cauli" border="0" id="image2"
											style="opacity: 0.3; margin-left: 42px;">
										</a> <a href="#;" id="image3-link" class="img_class"
											style="text-decoration: none; cursor: pointer;"> <img
											src="https://i.ibb.co/60VVQCn/friends-Kiki.png"
											alt="friends-Kiki" border="0" id="image3"
											style="opacity: 0.3; margin-left: 20px;">
										</a> <a href="#;" id="image4-link" class="img_class"
											style="text-decoration: none; cursor: pointer;"> <img
											src="https://i.ibb.co/1q2ynH4/friends-Ramu.png"
											alt="friends-Ramu" border="0" id="image4"
											style="opacity: 0.3;">
										</a>
									</div>
									<!-- 폼 필드 및 내용을 추가하십시오 -->
								</div>

								<!-- 탭 네비게이션 -->
								<ul class="nav nav-tabs" id="myTabs" role="tablist">
									<li class="nav-item" role="presentation"><a
										class="nav-link" id="tab1-tab" data-toggle="tab" href="#tab1"
										role="tab" aria-controls="tab1" aria-selected="true"><b>금융자산</b></a>
									</li>
									<li class="nav-item" role="presentation"><a
										class="nav-link" id="tab2-tab" data-toggle="tab" href="#tab2"
										role="tab" aria-controls="tab2" aria-selected="false"><b>실물자산</b></a>
									</li>
									<li class="nav-item" role="presentation"><a
										class="nav-link" id="tab3-tab" data-toggle="tab" href="#tab3"
										role="tab" aria-controls="tab3" aria-selected="false"><b>현금</b></a></li>
									<li class="nav-item" role="presentation"><a
										class="nav-link" id="tab4-tab" data-toggle="tab" href="#tab4"
										role="tab" aria-controls="tab4" aria-selected="false"><b>부채</b></a></li>
								</ul>

								<!-- 탭 콘텐츠 -->
								<div class="tab-content" id="myTabsContent">
									<div class="tab-pane fade" id="tab1" role="tabpanel"
										aria-labelledby="tab1-tab">
										<p>
											<b>금융자산</b>은 현금, 은행 예금, 주식, 채권, 투자 펀드 등과 같은 <b>보유 하신
												금융상품의 재산</b>입니다.
										</p>

									</div>
									<div class="tab-pane fade" id="tab2" role="tabpanel"
										aria-labelledby="tab2-tab">
										<p>
											<b>실물자산</b>은 부동산, 자동차, 보석, 예술품, 비즈니스 등과 같은 <b>실질적인 물건</b>을
											나타냅니다.
										</p>
									</div>
									<div class="tab-pane fade" id="tab3" role="tabpanel"
										aria-labelledby="tab3-tab">
										<p>
											<b>현금</b>은 금융자산과 실물자산을 제외한 <b>보유 하신 현금</b>을 나타냅니다.
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
							</div>
						</form>
					</div>
				
					<!-- 자산 정보 기입란 -->
					<div class="col-lg-6 col-12">
						<form action="assetinput_action" method="post"
							class="custom-form contact-form" role="form">
							<div>
								<div class="col-lg-9 mx-auto">
									<div class="form-floating">
										<input type="text" name="fin_asset" class="form-control"
											required="" value=0 onfocus="clearDefaultValue(this)"
											onblur="restoreDefaultValue(this)" /> <label
											for="floatingInput"><b>금융자산(만원)</b></label>
									</div>
								</div>
								<div class="col-lg-9 mx-auto">
									<div class="form-floating">
										<input type="text" name="real_asset" class="form-control"
											required="" value=0 onfocus="clearDefaultValue(this)"
											onblur="restoreDefaultValue(this)" /> <label
											for="floatingInput"><b>실물자산(만원)</b></label>
									</div>
								</div>
								<div class="col-lg-9 mx-auto">
									<div class="form-floating">
										<input type="text" name="pure_asset" class="form-control"
											required="" value=0 onfocus="clearDefaultValue(this)"
											onblur="restoreDefaultValue(this)" /> <label
											for="floatingInput"><b>현금(만원)</b></label>
									</div>
								</div>
								<div class="col-lg-9 mx-auto">
									<div class="form-floating">
										<input type="text" name="debt" class="form-control"
											required="" value=0 onfocus="clearDefaultValue(this)"
											onblur="restoreDefaultValue(this)" /> <label
											for="floatingInput"><b>부채(만원)</b></label>
									</div>
								</div>
								<div class="col-lg-9 mx-auto">
									<div class="form-floating">
										<input type="text" name="monthly_income" class="form-control"
											required="" value=0 onfocus="clearDefaultValue(this)"
											onblur="restoreDefaultValue(this)" /> <label
											for="floatingInput"><b>월 소득(만원)</b></label>
									</div>
								</div>
								<div class="col-lg-9 mx-auto">
									<div class="form-floating">
										<input type="text" name="annuity" class="form-control"
											required="" value=0 onfocus="clearDefaultValue(this)"
											onblur="restoreDefaultValue(this)" /> <label
											for="floatingInput"><b>연금(만원) * 현재 기준</b></label>
									</div>
								</div>
								<div class="col-lg-9 mx-auto">
									<div class="form-floating">
										<input type="text" name="hope_age" class="form-control"
											required="" value=60 onfocus="clearDefaultValue(this)"
											onblur="restoreDefaultValue(this)" /> <label
											for="floatingInput"><b>입주 예상 (만)나이</b></label>
									</div>
								</div>
								<div class="col-lg-9 mx-auto">
									<div class="form-floating">
										<input type="text" name="hope_period" class="form-control"
											required="" value=1 onfocus="clearDefaultValue(this)"
											onblur="restoreDefaultValue(this)" /> <label
											for="floatingInput"><b>희망 거주 기간(년)</b></label>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="col-lg-2 mx-auto mt-4" id="asset_input_bt">
						<button type="submit" class="form-control custom_submit">등록하기</button>
					</div>
				</div>
			</div>
		</section>

		<!-- footer include -->
		<jsp:include page="/WEB-INF/jsp/common/custom_footer.jsp" />

		<!-- JAVASCRIPT FILES -->
		<jsp:include page="/WEB-INF/jsp/settings/js.jsp" />
		
		<!-- 자산 정보 기입란에 사용 -->
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

		<!-- KB 캐릭터 이미지 보여주기 효과 -->
		<script src="/js/asset_info_effect_images.js"></script>


	</main>
</body>
</html>