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
<jsp:include page="/WEB-INF/jsp/settings/css.jsp" />

<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@700&display=swap"
	rel="stylesheet">

</head>
<body id="top">
	<main>

		<!-- header include -->
		<jsp:include page="/WEB-INF/jsp/common/header2.jsp" />


		<!-- 메인 바디 -->
		
		<section class="section-padding section-bg"></section>
		<div
			style="margin-bottom: 200px; display: flex; justify-content: space-around;">
			<div class="profile_inner" style="margin-left: 120px;">
				<div
					style="display: flex; align-items: center; margin-bottom: 20px;">


				</div>

				<c:choose>
					<c:when test="${empty userAsset.finAsset}">
						<div class="custom-block-topics-listing-info d-flex text-center">
							<div style="margin-top: 50px;" class="now_asset_text">앗 !
								등록된 자산 정보가 없어요</div>
							<div class="mx-auto">
								<a href="/user/assetinput"> <img
									src="https://i.ibb.co/g45wnwk/loading.gif" alt="loading"
									border="0" width="200" height="200">
								</a>
							</div>
						</div>

					</c:when>
					<c:otherwise>
						<div class="d-flex align-items-center">
							<img src="https://i.ibb.co/Dk3WMhc/img-char01.png"
								alt="img-char01" border="0" width="180" height="120">
							<div class="now_asset_text" style="margin-left: 10px;">보유
								자산 현황</div>
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
					</c:otherwise>
				</c:choose>
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


				<div class="asset_box" style="width: 600px; margin-right: 150px;">
					<a href="/user/assetinput" class="title"
						onclick="nclk(this,'nid.myprofilego','','',event)"> <span
						class="asset_title_text">자산정보</span>

					</a>
					<!--  신규 회원 가입 시 자산 정보 미기입 상태 -->


					<c:choose>
						<c:when test="${empty userAsset.finAsset}">
							<div class="custom-block-topics-listing-info d-flex">
								<div>
									<h5 class="mb-2">맞춤 서비스를 이용하시려면 자산 정보를 기입 해주세요.</h5>


								</div>
							</div>
						</c:when>
						<c:otherwise>

							<!-- 이미지 및 기타 정보 출력 -->
							<div class="custom-block-topics-listing-info d-flex">
								<div>
									<h5 class="mb-2">금융자산 : ${userAsset.finAsset} (만원)</h5>
									<h5 class="mb-2">실물자산 : ${userAsset.realAsset} (만원)</h5>
									<h5 class="mb-2">현금 : ${userAsset.pureAsset - userAsset.realAsset - userAsset.finAsset + userAsset.debt} (만원)</h5>
									<h5 class="mb-2">부채 : ${userAsset.debt} (만원)</h5>
									<h5 class="mb-2">월 소득 : ${userAsset.monthlyIncome} (만원)</h5>
									<h5 class="mb-2">연금 : ${userAsset.annuity} (만원) </h5>
									<h5 class="mb-2">예상 입주 나이 : ${userAsset.hopeAge} (만원) </h5>
									<h5 class="mb-2">희망 거주 기간 : ${userAsset.hopePeriod} (년)</h5>

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