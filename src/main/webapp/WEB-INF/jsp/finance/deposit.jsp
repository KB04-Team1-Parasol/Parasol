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

        <title>예금상품</title>

        <!-- CSS FILES -->        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700&family=Open+Sans&display=swap" rel="stylesheet">                       
        <link href="/css/bootstrap.min.css" rel="stylesheet">
        <link href="/css/bootstrap-icons.css" rel="stylesheet">
        <link href="/css/templatemo-topic-listing.css" rel="stylesheet">
        <link href="/css/custom.css" rel="stylesheet">
    </head>
    <body class="topics-listing-page" id="top">
        <main>
            <nav class="navbar navbar-expand-lg">
                <div class="container">
                    <a class="navbar-brand" href="index.html">
                        <i class="bi-back"></i>
                        <span>예금상품페이지임</span>
                    </a>

                    <div class="d-lg-none ms-auto me-4">
                        <a href="#top" class="navbar-icon bi-person smoothscroll"></a>
                    </div>
    
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
    
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav ms-lg-5 me-lg-auto">
                            <li class="nav-item">
                                <a class="nav-link click-scroll" href="index.html#section_1">Home</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link click-scroll" href="index.html#section_2">Browse Topics</a>
                            </li>
    
                            <li class="nav-item">
                                <a class="nav-link click-scroll" href="index.html#section_3">How it works</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link click-scroll" href="index.html#section_4">FAQs</a>
                            </li>
    
                            <li class="nav-item">
                                <a class="nav-link click-scroll" href="index.html#section_5">Contact</a>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#section_5" id="navbarLightDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">Pages</a>

                                <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarLightDropdownMenuLink">
                                    <li><a class="dropdown-item active" href="topics-listing.html">Topics Listing</a></li>

                                    <li><a class="dropdown-item" href="contact.html">Contact Form</a></li>
                                </ul>
                            </li>
                        </ul>

                        <div class="d-none d-lg-block">
                            <a href="#top" class="navbar-icon bi-person smoothscroll"></a>
                        </div>
                    </div>
                </div>
            </nav>


            <header class="site-header d-flex flex-column justify-content-center align-items-center">
                <div class="container">
                    <div class="row align-items-center">

                        <div class="col-lg-5 col-12">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">금융상품둘러보기</a></li>

                                    <li class="breadcrumb-item active" aria-current="page">KB예금상품</li>
                                </ol>
                            </nav>

                            <h2 class="text-white">KB예금상품</h2>
                        </div>

                    </div>
                </div>
            </header>


            <section class="section-padding">
                <div class="container">
                    <div class="row">
						<div class=" col-lg-8 col-12 mt-3 mx-auto">
						    <c:forEach var="deposit" items="${depositList.content}">
						        <div class="custom-block custom-block-topics-listing bg-white shadow-lg mb-5">
						            <div class="d-flex">
						                <!-- 이미지 및 기타 정보 출력 -->
						                <div class="custom-block-topics-listing-info d-flex">
						                    <div >

						                        <h5 class="mb-2">상품 명: ${deposit.depositName}</h5>
						                        <p class="mb-0">최대 기간: ${deposit.depositPeriod}</p>
						                        <p class="mb-0">만기 이자율: ${deposit.depositRate}</p>
						                        <a href="<c:url value="/finance/deposit/${deposit.depositNo}" />" class="btn custom-btn mt-3 mt-lg-4">상품자세히보기</a>

            								</div>
						                </div>
						                <div class="d-flex col-5 justify-content-end">
						                <c:set var="kbcha" value="${deposit.depositNo % 5+1}" />
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
						            <li class="page-item ${depositList.number == 0 ? 'disabled' : ''}">
									    <a class="page-link" href="?page=${depositList.number}" aria-label="Previous">
									        <span aria-hidden="true">이전</span>
									    </a>
									</li>
						
						            <!-- 페이지 번호 동적 생성 -->
						            <c:forEach begin="1" end="${depositList.totalPages}" var="pageNumber">
						                <li class="page-item ${pageNumber == depositList.number + 1 ? 'active' : ''}">
						                    <a class="page-link" href="?page=${pageNumber}">${pageNumber}</a>
						                </li>
						            </c:forEach>
						
						            <li class="page-item ${depositList.number + 1 == depositList.totalPages ? 'disabled' : ''}">
						                 <a class="page-link" href="?page=${depositList.number + 2}" aria-label="Next">
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