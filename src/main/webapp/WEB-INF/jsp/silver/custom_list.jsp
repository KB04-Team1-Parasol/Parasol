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
</head>
<body id="top">
	<main>
	
		<!-- header include -->
		<jsp:include page="/WEB-INF/jsp/common/header2.jsp"/>
		
		<!-- Section-->
        <section class="py-5_silver_list">
            <div class="container px-4 px-lg-5 mt-5">
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
		                                    <h5 class="fw-bolder">${ silverTownDetail.stName } ${ silverTownDetail.stRoomType }</h5>
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
            </div>
        </section>
		
		
		<!-- footer include -->
		<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
		
		<!-- JAVASCRIPT FILES -->
		<jsp:include page="/WEB-INF/jsp/settings/js.jsp"/>
		
	</main>
</body>
</html>