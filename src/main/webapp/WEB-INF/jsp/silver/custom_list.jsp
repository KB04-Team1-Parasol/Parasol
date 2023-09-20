<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맞춤 실버타운 찾기</title>
<!-- css setting -->
<jsp:include page="/WEB-INF/jsp/settings/css.jsp"/>
<link href="/css/silver/list.css" rel="stylesheet" />
<link href="/css/common.css" rel="stylesheet" />
</head>
<body id="top">
	<main>
	
		<!-- header include -->
		<jsp:include page="/WEB-INF/jsp/common/header2.jsp"/>
		
		<header
			class="site-header-finance d-flex flex-column justify-content-center align-items-center">
			<div class="container">
				<div class="row align-items-center">

					<div class="col-lg-5 col-12">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/index">HOME</a></li>

								<li class="breadcrumb-item active" aria-current="page">실버타운</li>
							</ol>
						</nav>

						<h2 class="text-white">맞춤 실버타운 찾기</h2>
					</div>

				</div>
			</div>
		</header>
		
		<!-- Section-->
        <section class="py-5_silver_list">
        	<div class="text-center mt-5">
	        	<h3>${ uname }님의 맞춤 실버타운</h3>
	        	<span>(자산정보 기반)</span>
        	</div>
            <div class="container px-4 px-lg-5 mt-5">
               	<c:choose>
               		<c:when test="${silverTownCustomList.size() > 0}">
	                	<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
		                    <c:forEach var="silverTownDetail" items="${silverTownCustomList}">
			                	<div class="col mb-5 silver_items">
				                	<a href="detail_custom/${ silverTownDetail.stdNo }">
				                        <div class="card h-100">
				                            <!-- Product image-->
				                            <img class="card-img-top" src="${ silverTownDetail.stImgUrl }" alt="..." />
				                            <!-- Product details-->
				                            <div class="card-body p-4">
				                                <div class="text-center">
				                                    <!-- Product name-->
				                                    <h5 class="fw-bolder">${ silverTownDetail.stName } <br> ${ silverTownDetail.stRoomType }</h5>
				                                    <!-- Product price-->
				                                    보증금 : ${ silverTownDetail.stdDeposit }원<br>
				                                    월세 : ${ silverTownDetail.stdMonthlyCost }원<br>
				                                    <c:if test="${ silverTownDetail.depositCnt > 0 }">
				                                    	<span class="badge rounded-pill">예금</span>
				                                    </c:if>
				                                    <c:if test="${ silverTownDetail.savingCnt > 0 }">
				                                    	<span class="badge rounded-pill">적금</span>
				                                    </c:if>
				                                    <c:if test="${ silverTownDetail.bondCnt > 0 }">
				                                    	<span class="badge rounded-pill">채권</span>
				                                    </c:if>
				                                </div>
				                            </div>
				                        </div>
				                	</a>
			                    </div>
		                    </c:forEach>
	                    </div>
                   	</c:when>
                    <c:otherwise>
                    	<div class="text-center mb-5">
	                    	<img src="/images/silver/nosilver.png">
	                    	<p class="mt-5">해당하는 실버타운이 없습니다.</p>
                    	</div>
                    </c:otherwise>
	          	</c:choose>
            </div>
        </section>
		
		
		<!-- footer include -->
		<jsp:include page="/WEB-INF/jsp/common/custom_footer.jsp"/>
		
		<!-- JAVASCRIPT FILES -->
		<jsp:include page="/WEB-INF/jsp/settings/js.jsp"/>
		
	</main>
</body>
</html>