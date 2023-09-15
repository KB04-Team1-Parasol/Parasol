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

<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@700&display=swap"
	rel="stylesheet">

</head>
<body id="top">
	<main>

		<!-- header include -->
		<jsp:include page="/WEB-INF/jsp/common/header2.jsp" />


		<!-- 메인 바디 -->
		<section class="section-padding"></section>
		<div
			style="margin-bottom: 180px; display: flex; justify-content: space-around;">
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


					<div class="d-flex justify-content-between">
						<!-- 이미지 및 기타 정보 출력 -->
						<div class="custom-block-topics-listing-info d-flex">
							<div>
								<h5 class="mb-2">아이디 : ${user.userId}</h5>
								<h5 class="mb-2">이름 : ${user.userName}</h5>
								<h5 class="mb-2">나이 : ${user.userAge}</h5>

							</div>
						</div>



					</div>

				</div>


				<div class="asset_box">
					<a href="/user/assetinput" class="title"
						onclick="nclk(this,'nid.myprofilego','','',event)"> <span
						class="asset_title_text">자산정보</span>

					</a>
					<!--  신규 회원 가입 시 자산 정보 미기입 상태 -->


					<c:choose>
						<c:when test="${empty userAsset.finAsset}">
							<span class="item_text">맞춤 서비스를 이용하시려면 자산 정보를 기입해주세요.</span>
						</c:when>
						<c:otherwise>

							<!-- 이미지 및 기타 정보 출력 -->
							<div class="custom-block-topics-listing-info d-flex">
								<div>
									<h5 class="mb-2">금융자산 : ${userAsset.finAsset}</h5>
									<h5 class="mb-2">실물자산 : ${userAsset.realAsset}</h5>
									<h5 class="mb-2">현금 : ${userAsset.pureAsset - userAsset.realAsset - userAsset.finAsset + userAsset.debt}</h5>
									<h5 class="mb-2">부채 : ${userAsset.debt}</h5>
									<h5 class="mb-2">월 소득 : ${userAsset.monthlyIncome}</h5>
									<h5 class="mb-2">입주 예상 나이 : ${userAsset.annuity}</h5>
									<h5 class="mb-2">희망 거주 기간 : ${userAsset.hopeAge}</h5>

								</div>
							</div>




						</c:otherwise>
					</c:choose>
				</div>
			</div>


		</div>

		<!-- footer include -->
		<jsp:include page="/WEB-INF/jsp/common/custom_footer.jsp" />




		<!-- JAVASCRIPT FILES -->

		<jsp:include page="/WEB-INF/jsp/settings/js.jsp"/>
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
		<script src="/js/asset_info_chart.js"></script>
	</main>
</body>
</html>