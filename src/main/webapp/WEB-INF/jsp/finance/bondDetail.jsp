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

    <!-- 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function calculateSum() {
    var won = parseFloat(document.getElementById('won').value);
    var period = parseFloat(document.getElementById('period').value);
    var percent = parseFloat(document.getElementById('percent').value);
    var interest = won * period * (percent * (period + 1) / 24) / 100;
    var result = won + interest;
    document.getElementById('result').innerHTML = '이자: ' + '<b>'+ interest + '</b>' + '를 더해' + '<br>'+ '총: '+ '<b>' +result  +'</b>' + '을 모으실 수 있습니다.' ;

    // 폼의 기본 제출 동작을 방지합니다.
    return false;
}
</script>
 -->
    <!-- CSS FILES -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700&family=Open+Sans&display=swap"
        rel="stylesheet">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/bootstrap-icons.css" rel="stylesheet">
    <link href="/css/templatemo-topic-listing.css" rel="stylesheet">
    <link href="/css/custom.css" rel="stylesheet">
    <link href="/css/custom-fin.css" rel="stylesheet">

    <!--

TemplateMo 590 topic listing

https://templatemo.com/tm-590-topic-listing

-->
</head>

<body class="topics-listing-page" id="top">
    <main>
        <header class="site-header d-flex flex-column justify-content-center align-items-center">
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
                        <div class="custom-block custom-block-topics-listing bg-white shadow-lg mb-5">
                            <div class="d-flex justify-content-center">

                                <div class="custom-block-topics-listing-info d-flex">
                                    <div>
                                        <span class="badge bg-design rounded-pill">${bond.bondNo}</span>
                                        <br>
                                        <div class="detail-width">
                                            <h3 class="mb-0">${bond.bondName}</h3>
                                            <h6 class="mb-1">${bond.bondCode} </h6>
                                        </div>
                                        <hr>
                                        <br>
                                        <div class="row mb-4">

                                            <!-- 첫번째 -->
                                            <div class="col-lg-4 col-md-6 col-12 mb-4 mb-lg-0" style="height: 150px;">
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
                                            <div class="col-lg-4 col-md-6 col-12 mb-4 mb-lg-0" style="height: 150px;">
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
                                            <div class="col-lg-4 col-md-6 col-12 mb-4 mb-lg-0" style="height: 150px;">
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
                                            <a href="https://www.kbsec.com/go.able" class="btn custom-btn mt-3 mt-lg-4">
                                                상품 가입</a>
                                        </div>
                                        <div class="d-flex justify-content-end mb-2">
                                            <h9>※ 자세한 내용은 아래 상품안내를 참조하시기 바랍니다.</h9>
                                        </div>

                                        <hr>

                                        <div>
                                            <h5>이 채권의 특징은?</h5>
                                            <!-- 첫번째 체크 -->
                                            <div class="mb-3">
	                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
	                                                fill="#01DFD7" class="bi bi-check2" viewBox="0 0 16 16">
	                                                <path
	                                                    d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z" />
	                                            </svg>
                                           		 <h7><b>이자는 <span style="color:#DF013A ">${bond.bondCycle}</b></span><b>개월마다 받아요</b></h7>
                                            </div>
											<!-- 두번째 체크 -->
											<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                fill="#01DFD7" class="bi bi-check2" viewBox="0 0 16 16">
                                                <path
                                                    d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z" />
                                            </svg>
                                            <h7><b>이자는 약 <span style="color:#DF013A ">${bond.bondRate}%</b></span><b>만큼 받아요 </b></h7><small> (채권수량기준)</small>
											
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div
                            class="row custom-block custom-block-topics-listing bg-white shadow-lg mb-5 d-flex">
                            <h4>가상투자해보기</h4><br>
                            <div class="d-flex justify-content-center align-items-center">
                            	<div><h3>1000만원</h3></div>
                            	<div><h4>을 투자한다면, 만기예상금액(세전)은 ${10000000 * (100 + bond.bondRate)})</h4></div>
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