<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 날짜 계산을 위해 -->
<!doctype html>

<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="description" content="">
<meta name="author" content="">

<title>채권 상세보기</title>

<!-- CSS FILES -->
<link href="/css/finance/custom-fin.css" rel="stylesheet">
<jsp:include page="/WEB-INF/jsp/settings/css.jsp" />

</head>

<body class="topics-listing-page" id="top">
	<main>
		<jsp:include page="/WEB-INF/jsp/common/header2.jsp" />
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
											<h3 class="mb-0">${bond.bondName}</h3>
											<h6 class="mb-1">${bond.bondCode}</h6>
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
															src="https://oimg1.kbstar.com/img/ocommon/2018/product/icon_info8.png"
															alt=""></span> <span> &nbsp;신용등급</span>
													</div>

													<div class="d-flex justify-content-end">
														<!-- 우측 정렬을 위해 justify-content-end 추가 -->

														<div>
															<h6 class="mb-2">${bond.bondCredit}</h6>
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
															src="https://oimg1.kbstar.com/img/ocommon/2018/product/icon_info3.png"
															alt=""></span> <span>&nbsp; 수익률 </span>
													</div>

													<div class="d-flex justify-content-end">
														<!-- 우측 정렬을 위해 justify-content-end 추가 -->

														<div>
															<h6 class="text-red mb-2">${bond.bondRate}%</h6>
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
															src="https://oimg1.kbstar.com/img/ocommon/2018/product/icon_info1.png"
															alt=""></span> <span> &nbsp;만기까지</span>
													</div>

													<div class="d-flex justify-content-end">
														<!-- 우측 정렬을 위해 justify-content-end 추가 -->
														<div>
															<c:choose>
																<c:when test="${bond.month >= 0}">
																	<h6 class="mb-0">${bond.year - currentYear}년
																		${bond.month}월</h6>
																</c:when>
																<c:otherwise>
																	<h6 class="mb-0">${bond.year - currentYear -1}년
																		${(12+bond.month)}월</h6>
																</c:otherwise>
															</c:choose>
															<small>${bond.bondDate}</small>
														</div>


													</div>
												</div>
											</div>


										</div>

										<div class="d-flex justify-content-center mb-3">
											<a href="https://www.kbsec.com/go.able"
												class="btn custom-btn mt-3 mt-lg-4"> 상품 가입</a>
										</div>
										<div class="d-flex justify-content-end mb-2">
											<h9>※ 자세한 내용은 아래 상품안내를 참조하시기 바랍니다.</h9>
										</div>

										<hr>

										<div>
											<h5>이 채권의 특징은?</h5>
											<!-- 첫번째 체크 -->
											<div class="mb-3">
												<svg xmlns="http://www.w3.org/2000/svg" width="24"
													height="24" fill="#01DFD7" class="bi bi-check2"
													viewBox="0 0 16 16">
	                                                <path
														d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z" />
	                                            </svg>
												<h7>
												<b>이자는 <span style="color: #DF013A">${bond.bondCycle}</b>
												</span>
												<b>개월마다 받아요</b></h7>
											</div>
											<!-- 두번째 체크 -->
											<svg xmlns="http://www.w3.org/2000/svg" width="24"
												height="24" fill="#01DFD7" class="bi bi-check2"
												viewBox="0 0 16 16">
                                                <path
													d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z" />
                                            </svg>
											<h7>
											<b>이자는 약 <span style="color: #DF013A">${bond.bondRate}%</b>
											</span>
											<b>만큼 받아요 </b></h7>
											<small> (채권수량기준)</small>

										</div>
										
										
										
									</div>
								</div>
							</div>
						</div>
						<div
							class="row custom-block custom-block-topics-listing bg-white shadow-lg mb-5 d-flex">
							<div class="d-flex justify-content-center align-items-center mb-5">
								<h4>가상투자해보기</h4>
								<br>
							</div>
							<div class="d-flex justify-content-center align-items-center">
								<h2 class="text-detail">1000만원</h2>
								<h4>을</h4>
								<h2 class="text-detail">${(bond.year - currentYear) * 12 + bond.month }개월간</h2>
								<h4>투자한다면,</h4>
							</div>
							<div class="d-flex justify-content-center align-items-center">
								<h4>만기 예상 금액은(세전)</h4>
							</div>
							<div class="d-flex justify-content-center align-items-center mb-3">
								<h2 class="text-detail"> ${ Math.round((((bond.year - currentYear) * 12 + bond.month) / 12 * bond.bondRate +100) * 100000) }원</h2>
								 <h4>입니다.</h4>
							</div>
							<hr>
							
							<div class="mb-3">  </div>
							<div class="d-flex justify-content-center mb-5">  
								<div class="col-lg-5">
									<div>
										<h5>이 채권의 주요 정보는?</h5>
									</div>
									<hr>
									<!-- 1. -->
									<div class="left-box">투자등급</div>
									<c:choose>
								        <c:when test="${bond.bondRisk == 1}"><div class="right-box">초저위험</div><br></c:when>
										<c:when test="${bond.bondRisk == 2}">
											<div class="right-box">저위험</div>
											<br>
										</c:when>
										<c:when test="${bond.bondRisk == 3}"><div class="right-box">중위험</div><br></c:when>
								        <c:when test="${bond.bondRisk == 4}"><div class="right-box">고위험</div><br></c:when>
								        <c:when test="${bond.bondRisk == 5}"><div class="right-box">초고위험</div><br></c:when>
								        <c:otherwise>알 수 없는 위험</c:otherwise>
								    </c:choose>
									<!-- 2. -->
									<div class="left-box">이자지급방법</div>
									<div class="right-box">이표채(확정금리)</div><br>
									<!-- 3. -->
									<div class="left-box">이자지급주기</div>
									<div class="right-box">${bond.bondCycle}개월</div><br>
									<!-- 4. -->
									<div class="left-box">신용등급</div>
									<div class="right-box">${bond.bondCredit}</div><br>
									<!-- 5. -->
									<div class="left-box">투자기간</div>
									<div class="right-box">${((bond.year - currentYear) * 12 + bond.month)*31} 일</div><br>
								</div>
							</div>
							
							
							<div>
							<h7> * 가상투자 결과물은 고객님의 이해를 돕기 위해 </h7>
							<h6 class="text-red"> 계산된 예상 금액으로 실제와 차이가 있을 수 있으니 유의 바랍니다.</h6>
							</div>
							
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