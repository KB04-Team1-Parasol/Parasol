<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>실버타운 검색</title>
<!-- css setting -->
<jsp:include page="/WEB-INF/jsp/settings/css.jsp"/>
<link href="/css/silver/list.css" rel="stylesheet" />
</head>

<body>
	<main>
		<!-- header include -->
		<jsp:include page="/WEB-INF/jsp/common/header2.jsp" />
	</main>

	<h1>실버타운 검색</h1>
	<section class="section-padding-silver-f">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-30 col-12 mb-4 mb-lg-0">
					<div class="custom-block bg-white shadow-lg">
						<form action="search" method="post">
						<div class="row gx-lg-5">
							<div class="col-lg-6 col-xxl-6 mb-2">
								<div>
									<h5 class="mb-3">지역 선택</h5>
									<input type="radio" class="btn-check" name="city" id="1" autocomplete="off" value="서울"> 
										<label class="btn btn-outline-warning mb-2" for="1">서울</label> 
									<input type="radio" class="btn-check" name="city" id="2" autocomplete="off" value="경기"> 
										<label class="btn btn-outline-warning mb-2" for="2">경기</label> 
									<input type="radio" class="btn-check" name="city" id="3" autocomplete="off" value="부산"> 
										<label class="btn btn-outline-warning mb-2" for="3">부산</label> 
									<input type="radio" class="btn-check" name="city" id="4" autocomplete="off" value="대구"> 
										<label class="btn btn-outline-warning mb-2" for="4">대구</label> 
									<input type="radio" class="btn-check" name="city" id="5" autocomplete="off" value="대전"> 
										<label class="btn btn-outline-warning mb-2" for="5">대전</label> 
									<input type="radio" class="btn-check" name="city" id="6" autocomplete="off" value="세종"> 
										<label class="btn btn-outline-warning mb-2" for="6">세종</label> 
									<input type="radio"class="btn-check" name="city" id="7" autocomplete="off" value="광주"> 
										<label class="btn btn-outline-warning mb-2" for="7">광주</label> 
									<input type="radio" class="btn-check" name="city" id="8" autocomplete="off" value="강원"> 
										<label class="btn btn-outline-warning mb-2" for="8">강원</label> 
									<input type="radio" class="btn-check" name="city" id="9" autocomplete="off" value="경북"> 
										<label class="btn btn-outline-warning mb-2" for="9">경북</label> 
									<input type="radio" class="btn-check" name="city" id="10" autocomplete="off" value="경남"> 
										<label class="btn btn-outline-warning mb-2" for="10">경남</label> 
									<input type="radio" class="btn-check" name="city" id="11" autocomplete="off" value="충북"> 
										<label class="btn btn-outline-warning mb-2" for="11">충북</label> 
									<input type="radio" class="btn-check" name="city" id="12" autocomplete="off" value="충남"> 
										<label class="btn btn-outline-warning mb-2" for="12">충남</label> 
									<input type="radio" class="btn-check" name="city" id="13" autocomplete="off" value="전북"> 
										<label class="btn btn-outline-warning mb-2" for="13">전북</label> 
									<input type="radio" class="btn-check" name="city" id="14" autocomplete="off" value="전남"> 
										<label class="btn btn-outline-warning mb-2" for="14">전남</label> 
									<input type="radio" class="btn-check" name="city" id="15" autocomplete="off" value="제주"> 
										<label class="btn btn-outline-warning mb-2" for="15">제주</label>
								</div>
								<br>
								<div>
									<h5 class="mb-3">유형 선택</h5>
									<input type="radio" class="btn-check" name="stType" id="s1" autocomplete="off" value="1"> 
										<label class="btn btn-outline-warning mb-2" for="s1">도심형</label> 
									<input type="radio" class="btn-check" name="stType" id="s2" autocomplete="off" value="2"> 
										<label class="btn btn-outline-warning mb-2" for="s2">근교형</label> 
									<input type="radio" class="btn-check" name="stType" id="s3" autocomplete="off" value="3"> 
										<label class="btn btn-outline-warning mb-2" for="s3">전원형</label>
								</div>
								<br>
								<div>
									<h5 class="mb-3">단지 크기 선택</h5>
									<input type="radio" class="btn-check" name="stScale" id="stScale1" autocomplete="off" value="1"> 
										<label class="btn btn-outline-warning mb-2" for="stScale1">대형</label> 
									<input type="radio" class="btn-check" name="stScale" id="stScale2" autocomplete="off" value="2"> 
										<label class="btn btn-outline-warning mb-2" for="stScale2">중형</label> 
									<input type="radio" class="btn-check" name="stScale" id="stScale3" autocomplete="off" value="3"> 
										<label class="btn btn-outline-warning mb-2" for="stScale3">소형</label>
								</div>
								<br>
								<div>
									<h5 class="mb-3">세대수 선택</h5>
									<input type="radio" class="btn-check" name="stdOccupancy" id="o1" autocomplete="off" value="1"> 
										<label class="btn btn-outline-warning mb-2" for="o1">1명</label> 
									<input type="radio" class="btn-check" name="stdOccupancy" id="o2" autocomplete="off" value="2"> 
										<label class="btn btn-outline-warning mb-2" for="o2">2명</label>
									<input type="radio" class="btn-check" name="stdOccupancy" id="o3" autocomplete="off" value="3"> 
										<label class="btn btn-outline-warning mb-2" for="o3">3명</label>
									<input type="radio" class="btn-check" name="stdOccupancy" id="o4" autocomplete="off" value="4"> 
										<label class="btn btn-outline-warning mb-2" for="o4">4명</label>
								</div>
							</div>
							<div class="col-lg-6 col-xxl-4 mb-2">
								<div class="mb-3">
									<h5 class="mb-3">평수</h5>
									<input type="radio" class="btn-check" name="stdRoomSize" id="stdRoomSize4" autocomplete="off" value="100"> 
										<label class="btn btn-outline-warning mb-2" for="stdRoomSize4">전체</label> 
									<input type="radio" class="btn-check" name="stdRoomSize" id="stdRoomSize1" autocomplete="off" value="20"> 
										<label class="btn btn-outline-warning mb-2" for="stdRoomSize1">20평 이하</label> 
									<input type="radio" class="btn-check" name="stdRoomSize" id="stdRoomSize2" autocomplete="off" value="30"> 
										<label class="btn btn-outline-warning mb-2" for="stdRoomSize2">30평 이하</label> 
									<input type="radio" class="btn-check" name="stdRoomSize" id="stdRoomSize3" autocomplete="off" value="40"> 
										<label class="btn btn-outline-warning mb-2" for="stdRoomSize3">40평 이하</label> 
								</div>
								<div class="mb-3">
									<h5 class="mb-3">최대 보증금 (만원)</h5>
								  	<input type="number" class="form-control" name="stdDeposit" id="DepositInput">
								</div>
								<div class="mb-3">
									<h5 class="mb-3">최대 월세 (만원)</h5>
								  	<input type="number" class="form-control" name="stdMonthlyCost" id="MonthlyCostInput">
								</div>
								<div class="mb-3">
									<h5 class="mb-3">계약 기간</h5>
								  	<input type="number" class="form-control" name="stPeriod" id="stPeriodInput">
								</div>
								<div class="mb-3">
									<h5 class="mb-3">실버타운 이름</h5>
								  	<input type="text" class="form-control" name="stName" id="stNameInput">
								</div>
								</div>
							</div>
							<div class="text-end">
    							<button class="btn btn-warning" type="submit" style="font-weight: bold">검색</button>
  							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="py-5_silver_list_ff">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                	<c:forEach items="${responseDto}" var="sliver">
	                	<div class="col mb-5 silver_items">
		                	<a href="/silver/detail/${sliver.stdNo}">
		                        <div class="card h-100">
		                            <!-- Product image-->
		                            <img class="card-img-top" src=${sliver.imgUrl} alt="..." />
		                            <!-- Product details-->
		                            <div class="card-body p-4">
		                                <div class="text-center">
		                                    <!-- Product name-->
		                                    <h5 class="fw-bolder">${sliver.townName} ${sliver.typeName}</h5>
		                                    <!-- Product price-->
		                                    보증금 : ${sliver.deposit}원<br>
		                                    월세 : ${sliver.monCost}원
		                                </div>
		                            </div>
		                        </div>
		                	</a>
	                    </div>
                    </c:forEach>
              	</div>
	        </div>
	</section>

</body>

</html>