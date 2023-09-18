<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="description" content="">
        <meta name="author" content="">

        <title>적금상품</title>

        <!-- CSS FILES -->        
        <link href="/css/finance/custom-fin.css" rel="stylesheet">
        <link href="/css/common.css" rel="stylesheet">
        <jsp:include page="/WEB-INF/jsp/settings/css.jsp" />
        
<!--
TemplateMo 590 topic listing
https://templatemo.com/tm-590-topic-listing
-->
    </head>
    <body class="topics-listing-page" id="top">
        <main>
			<jsp:include page="/WEB-INF/jsp/common/header2.jsp" />

            <header class="site-header-finance d-flex flex-column justify-content-center align-items-center">
                <div class="container">
                    <div class="row align-items-center">

                        <div class="col-lg-5 col-12">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">HOME</a></li>

                                    <li class="breadcrumb-item active" aria-current="page">금융상품</li>
                                </ol>
                            </nav>

                            <h2 class="text-white">KB적금상품</h2>
                        </div>

                    </div>
                </div>
            </header>
            <section class="section-padding">
                <div class="container">
                    <div class="row">
						<div class="col-lg-8 col-12 mt-3 mx-auto">
						    <c:forEach var="saving" items="${savingList.content}">
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
                 <div class="col-lg-12 col-12">
                        
                        <!-- 페이징 처리, 다른 jsp 에도 동일하게 적용할 것 -->
						    <nav aria-label="Page navigation example">
						        <ul class="pagination justify-content-center mb-0">
						            <li class="page-item ${savingList.number == 0 ? 'disabled' : ''}">
									    <a class="page-link" href="?page=${savingList.number}" aria-label="Previous">
									        <span aria-hidden="true">이전</span>
									    </a>
									</li>
						
						            <!-- 페이지 번호 동적 생성 -->
						            <c:forEach begin="1" end="${savingList.totalPages}" var="pageNumber">
						                <li class="page-item ${pageNumber == savingList.number + 1 ? 'active' : ''}">
						                    <a class="page-link" href="?page=${pageNumber}">${pageNumber}</a>
						                </li>
						            </c:forEach>
						
						            <li class="page-item ${savingList.number + 1 == savingList.totalPages ? 'disabled' : ''}">
						                 <a class="page-link" href="?page=${savingList.number + 2}" aria-label="Next">
						            <span aria-hidden="true">다음</span>
						        </a>
						            </li>
						        </ul>
						    </nav>
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