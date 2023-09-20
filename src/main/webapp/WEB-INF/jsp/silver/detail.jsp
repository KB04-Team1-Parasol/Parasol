<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실버타운 상세보기</title>
<!-- css setting -->
<link href="/css/silver/detail.css" rel="stylesheet" />
<jsp:include page="/WEB-INF/jsp/settings/css.jsp" />
<link href="/css/finance/custom-fin.css" rel="stylesheet">

<script
  defer
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAXBhJXpX0BRIfdw0YxPveD1EoCn31ISzI&callback=initMap"
></script>
<script>
	window.initMap = function () {
	   var faddr = `${ dto.address }`;
	   var geocoder;
	   geocoder = new google.maps.Geocoder();
	   faddr_lat = "";
	   faddr_lng = "";
	   geocoder.geocode( { 'address': faddr}, function(results, status) {
	     if (status == google.maps.GeocoderStatus.OK) {
	        faddr_lat = results[0].geometry.location.lat();   //위도
	        faddr_lng = results[0].geometry.location.lng();   //경도
	     }
	      
	     const map = new google.maps.Map(document.getElementById("map"), {
	       center: { lat: faddr_lat, lng: faddr_lng },
	       zoom: 13
	     });
	   
	     const malls = [
	       { label: ' ', name: faddr, lat: faddr_lat, lng: faddr_lng },
	     ];
	     
	     const bounds = new google.maps.LatLngBounds();
	     const infoWindow = new google.maps.InfoWindow();
	   
	     malls.forEach(({ label, name, lat, lng }) => {
	       const marker = new google.maps.Marker({
	         position: { lat, lng },
	         label,
	         map
	       });
	       bounds.extend(marker.position);
	   
	       marker.addListener("click", () => {
	         map.panTo(marker.position);
	         infoWindow.setContent(name);
	         infoWindow.open({
	           anchor: marker,
	           map
	         });
	       });
	     });
	     
	   
	     bounds.extend(marker.position);
	   
	     map.fitBounds(bounds);
	   });
	};
</script>
</head>
<body id="top">
	<main>

		<!-- header include -->
		<jsp:include page="/WEB-INF/jsp/common/header2.jsp" />

		<!-- Header-->
		<header class="header_silver">
			<div class="container px-5">
				<div class="row gx-5 align-items-center justify-content-center">
					<div class="col-lg-8 col-xl-7 col-xxl-6">
						<div class="my-5 text-center text-xl-start">
							<h1 class="display-5 fw-bolder">${ dto.stName }</h1>
							<h3 class="display-7 mb-5">${ dto.stdRoomType }</h3>
							<p class="lead fw-normal mb-2">
								<span class="fw-bolder">주소</span> ${ dto.address }
							</p>
							<p class="lead fw-normal mb-2">
								<span class="fw-bolder">보증금</span> ${ dto.stdDeposit }원
							</p>
							<p class="lead fw-normal mb-4">
								<span class="fw-bolder">월세</span> ${ dto.stdMonthlyCost }원
							</p>
							<div
								class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
								<a class="btn btn-warning btn-lg px-4 me-sm-3"
									href="${ dto.stUrl }" target="_blank">홈페이지 이동</a>
							</div>
						</div>
					</div>
					<div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
						<img class="img-fluid rounded-3 my-5" src="${ dto.stImgUrl }"
							alt="..." />
					</div>
				</div>
			</div>
		</header>
		<hr class="mt-0">

		<!-- Page Content-->
		<section class="pt-5">
			<div class="row gx-5 justify-content-center mb-5">
				<div class="col-lg-8 col-xl-6">
					<div class="text-center">
						<h2 class="fw-bolder">상세 정보</h2>
					</div>
				</div>
			</div>

			<div class="container px-lg-5">
				<!-- Page Features-->
				<div class="row gx-lg-5">
					<div class="col-lg-6 col-xxl-4 mb-5">
						<div class="card bg-light border-0 h-100">
							<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
								<div
									class="feature bg-warning bg-gradient text-white rounded-3 mb-4 mt-n4">
									<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
										fill="currentColor" class="bi bi-info-circle"
										viewBox="0 0 16 16">
									  <path
											d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
									  <path
											d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
									</svg>
								</div>
								<h2 class="fs-4 fw-bold">유형</h2>
								<p class="mb-0">${ dto.stType }</p>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-xxl-4 mb-5">
						<div class="card bg-light border-0 h-100">
							<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
								<div
									class="feature bg-warning bg-gradient text-white rounded-3 mb-4 mt-n4">
									<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
										fill="currentColor" class="bi bi-building" viewBox="0 0 16 16">
									  <path
											d="M4 2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1Zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1Zm3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1ZM4 5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1ZM7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1Zm2.5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1ZM4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1Zm2.5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1Zm3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1Z" />
									  <path
											d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V1Zm11 0H3v14h3v-2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5V15h3V1Z" />
									</svg>
								</div>
								<h2 class="fs-4 fw-bold">규모</h2>
								<p class="mb-0">${ dto.stScale }</p>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-xxl-4 mb-5">
						<div class="card bg-light border-0 h-100">
							<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
								<div
									class="feature bg-warning bg-gradient text-white rounded-3 mb-4 mt-n4">
									<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
										fill="currentColor" class="bi bi-calendar-week"
										viewBox="0 0 16 16">
									  <path
											d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-5 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z" />
									  <path
											d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
									</svg>
								</div>
								<h2 class="fs-4 fw-bold">계약 기간</h2>
								<p class="mb-0">${ dto.stPeriod }년</p>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-xxl-4 mb-5">
						<div class="card bg-light border-0 h-100">
							<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
								<div
									class="feature bg-warning bg-gradient text-white rounded-3 mb-4 mt-n4">
									<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
										fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  										<path
											d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z" />
									</svg>
								</div>
								<h2 class="fs-4 fw-bold">세대 수</h2>
								<p class="mb-0">${ dto.stdOccupancy }인</p>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-xxl-4 mb-5">
						<div class="card bg-light border-0 h-100">
							<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
								<div
									class="feature bg-warning bg-gradient text-white rounded-3 mb-4 mt-n4">
									<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
										fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
  										<path
											d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5ZM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5 5 5Z" />
									</svg>
								</div>
								<h2 class="fs-4 fw-bold">평수</h2>
								<p class="mb-0">${ dto.stdRoomSize }평</p>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-xxl-4 mb-5">
						<div class="card bg-light border-0 h-100">
							<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
								<div
									class="feature bg-warning bg-gradient text-white rounded-3 mb-4 mt-n4">
									<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
										fill="currentColor" class="bi bi-cup-hot" viewBox="0 0 16 16">
									  <path fill-rule="evenodd"
											d="M.5 6a.5.5 0 0 0-.488.608l1.652 7.434A2.5 2.5 0 0 0 4.104 16h5.792a2.5 2.5 0 0 0 2.44-1.958l.131-.59a3 3 0 0 0 1.3-5.854l.221-.99A.5.5 0 0 0 13.5 6H.5ZM13 12.5a2.01 2.01 0 0 1-.316-.025l.867-3.898A2.001 2.001 0 0 1 13 12.5ZM2.64 13.825 1.123 7h11.754l-1.517 6.825A1.5 1.5 0 0 1 9.896 15H4.104a1.5 1.5 0 0 1-1.464-1.175Z" />
									  <path
											d="m4.4.8-.003.004-.014.019a4.167 4.167 0 0 0-.204.31 2.327 2.327 0 0 0-.141.267c-.026.06-.034.092-.037.103v.004a.593.593 0 0 0 .091.248c.075.133.178.272.308.445l.01.012c.118.158.26.347.37.543.112.2.22.455.22.745 0 .188-.065.368-.119.494a3.31 3.31 0 0 1-.202.388 5.444 5.444 0 0 1-.253.382l-.018.025-.005.008-.002.002A.5.5 0 0 1 3.6 4.2l.003-.004.014-.019a4.149 4.149 0 0 0 .204-.31 2.06 2.06 0 0 0 .141-.267c.026-.06.034-.092.037-.103a.593.593 0 0 0-.09-.252A4.334 4.334 0 0 0 3.6 2.8l-.01-.012a5.099 5.099 0 0 1-.37-.543A1.53 1.53 0 0 1 3 1.5c0-.188.065-.368.119-.494.059-.138.134-.274.202-.388a5.446 5.446 0 0 1 .253-.382l.025-.035A.5.5 0 0 1 4.4.8Zm3 0-.003.004-.014.019a4.167 4.167 0 0 0-.204.31 2.327 2.327 0 0 0-.141.267c-.026.06-.034.092-.037.103v.004a.593.593 0 0 0 .091.248c.075.133.178.272.308.445l.01.012c.118.158.26.347.37.543.112.2.22.455.22.745 0 .188-.065.368-.119.494a3.31 3.31 0 0 1-.202.388 5.444 5.444 0 0 1-.253.382l-.018.025-.005.008-.002.002A.5.5 0 0 1 6.6 4.2l.003-.004.014-.019a4.149 4.149 0 0 0 .204-.31 2.06 2.06 0 0 0 .141-.267c.026-.06.034-.092.037-.103a.593.593 0 0 0-.09-.252A4.334 4.334 0 0 0 6.6 2.8l-.01-.012a5.099 5.099 0 0 1-.37-.543A1.53 1.53 0 0 1 6 1.5c0-.188.065-.368.119-.494.059-.138.134-.274.202-.388a5.446 5.446 0 0 1 .253-.382l.025-.035A.5.5 0 0 1 7.4.8Zm3 0-.003.004-.014.019a4.077 4.077 0 0 0-.204.31 2.337 2.337 0 0 0-.141.267c-.026.06-.034.092-.037.103v.004a.593.593 0 0 0 .091.248c.075.133.178.272.308.445l.01.012c.118.158.26.347.37.543.112.2.22.455.22.745 0 .188-.065.368-.119.494a3.198 3.198 0 0 1-.202.388 5.385 5.385 0 0 1-.252.382l-.019.025-.005.008-.002.002A.5.5 0 0 1 9.6 4.2l.003-.004.014-.019a4.149 4.149 0 0 0 .204-.31 2.06 2.06 0 0 0 .141-.267c.026-.06.034-.092.037-.103a.593.593 0 0 0-.09-.252A4.334 4.334 0 0 0 9.6 2.8l-.01-.012a5.099 5.099 0 0 1-.37-.543A1.53 1.53 0 0 1 9 1.5c0-.188.065-.368.119-.494.059-.138.134-.274.202-.388a5.446 5.446 0 0 1 .253-.382l.025-.035A.5.5 0 0 1 10.4.8Z" />
									</svg>
								</div>
								<h2 class="fs-4 fw-bold">부대 시설</h2>
								<p class="mb-0">${ dto.stFacility }</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<hr>
		
		<c:if test="${ dto.isCustom() }">
		<!-- Features section-->
		<section class="py-5" id="features">
			<div class="row gx-5 justify-content-center mb-5">
				<div class="col-lg-8 col-xl-6">
					<div class="text-center">
						<h2 class="fw-bolder">맞춤 금융상품</h2>
					</div>
				</div>
			</div>
			<div class="container px-5 my-5">
				<c:if test="${ dto.depositList.size() > 0 }">
				<div class="row gx-5 mb-5">
					<div class="col-lg-2 mb-5 mb-lg-0 mt-3">
						<h3 class="fw-bolder mb-0">예금</h3>
					</div>
					<div class="col-lg-8">
						<c:forEach var="deposit" items="${dto.depositList}">
							<div
								class="custom-block custom-block-topics-listing bg-white shadow-lg mb-5">
								<div class="d-flex justify-content-between">
									<!-- 이미지 및 기타 정보 출력 -->
									<div class="custom-block-topics-listing-info d-flex">
										<div>
											<h5 class="mb-2">${deposit.depositName}</h5>
											<p class="mb-0">최대 기간: ${deposit.depositPeriod}개월</p>
											<p class="mb-0">만기 이자율: ${deposit.depositRate}%</p>
											<a
												href="<c:url value="/finance/deposit/${deposit.depositNo}" />"
												class="btn custom-btn mt-3 mt-lg-4">자세히 보기</a>
										</div>
									</div>
									
									<div class="d-flex col-5 justify-content-end">
										<c:set var="kbcha" value="${deposit.depositNo % 7 + 1}" />
										<img src="/images/fr${kbcha}.png" alt="">
									</div>
									
									
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				</c:if>

				<c:if test="${ dto.savingList.size() > 0 }">
				<div class="row gx-5 mb-5">
					<div class="col-lg-2 mb-5 mb-lg-0 mt-3">
						<h3 class="fw-bolder mb-0">적금</h3>
					</div>
					<div class="col-lg-8">
						<c:forEach var="saving" items="${dto.savingList}">
							<div class="custom-block custom-block-topics-listing bg-white shadow-lg mb-5">
					            <div class="d-flex justify-content-between">
					                <!-- 이미지 및 기타 정보 출력 -->
					                <div class="custom-block-topics-listing-info d-flex">
					                    <div>
					                        <h5 class="mb-2"> ${saving.savingName}</h5>
					                        <p class="mb-0">최대 기간: ${saving.savingPeriod}개월</p>
					                        <p class="mb-0">이율 : ${saving.savingRate}%</p>
					                        <a href="<c:url value="/finance/saving/${saving.savingNo}"/>"
					                         class="btn custom-btn mt-3 mt-lg-4">자세히 보기</a>
					                    </div>
					                </div>
					                
					                <div class="d-flex col-5 justify-content-end">
										<c:set var="kbcha" value="${saving.savingNo % 7 + 1}" />
										<img src="/images/fr${kbcha}.png" alt="">
									</div>
					            </div>
					        </div>
						</c:forEach>
					</div>
				</div>
				</c:if>

				<c:if test="${ dto.bondList.size() > 0 }">
				<div class="row gx-5 mb-5">
					<div class="col-lg-2 mb-5 mb-lg-0 mt-3">
						<h3 class="fw-bolder mb-0">채권</h3>
					</div>
					<div class="col-lg-8">
						<c:forEach var="bond" items="${dto.bondList}">
							<div
								class="custom-block custom-block-topics-listing bg-white shadow-lg mb-5">
								<div class="d-flex justify-content-between">
									<!-- 이미지 및 기타 정보 출력 -->
									<div class="custom-block-topics-listing-info d-flex">
										<div>
											<div id="vv"
												class="col-lg-12 col-8 mb-3 justify-content-start">
												<c:choose>
													<c:when test="${bond.bondRisk == 1}">
														<div id="bg-1design" class="bondbadge rounded-pill">초저위험</div>
													</c:when>
													<c:when test="${bond.bondRisk == 2}">
														<div id="bg-2design"
															class="bondbadge ml-3 mr-3  rounded-pill">저위험</div>
													</c:when>
													<c:when test="${bond.bondRisk == 3}">
														<div id="bg-3design" class="bondbadge rounded-pill">중위험</div>
													</c:when>
													<c:when test="${bond.bondRisk == 4}">
														<div id="bg-4design" class="bondbadge rounded-pill">고위험</div>
													</c:when>
													<c:when test="${bond.bondRisk == 5}">
														<div id="bg-5design" class="bondbadge rounded-pill">초고위험</div>
													</c:when>
													<c:otherwise>알 수 없는 위험</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when
														test="${bond.bondCredit == 'A+' || bond.bondCredit == 'A-' || bond.bondCredit == 'A0'}">
														<div id="bg-5design" class="bondbadge rounded-pill">${bond.bondCredit}</div>
													</c:when>
													<c:when
														test="${bond.bondCredit == 'AA0' || bond.bondCredit == 'AA+' || bond.bondCredit == 'AA-'}">
														<div id="bg-3design" class="bondbadge rounded-pill">${bond.bondCredit}</div>
													</c:when>
													<c:when test="${bond.bondCredit == 'AAA'}">
														<div id="bg-1design" class="bondbadge rounded-pill">${bond.bondCredit}</div>
													</c:when>
													<c:otherwise>
														<div class="bondbadge rounded-pill">알 수 없는 등급</div>
													</c:otherwise>
												</c:choose>

											</div>
											<h5 class="mb-2">${bond.bondName}</h5>
											<p class="mb-0">만기일 : ${bond.bondDate}</p>
											<p class="mb-0">
												3년 수익률 : <span style="color: red; font-weight: bold; ">${bond.bondRate}%</span>
											</p>
											<a href="<c:url value="/finance/bond/${bond.bondNo}" />"
												class="btn custom-btn mt-3 mt-lg-4">자세히 보기</a>
										</div>
									</div>
									<div class="d-flex col-5 justify-content-end">
										<c:set var="kbcha" value="${bond.bondNo % 7 + 1}" />
										<img src="/images/fr${kbcha}.png" alt="">
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				</c:if>
			</div>
		</section>
		</c:if>
		
		<section class="pt-5">
			<div class="row gx-5 justify-content-center mb-5">
				<div class="col-lg-8 col-xl-6">
					<div class="text-center">
						<h2 class="fw-bolder">상세 위치</h2>
					</div>
				</div>
			</div>
			
			<div class="text-center">
				<div id="map"></div>
			</div>
		</section>

		<!-- footer include -->
		<jsp:include page="/WEB-INF/jsp/common/custom_footer.jsp" />

		<!-- JAVASCRIPT FILES -->
		<jsp:include page="/WEB-INF/jsp/settings/js.jsp" />
		<script>
			var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
			var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
			  return new bootstrap.Tooltip(tooltipTriggerEl)
			})
		</script>

	</main>
</body>
</html>