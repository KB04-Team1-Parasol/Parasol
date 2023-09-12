<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>

<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="description" content="">
<meta name="author" content="">

<title>적금디테일</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function calculateSum() {
    var won = parseFloat(document.getElementById('won').value);
    var period = parseFloat(document.getElementById('period').value);
    var percent = parseFloat(document.getElementById('percent').value);
    var interest = won * period * (percent * (period + 1) / 24) / 100;
    var result = won + interest;
    document.getElementById('result').innerHTML = '이자: ' + '<b>'+ interest + '</b>' + '를 더해' + '<br>'+ '총: '+ '<b>' +result  +'</b>' + '을 모으실 수 있습니다.' ;

    // 폼의 기본 제출 동작을 방지합니다.
    return false;
}
</script>

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
<link href="/css/custom-fin.css" rel="stylesheet">

<!--

TemplateMo 590 topic listing

https://templatemo.com/tm-590-topic-listing

-->
</head>

<body class="topics-listing-page" id="top">
	<main>
		<header
			class="site-header d-flex flex-column justify-content-center align-items-center">
			<div class="container">
				<div class="row align-items-center">

					<div class="col-lg-5 col-12">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">Homepage</a></li>

								<li class="breadcrumb-item active" aria-current="page">Topics
									Listing</li>
							</ol>
						</nav>

						<h2 class="text-white">Topics Listing</h2>
					</div>

				</div>
			</div>
		</header>



		<section class="section-padding">
			<div class="container">
				<div class="row">

					<div class="col-lg-8 col-12 mt-3 mx-auto">
						<div
							class="custom-block custom-block-topics-listing bg-white shadow-lg mb-5">
							<div class="d-flex justify-content-center">

								<div class="custom-block-topics-listing-info d-flex">
									<div>
										<span class="badge bg-design rounded-pill">${bond.bondNo}</span>
										<br>
										<div class="detail-width">
											<h3 class="mb-1">${bond.bondName}</h3>
										</div>
										<hr>
										<br>
										<div class="row mb-4">
										
											<!-- 첫번째 -->
											<div class="col-lg-4 col-md-6 col-12 mb-4 mb-lg-0"
												style="height: 150px;">
												<div class="custom-block bg-white shadow-lg ddetail-width">
													<div class="mb-3">
														<span><img
															src="https://oimg1.kbstar.com/img/ocommon/2018/product/icon_info1.png"
															alt=""></span> <span> &nbsp;기간</span>
													</div>

													<div class="d-flex justify-content-end">
														<!-- 우측 정렬을 위해 justify-content-end 추가 -->

														<div>
															<h6 class="mb-2">${bond.bondPeriod}개월</h6>
														</div>
													</div>
												</div>
											</div>

											<!-- 두번째 -->
											<div class="col-lg-4 col-md-6 col-12 mb-4 mb-lg-0"
												style="height: 150px;">
												<div class="custom-block bg-white shadow-lg ddetail-width">
													<div class="mb-3">
														<span><img
															src="https://oimg1.kbstar.com/img/ocommon/2018/product/icon_info2.png"
															alt=""></span> <span> &nbsp;금액</span>
													</div>

													<div class="d-flex justify-content-end">
														<!-- 우측 정렬을 위해 justify-content-end 추가 -->

														<div>
															<h6 class="mb-2">${bond.bondMax}만원 이내</h6>
														</div>
													</div>
												</div>
											</div>

											<!-- 세번째 -->
											<div class="col-lg-4 col-md-6 col-12 mb-4 mb-lg-0"
												style="height: 150px;">
												<div class="custom-block bg-white shadow-lg ddetail-width">
													<div class="mb-3">
														<span><img
															src="https://oimg1.kbstar.com/img/ocommon/2018/product/icon_info3.png"
															alt=""></span> <span> &nbsp;최고</span>
													</div>

													<div class="d-flex justify-content-end">
														<!-- 우측 정렬을 위해 justify-content-end 추가 -->

														<div>
															<h6 class="mb-2">연 ${bond.savingRate} %</h6>
														</div>
													</div>
												</div>
											</div>


										</div>

										<div class="d-flex justify-content-center mb-3">
											<a href="${saving.savingLink}"
												class="btn custom-btn mt-3 mt-lg-4"> 상품 가입</a>
										</div>
										<div class="d-flex justify-content-end mb-2">
											<h9>※ 자세한 내용은 아래 상품안내를 참조하시기 바랍니다.</h9>
										</div>

										<hr>
										<h6>적금 계산기</h6>
										<div class="d-flex justify-content-center">
										<div class="col-lg-10 col-12">
											<form action="#" method="post"
												class="custom-form contact-form" role="form" onsubmit="return calculateSum();">
												<div class="row">
													<div class="col-lg-4 col-md-6 col-12">
														<div class="form-floating">
															<input type="number" name="name" id="won"
																class="form-control" placeholder="Name" required="">

															<label for="floatingInput">원씩</label>
														</div>
													</div>

													<div class="col-lg-4 col-md-6 col-12">
														<div class="form-floating">
															<input type="number" name="period" id="period"
																 class="form-control"
																placeholder="Name" required=""> <label
																for="floatingInput">개월 간</label>
														</div>
													</div>
													
													<div class="col-lg-4 col-md-6 col-12">
														<div class="form-floating">
															<input type="number" name="period" id="percent"
																 class="form-control"
																placeholder="Name" required=""> <label
																for="floatingInput">%의 적금 상품</label>
														</div>
													</div>
													<div class="col-lg-4 col-12 ms-auto d-flex justify-content-end mb-4">
														<button type="submit" class="form-control" id="calculate">에 가입한다면?</button>
													</div>
													<p><span id="result"></span></p>
												</div>
											</form>
										</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div
							class="custom-block custom-block-topics-listing bg-white shadow-lg mb-5 d-flex justify-content-center align-items-center">
							<img src="${saving.savingImg}" alt="">
						</div>

					</div>


				</div>
			</div>
		</section>


	</main>

	<!-- JAVASCRIPT FILES -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/custom.js"></script>

</body>

</html>