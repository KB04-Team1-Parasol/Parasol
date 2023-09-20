<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>자산정보 조회</title>
<!-- CSS FILES -->
<jsp:include page="/WEB-INF/jsp/settings/css.jsp" />

<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@700&display=swap"
	rel="stylesheet">
<link href="/css/common.css" rel="stylesheet" />
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

						<h2 class="text-white">자산정보 조회</h4>
					</div>
				</div>
			</div>
		</header>



		<c:choose>
			<c:when test="${empty userAsset.finAsset}">
				<div
					class="custom-block-topics-listing-info d-flex text-center row ">
					<div style="margin-top: 50px; margin-bottom: 50px;"
						class="now_asset_text">앗 ! 등록된 자산 정보가 없어요</div>
					<div class="mx-auto ">
						<a href="/user/assetinput"> <img
							src="https://i.ibb.co/g45wnwk/loading.gif" alt="loading"
							border="0" width="250" height="250">
						</a>
					</div>
				</div>

			</c:when>
			<c:otherwise>

<!-- 버튼 -->
<!-- <button type="button" onclick="location.href='/user/assetinput'"
							class="btn btn-secondary m-2">수정</button>< -->
				<div class="container" style="padding-top: 100px">
					<div class="shadow-lg custom-block1">
						<!-- <a href="/user/assetinput" class="title"
						onclick="nclk(this,'nid.myprofilego','','',event)"></a> -->
<!-- 						<button type="button" onclick="location.href='/user/assetinput'"
							class="btn btn-secondary m-2">자산정보 수정</button> -->
						<div class="row">
							<h3 class="text-center mb-5">${user.userName}님의 자산정보</h3>
							<!-- 왼쪽 위에 myChart -->
							<div class="col-md-6" style="padding-left: 75px; padding-right:75px">
								<div class="text-center" style="padding-bottom: 40px; padding-left:30px">
									<h6>보유 자산 현황 <button type="button" onclick="location.href='/user/assetinput'"
							class="btn btn-secondary m-2">수정</button> </h6> 
							
								</div>
								<div style="margin-left:30px">
								<canvas id="myChart" style="height:380px; width:380px;" class="mb-5"></canvas>
								</div>
								<!-- 왼쪽 아래에 내 프로필 -->
								<div class="col-md-12"style="padding-top:55px">
									<div class="bg-light rounded h-100 p-4">
										<table class="table" >
											<tbody>
												<tr>
													<td>이름</td>
													<td>${user.userName}</td>
													<td></td>
												</tr>
												<tr>
													<td>나이</td>
													<td>${user.userAge} (세)</td>
													<td></td>
												</tr>
												<tr>

													<td>희망 입주 나이</td>
													<td>${userAsset.hopeAge} (세)</td>
													<td></td>
												</tr>
												<tr>

													<td>희망 거주 기간</td>
													<td>${userAsset.hopePeriod} (년)</td>
													<td></td>
												</tr>

											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- 오른쪽 위에 myChart2 -->
							<div class="col-md-6" style="padding-left: 75px; padding-right:75px; padding-top:10px">
								<div class="text-center">
									<h6>나의 자산 vs. 60대 평균 자산</h6>
								</div>
								<canvas id="myChart2" class="mb-5" ></canvas>
								<!-- 오른쪽 아래에 자산 비교 -->
								<div class="col-md-12" style="padding-top:40px">
									<div class="bg-light rounded h-100 p-4">
										<table class="table">
											<thead>
												<tr>
													<th scope="col" style="font-size: 14px;">단위 : (만원)</th>
													<th scope="col">나의 자산</th>
													<th scope="col">60대 평균 자산</th>

												</tr>
											</thead>
											<tbody>
												<tr>

													<td>금융자산</td>
													<td><fmt:formatNumber value="${userAsset.finAsset}"
															type="number" pattern="#,##0" /></td>
													<td>28,000</td>
												</tr>
												<tr>

													<td>실물자산</td>
													<td><fmt:formatNumber value="${userAsset.realAsset}"
															type="number" pattern="#,##0" /></td>
													<td>22,000</td>
												</tr>
												<tr>

													<td>현금</td>
													<td><fmt:formatNumber
															value="${userAsset.pureAsset - userAsset.finAsset - userAsset.realAsset + userAsset.debt}"
															type="number" pattern="#,##0" /></td>
													<td>14,000</td>
												</tr>
												<tr>

													<td>부채</td>
													<td><fmt:formatNumber value="${userAsset.debt}"
															type="number" pattern="#,##0" /></td>
													<td>4,560</td>
												</tr>
												<tr>

													<td>월 소득</td>
													<td><fmt:formatNumber
															value="${userAsset.monthlyIncome}" type="number"
															pattern="#,##0" /></td>
													<td>1,150</td>
												</tr>

											</tbody>
										</table>
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="row" style="padding-bottom: 100px; padding-top: 100px">
					</div>
				</div>
				<script>
					// EL을 사용하여 JSP 페이지에서 데이터를 JavaScript 변수로 초기화

					var pureAsset = "${userAsset.pureAsset}";
					var finAsset = "${userAsset.finAsset}";
					var realAsset = "${userAsset.realAsset}";
					var debt = "${userAsset.debt}";
					var monthlyIncome = "${userAsset.monthlyIncome}";
					var annuity = "${userAsset.annuity}";

					// 60대 자산 평균 (비율 맞추기 위해 값 수정)
					var averageFinAsset = 28000;
					var averageRealAsset = 22000;
					var averageCash = 14000;
					var averageDebt = 12000;
					var averageMonthlySum = 11100;
				</script>
			</c:otherwise>
		</c:choose>



		<c:choose>
			<c:when test="${empty userAsset.finAsset}">
				<div class="custom-block-topics-listing-info d-flex">
					<div>
						<h5 class="mb-2">맞춤 서비스를 이용하시려면 자산 정보를 기입 해주세요.</h5>
					</div>
				</div>
			</c:when>
			<c:otherwise>




			</c:otherwise>
		</c:choose>



		<!-- footer include -->
		<jsp:include page="/WEB-INF/jsp/common/custom_footer.jsp" />




		<!-- JAVASCRIPT FILES -->

		<jsp:include page="/WEB-INF/jsp/settings/js.jsp" />


		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
		<script src="/js/asset_info_chart.js"></script>

	</main>
</body>
</html>


