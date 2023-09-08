<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실버타운 상세보기</title>
<!-- css setting -->
<jsp:include page="/WEB-INF/jsp/settings/css.jsp"/>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/silver/detail.css" rel="stylesheet" />
</head>
<body id="top">
	<main>
	
		<!-- header include -->
		<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
		
		<!-- Header-->
        <header class="py-5 bg-yellow">
            <div class="container px-5">
                <div class="row gx-5 align-items-center justify-content-center">
                    <div class="col-lg-8 col-xl-7 col-xxl-6">
                        <div class="my-5 text-center text-xl-start">
                            <h1 class="display-5 fw-bolder">${ dto.getStName() }</h1>
                            <h2 class="display-7 mb-5">${ dto.getStdRoomType() }</h2>
                            <p class="lead fw-normal mb-2"><span class="fw-bolder">주소</span> ${ dto.getAddress() }</p>
                            <p class="lead fw-normal mb-2"><span class="fw-bolder">보증금</span> ${ dto.getStdDeposit()*10000 }원</p>
                            <p class="lead fw-normal mb-4"><span class="fw-bolder">월세</span> ${ dto.getStdMonthlyCost()*10000 }원</p>
		                    <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
		                        <a class="btn btn-primary btn-lg px-4 me-sm-3" href="${ dto.getStUrl() }" target="_blank">홈페이지 이동</a>
		                    </div>
                        </div>
                    </div>
                    <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"><img class="img-fluid rounded-3 my-5" src="https://dummyimage.com/600x400/343a40/6c757d" alt="..." /></div>
                </div>
            </div>
        </header>
		
        <!-- Page Content-->
        <section class="pt-4">
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
                                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-cloud-download"></i></div>
                                <h2 class="fs-4 fw-bold">유형</h2>
                                <p class="mb-0">${ dto.getStType() }</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-card-heading"></i></div>
                                <h2 class="fs-4 fw-bold">규모</h2>
                                <p class="mb-0">${ dto.getStScale() }</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-patch-check"></i></div>
                                <h2 class="fs-4 fw-bold">계약 기간</h2>
                                <p class="mb-0">${ dto.getStPeriod() }년</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-code"></i></div>
                                <h2 class="fs-4 fw-bold">세대 수</h2>
                                <p class="mb-0">${ dto.getStdOccupancy() }인</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-bootstrap"></i></div>
                                <h2 class="fs-4 fw-bold">평수</h2>
                                <p class="mb-0">${ dto.getStdRoomSize() }평</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-collection"></i></div>
                                <h2 class="fs-4 fw-bold">부대 시설</h2>
                                <p class="mb-0">${ dto.getStFacility() }</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
		
		
		<!-- footer include -->
		<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
		
		<!-- JAVASCRIPT FILES -->
		<jsp:include page="/WEB-INF/jsp/settings/js.jsp"/>
		
	</main>
</body>
</html>