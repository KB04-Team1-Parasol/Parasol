<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kbits.kb04.parasol.auth.TokenDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String grantType = "";
	String accessToken = "";
	TokenDto tokenDto = (TokenDto) request.getSession().getAttribute("tokenDto");
	if (tokenDto != null) {
	    grantType = tokenDto.getGrantType();
	    accessToken = tokenDto.getAccessToken();
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>파라다이스 라이프 솔루션</title>
<!-- css setting -->
<jsp:include page="/WEB-INF/jsp/settings/css.jsp"/>
<link href="/css/finance/custom-fin.css" rel="stylesheet">

</head>
<body id="top">
<script>
    // 서버에서 전달된 토큰 정보
    var grantType = "<%= grantType %>";
    var accessToken = "<%= accessToken %>";

    // XMLHttpRequest 객체 생성
    var xhr = new XMLHttpRequest();

    // HTTP 요청 설정
    xhr.open("GET", "http://localhost:8080/user/login", true);

    // Access Token을 "Authorization" 헤더에 설정
    xhr.setRequestHeader("Authorization", grantType + " " + accessToken);

    // 요청 완료 후의 동작 설정
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) { // 요청이 완료되면
            if (xhr.status === 200) { // 성공적인 응답
                var response = xhr.responseText;
                console.log("서버 응답: " + response);
            } else {
                console.error("오류 발생: " + xhr.status);
            }
        }
    };

    // 요청 보내기
    xhr.send();
</script>
	<main>
		<!-- header include -->
		<jsp:include page="/WEB-INF/jsp/common/header2.jsp"/>
		
		<section class="pb-0">
			<div class="row justify-content-center text-center h-100">
				<div class="">
					<div id="carouselExampleInterval" class="carousel slide h-100"
						data-bs-ride="carousel">
						<div class="carousel-indicators ci_custom">
							<button type="button" data-bs-target="#carouselExampleInterval"
								data-bs-slide-to="0" class="active" aria-current="true"
								aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleInterval"
								data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselExampleInterval"
								data-bs-slide-to="2" aria-label="Slide 3"></button>
						</div>
						<div class="carousel-inner">
							<div class="carousel-item active" data-bs-interval="3000">
								<img src="images/main/배너1.png"
									class="custom-block-image img-fluid">
							</div>
							<div class="carousel-item" data-bs-interval="3000">
								<img src="images/main/배너2.png"
									class="custom-block-image img-fluid">
							</div>
							<div class="carousel-item" data-bs-interval="3000">
								<img src="images/main/배너3.png"
									class="custom-block-image img-fluid">
							</div>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleInterval" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>
			</div>
		</section>

		<section
			class="hero-section d-flex justify-content-center align-items-center" id="section_1">
			<div class="container">
				<div class="row">

					<div class="col-lg-8 col-12 mx-auto">
						<h1 class="text-black text-center">나에게 맞는 실버타운은?</h1>

						<h6 class="text-center">나만의 실버타운을 찾아보세요!</h6>

						<form method="get" class="custom-form mt-4 pt-2 mb-lg-0 mb-5"
							role="search" action="/silver/search_keyword">
							<div class="input-group input-group-lg">
								<span class="input-group-text bi-search" id="basic-addon1">

								</span> <input name="keyword" type="search" class="form-control"
									id="keyword" placeholder="검색어를 입력하세요"
									aria-label="Search">

								<button type="submit" class="form-control">Search</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>

		<section class="explore-section section-padding" id="section_2">
			<div class="container">
				<div class="col-12 text-center">
					<h2 class="mb-4">
						이달의 추천 정보
						</h1>
				</div>

			</div>
			</div>

			<div class="container-fluid">
				<div class="row">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="design-tab"
								data-bs-toggle="tab" data-bs-target="#design-tab-pane"
								type="button" role="tab" aria-controls="design-tab-pane"
								aria-selected="true">실버타운</button>
						</li>

						<li class="nav-item" role="presentation">
							<button class="nav-link" id="marketing-tab" data-bs-toggle="tab"
								data-bs-target="#marketing-tab-pane" type="button" role="tab"
								aria-controls="marketing-tab-pane" aria-selected="false">금융</button>
						</li>

						<li class="nav-item" role="presentation">
							<button class="nav-link" id="finance-tab" data-bs-toggle="tab"
								data-bs-target="#finance-tab-pane" type="button" role="tab"
								aria-controls="finance-tab-pane" aria-selected="false">건강정보</button>
						</li>
					</ul>
				</div>
			</div>

			<div class="container">
				<div class="row">

					<div class="col-12">
						<div class="tab-content" id="myTabContent">

							<!-- 실버타운 탭 -->
							<div class="tab-pane fade show active" id="design-tab-pane"
								role="tabpanel" aria-labelledby="marketing-tab" tabindex="0">
								<div class="row">
									<div class="col-lg-4 col-md-6 col-12 mb-4 mb-lg-3">
										<div class="custom-block bg-white shadow-lg">
											<a href="/info/info/9">
												<div class="d-flex">
													<div>
														<h5 class="mb-2">수요 증가하는 실버타운… 대기 시간 5년·보증금 최고 9억 원</h5>

													</div>
												</div> <img src="https://img.etoday.co.kr/pto_db/2023/07/600/20230714114306_1905977_1200_600.jpg"
												class="custom-block-image img-fluid" onerror="this.src='/images/main.jpg'">
											</a>
										</div>
									</div>

									<div class="col-lg-4 col-md-6 col-12 mb-4 mb-lg-3">
										<div class="custom-block bg-white shadow-lg">
											<a href="/info/info/1">
												<div class="d-flex">
													<div>
														<h5 class="mb-2">고령화시대 '실버타운' 알아보는 노인들,입주시 기본 체크사항은?</h5>

													</div>
												</div> <img src="https://cdn.kgrow.co.kr/news/photo/202301/822433_4266_1149.jpg"
												class="custom-block-image img-fluid" onerror="this.src='/images/main.jpg'">
											</a>
										</div>
									</div>

									<div class="col-lg-4 col-md-6 col-12 mb-lg-3">
										<div class="custom-block bg-white shadow-lg">
											<a href="/info/info/1">
												<div class="d-flex">
													<div>
														<h5 class="mb-2">나를 위한 맞춤공간 '실버타운' 인기...민간ㆍ공공 건설 붐</h5>

													</div>
												</div> <img src="https://cdn.emozak.co.kr/news/photo/202204/5156_11954_1957.jpg"
												class="custom-block-image img-fluid" onerror="this.src='/images/main.jpg'">
											</a>
										</div>
									</div>
								</div>
							</div>
							<!-- 금융 탭 -->
							<div class="tab-pane fade" id="marketing-tab-pane"
								role="tabpanel" aria-labelledby="marketing-tab" tabindex="0">
								<div class="row">
									<div class="col-lg-4 col-md-6 col-12 mb-4 mb-lg-3">
										<div class="custom-block bg-white shadow-lg">
											<a href="/info/info/1">
												<div class="d-flex">
													<div>
														<h5 class="mb-2">은퇴 앞두고 있다면 부채관리는 이렇게!</h5>

													</div>
												</div> <img src="https://image.ajunews.com/content/image/2021/03/03/20210303074620389150.jpg"
												class="custom-block-image img-fluid" onerror="this.src='/images/main.jpg'">
											</a>
										</div>
									</div>

									<div class="col-lg-4 col-md-6 col-12 mb-4 mb-lg-3">
										<div class="custom-block bg-white shadow-lg">
											<a href="/info/info/1">
												<div class="d-flex">
													<div>
														<h5 class="mb-2">“자식이니까 신고못해” 노인 파산 이끄는 ‘금융착취’</h5>

													</div>
												</div> <img src="https://img.etoday.co.kr/pto_db/2023/09/600/20230901173705_1922942_1200_877.jpg"
												class="custom-block-image img-fluid" onerror="this.src='/images/main.jpg'">
											</a>
										</div>
									</div>

									<div class="col-lg-4 col-md-6 col-12 mb-lg-3">
										<div class="custom-block bg-white shadow-lg">
											<a href="/info/info/1">
												<div class="d-flex">
													<div>
														<h5 class="mb-2">[시니어를 잡아라]가속화되는 디지털 금융 속 시니어 잡기 ‘열풍’</h5>

													</div>
												</div> <img src="https://image.dnews.co.kr/photo/photo/2023/02/09/202302091043299290642-2-349594.JPG"
												class="custom-block-image img-fluid" onerror="this.src='/images/main.jpg'">
											</a>
										</div>
									</div>
								</div>
							</div>
							<!-- 정보 탭 -->
							<div class="tab-pane fade" id="finance-tab-pane"
								role="tabpanel" aria-labelledby="marketing-tab" tabindex="0">
								<div class="row">
									<div class="col-lg-4 col-md-6 col-12 mb-4 mb-lg-3">
										<div class="custom-block bg-white shadow-lg">
											<a href="/info/info/1">
												<div class="d-flex">
													<div>
														<h5 class="mb-2">고령화 시대 노인 건강…만성질환 늘고 노쇠 줄어</h5>

													</div>
												</div> <img src="https://cdn.docdocdoc.co.kr/news/photo/202308/3008308_3009394_5856.jpg"
												class="custom-block-image img-fluid" onerror="this.src='/images/main.jpg'">
											</a>
										</div>
									</div>

									<div class="col-lg-4 col-md-6 col-12 mb-4 mb-lg-3">
										<div class="custom-block bg-white shadow-lg">
											<a href="/info/info/3">
												<div class="d-flex">
													<div>
														<h5 class="mb-2">"노인 디지털 건강관리 프로그램 확대 위해 다양한 정책 필요"</h5>

													</div>

												</div> <img src="http://www.newsmp.com/news/photo/202308/235622_251184_5051.jpg" 
													class="custom-block-image img-fluid" onerror="this.src='/images/main.jpg'">
											</a>
										</div>
									</div>

									<div class="col-lg-4 col-md-6 col-12 mb-lg-3">
										<div class="custom-block bg-white shadow-lg">
											<a href="/info/info/8">
												<div class="d-flex">
													<div>
														<h5 class="mb-2">2025년부터 보험료율 0.6%p씩 올려야…연금개혁 밑그림 공개</h5>

													</div>
												</div> <img src="https://file2.nocutnews.co.kr/newsroom/image/2023/01/30/202301301111156406_0.jpg"
												class="custom-block-image img-fluid" onerror="this.src='/images/main.jpg'">
											</a>
										</div>
									</div>
								</div>
							</div>
							


						</div>
					</div>

				</div>
			</div>
		</section>
		
		<!-- 금융 -->
		<section class="main-product" style="background-color: #ffe157;">
			<div class="conTain">
				<!-- 수평 유지해주는듯 -->
				<div class="fininside">
					<div class="tit-area">
						<h1 style="margin-bottom: -4.5rem !important; color: black; font-size: 30pt;">상품</h1>

					</div>

				</div>


				<div class="container-fluid">
					<div class="row">
						<ul class="nav nav-tabs" id="myTab" role="tablist" style="border-bottom: none;">
							<li class="nav-item" role="presentation">
								<button class="nav-link active" id="design-tab"
									data-bs-toggle="tab" data-bs-target="#dd-tab-pane"
									type="button" role="tab" aria-controls="dd-tab-pane"
									aria-selected="true" style="background-color: #ffe157;" >예금</button>
							</li>

							<li class="nav-item" role="presentation">
								<button class="nav-link" id="marketing-tab" data-bs-toggle="tab"
									data-bs-target="#cc-tab-pane" type="button" role="tab"
									aria-controls="cc-tab-pane" aria-selected="false">적금</button>
							</li>

							<li class="nav-item" role="presentation">
								<button class="nav-link" id="music-tab" data-bs-toggle="tab"
									data-bs-target="#music-tab-pane" type="button" role="tab"
									aria-controls="music-tab-pane" aria-selected="false">채권</button>
							</li>
						</ul>
					</div>
				</div>

				<div class="container" >
					<div class="row">

						<div class="col-12">
							<div class="tab-content" id="myTabContent">

								<!-- 예금 탭 -->
								<div class="tab-pane fade show active" id="dd-tab-pane"
									role="tabpanel" aria-labelledby="music-tab-pane" tabindex="0" style="background-color: #ffe157;">
									<div class="row">
										<div class="col-lg-6 col-md-6 col-12 mb-4 mb-lg-3">
											<div class="">
													<div class="d-flex">
														<div>
															<img src="/images/hal1.png" alt="">
														</div>
														<div class="col-2">
														</div>
														<div class="col-12" style="background-color: #ffe157;">
															<div class="mt-5">
																<h2 class="md-3">KB Star 정기예금</h2>
															</div>
																<div style="font-size: 20pt;" class="mt-5">
																	목돈 불리는 예금, 만기되면
																</div>
																<div style="font-size: 20pt;" class="mt-3 mb-3">
																	자동으로 재예치!
																</div>
																<div id="vv">
																
																
																<a href="<c:url value="/finance/deposit/2"/>"
						                         class="btn custom-btn mt-5 mt-lg-4 pt-2.5" style="background-color:#555555; margin-right: 50px; text-color:#ffe157;">자세히 보기</a>
															<a href="<c:url value="/finance/saving/${saving.savingNo}"/>"
						                         class="btn custom-btn mt-5 mt-lg-4" style="background-color:#ffe157; border-width: medium; color: #555555; border-color: #555555;">전체 상품 보기</a>
															
															
															</div>
														</div>	
													</div> 
											</div>
										</div>


									</div>
								</div>
								
								
								<!-- 적금 탭 -->
								<div class="tab-pane fade" id="cc-tab-pane"
									role="tabpanel" aria-labelledby="music-tab-pane" tabindex="0">
									<div class="row">
										<div class="col-lg-4 col-md-6 col-12 mb-4 mb-lg-3">
											<div class="custom-block bg-white shadow-lg">
												<a href="/info/info/1">
													<div class="d-flex">
														<div>
															<h5 class="mb-2">은퇴 앞두고 있다면 부채관리는 이렇게!</h5>
														</div>
													</div> <img
													src="https://image.ajunews.com/content/image/2021/03/03/20210303074620389150.jpg"
													class="custom-block-image img-fluid"
													onerror="this.src='/images/main.jpg'">
												</a>
											</div>
										</div>

									</div>
								</div>
								<!-- 채권 탭 -->
								<div class="tab-pane fade" id="music-tab-pane" role="tabpanel"
									aria-labelledby="music-tab" tabindex="0">
									<div class="row">
										<div class="col-lg-4 col-md-6 col-12 mb-4 mb-lg-3">
											<div class="custom-block bg-white shadow-lg">
												<a href="/info/info/1">
													<div class="d-flex">
														<div>
															<h5 class="mb-2">고령화 시대 노인 건강…만성질환 늘고 노쇠 줄어</h5>
														</div>
													</div> <img
													src="https://cdn.docdocdoc.co.kr/news/photo/202308/3008308_3009394_5856.jpg"
													class="custom-block-image img-fluid"
													onerror="this.src='/images/main.jpg'">
												</a>
											</div>
										</div>
									</div>
								</div>


							</div>
						</div>

					</div>
				</div>


			</div>
			<!-- 이 안에 다 -->





		</section>

		<section class="faq-section section-padding" id="section_4">
			<div class="container">
				<div class="row">

					<div class="col-lg-6 col-12">
						<h2 class="mb-4">자주 묻는 질문</h2>
					</div>

					<div class="clearfix"></div>

					<div class="col-lg-5 col-12">
						<img src="images/faq_graphic.jpg" class="img-fluid" alt="FAQs">
					</div>

					<div class="col-lg-6 col-12 m-auto">
						<div class="accordion" id="accordionExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingOne">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseOne"
										aria-expanded="true" aria-controls="collapseOne">
										맞춤 서비스를 이용하려면 어떻게 해야하나요?</button>
								</h2>

								<div id="collapseOne" class="accordion-collapse collapse show"
									aria-labelledby="headingOne" data-bs-parent="#accordionExample">
									<div class="accordion-body">기본적으로, 회원 가입 후 오른쪽 상단 헤더의 유저
										아이콘을 클릭하여 자산기입을 해야합니다. 자산 기입 후, 실버타운 및 금융 상품탭의 맞춤 서비스를 이용하여
										고객님의 자산정보에 따른 상품을 추천받을 수 있습니다.</div>
								</div>
							</div>

							<div class="accordion-item">
								<h2 class="accordion-header" id="headingTwo">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">
										예상 입주 나이가 확실히 정해지지 않아도 괜찮나요?</button>
								</h2>

								<div id="collapseTwo" class="accordion-collapse collapse"
									aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
									<div class="accordion-body">예상 입주나이가 정확하지 않은 경우에도 충분히 추천
										서비스를 이용하실 수 있습니다. 하지만, 예상 입주나이가 정확할수록 추천을 했을 때 정확도 또한 올라갑니다.</div>
								</div>
							</div>

							<div class="accordion-item">
								<h2 class="accordion-header" id="headingThree">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree">
										더 많은 추천을 받고 싶은 경우, 어떻게 해야하나요?</button>
								</h2>

								<div id="collapseThree" class="accordion-collapse collapse"
									aria-labelledby="headingThree"
									data-bs-parent="#accordionExample">
									<div class="accordion-body">
										추천 서비스 이외에도 필터링 검색을 통하여 실버타운 및 금융상품에 대해 검색하여 원하는 정보를 얻으실 수 있습니다.
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</section>

		<!-- footer include -->
		<jsp:include page="/WEB-INF/jsp/common/custom_footer.jsp"/>
		
		<!-- JAVASCRIPT FILES -->
		<jsp:include page="/WEB-INF/jsp/settings/js.jsp"/>

	</main>
</body>
</html>
