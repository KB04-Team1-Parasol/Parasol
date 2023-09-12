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

		<!-- header include -->
		<jsp:include page="/WEB-INF/jsp/common/header2.jsp" />


		<!-- 메인 바디 -->

		<div 
			style="background-color: #F5E2BE; 
			 margin-bottom: 180px;  display: flex; justify-content: space-around;
			">
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

					<ul class="base_row">
						<li>
							<div class="row_item id ">
								<span class="info_item_text">${user.userId} </span>
							</div>
						</li>
						<li>
							<div class="row_item name">
								<span class="info_item_text">${user.userName } </span>
							</div>
						</li>
						<li>
							<div class="row_item age">
								<span class="info_item_text">${user.userAge } </span>
							</div>
						</li>


					</ul>

				</div>


				<div class="asset_box">
					<a href="/user/assetinput" class="title"
						onclick="nclk(this,'nid.myprofilego','','',event)"> <span
						class="asset_title_text">자산정보</span>

					</a>



					<ul class="base_row">

						<li>
							<div class="row_item phone ">
								<span class="item_text"> 금융자산 : ${userAsset.finAsset}</span>

							</div>
						</li>

						<li>
							<div class="row_item phone ">
								<span class="item_text"> 실물자산 : ${userAsset.realAsset}</span>

							</div>
						</li>

						<li>
							<div class="row_item phone ">
								<span class="item_text"> 현금 :
									${userAsset.pureAsset-userAsset.finAsset-userAsset.realAsset+userAsset.debt}</span>

							</div>
						</li>

						<li>
							<div class="row_item phone ">
								<span class="item_text"> 부채 : ${userAsset.debt}</span>

							</div>
						</li>
						<li>
							<div class="row_item phone ">
								<span class="item_text"> 월 소득 :
									${userAsset.monthlyIncome}</span>

							</div>
						</li>
						<li>
							<div class="row_item phone ">
								<span class="item_text"> 연금 : ${userAsset.annuity}</span>

							</div>
						</li>
						<li>
							<div class="row_item phone ">
								<span class="item_text"> 입주 예상 나이 : ${userAsset.hopeAge}</span>

							</div>
						</li>
						<li>
							<div class="row_item phone ">
								<span class="item_text"> 희망 거주 기간 :
									${userAsset.hopePeriod}</span>

							</div>
						</li>


					</ul>
				</div>
			</div>
		</div>

		<!-- footer include -->
		<jsp:include page="/WEB-INF/jsp/common/footer.jsp" />

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