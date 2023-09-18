<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="description" content="">
        <meta name="author" content="">

        <title>예금디테일</title>
        <!-- CSS FILES -->        
    	<link href="/css/finance/custom-fin.css" rel="stylesheet">
    	<link href="/css/common.css" rel="stylesheet">
    	<jsp:include page="/WEB-INF/jsp/settings/css.jsp" />
        

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

							<h2 class="text-white">투자 성향 파악</h2>
                        </div>

                    </div>
                </div>
           </header>


            <section class="section-padding">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-12 col-12 text-center">
                            <h3 class="mb-4">${uname }님의 성향을 파악해봐요!</h3>
                        </div>
				       <div class="col-lg-8 col-12 mt-3 mx-auto">
                           
                           
                           <!-- 개인 투자 성향 파악 form, DTO로 주고받을 것임!! -->
                            <div class="custom-block-finance custom-block-topics-listing bg-white shadow-lg mb-5">
                                <div class="d-flex justify-content-center text-center">
     								<div class="custom-block-topics-listing-info d-flex justify-content-between">
                                        <div>
                                            <p class="mb-0">
											<form action="personal/result" method="post" modelAttribute="toja">
									        <h5>연령대를 선택해주세요!</h5>
									        <br>
									        <input type="radio" class="btn-check" autocomplete="off" id="age20s" name="age" value="5" required>
									        <label class="btn btn-outline-dark mb-2" for="age20s">20대</label>
									        <input type="radio" class="btn-check" autocomplete="off" id="age30s" name="age" value="4" required>
									        <label class="btn btn-outline-dark mb-2" for="age30s">30대</label>
									        <input type="radio" class="btn-check" autocomplete="off" id="age40s" name="age" value="3" required>
									        <label class="btn btn-outline-dark mb-2" for="age40s">40대</label>
									        <input type="radio" class="btn-check" autocomplete="off" id="age50s" name="age" value="2" required>
									        <label class="btn btn-outline-dark mb-2" for="age50s">50대</label>
									        <input type="radio" class="btn-check" autocomplete="off" id="age60s" name="age" value="1" required>
									        <label class="btn btn-outline-dark mb-2" for="age60s">60대 이상</label><br>
											<br>											
	                                     </div>
                                   </div>
                                </div>
                            </div>

                            <div class="custom-block-finance custom-block-topics-listing bg-white shadow-lg mb-5">
                                <div class="d-flex justify-content-center text-center">
	                                 <div class="custom-block-topics-listing-info d-flex">
                                        <div>
                                            <p class="mb-0">
											<h5>대략적인 연소득이 어떻게 되시나요?</h5>
											<br>
									        <input type="radio" class="btn-check" autocomplete="off" id="incomeUnder50" name="income" value="1" required>
									        <label class="btn btn-outline-dark mb-2" for="incomeUnder50">5천만원 이하</label>
									        <input type="radio" class="btn-check" autocomplete="off" id="income70s" name="income" value="2" required>
									        <label class="btn btn-outline-dark mb-2" for="income70s">7천만원대</label>
									        <input type="radio" class="btn-check" autocomplete="off" id="income90s" name="income" value="3" required>
									        <label class="btn btn-outline-dark mb-2"  for="income90s">9천만원대</label>
									        <input type="radio" class="btn-check" autocomplete="off" id="incomeOver100" name="income" value="4" required>
									        <label class="btn btn-outline-dark mb-2" for="incomeOver100">1억 이상</label><br>
										 	</p>
	                                     </div>
			                        </div>
                                </div>
                            </div>
                          
                                <div class="custom-block-finance custom-block-topics-listing bg-white shadow-lg mb-5">
                                	<div class="d-flex justify-content-center text-center">
	                                 <div class="custom-block-topics-listing-info d-flex"> <div>
                                            <p class="mb-0">
									        <h5>전체자산에서 금융 자산 비중이 어떻게 되시나요?</h5><br>
									        <input type="radio" class="btn-check" autocomplete="off" id="rateUnder10" name="finance" value="1" required>
									        <label class="btn btn-outline-dark mb-2" for="rateUnder10">10% 미만</label>			       
									        <input type="radio" class="btn-check" autocomplete="off" id="rateUnder30" name="finance" value="2" required>
									        <label class="btn btn-outline-dark mb-2" for="rateUnder30">30% 미만</label>
									        <input type="radio" class="btn-check" autocomplete="off" id="rateUnder50" name="finance" value="3" required>
									        <label class="btn btn-outline-dark mb-2" for="rateUnder50">50% 미만</label>
									        <input type="radio" class="btn-check" autocomplete="off" id="rateUpper50" name="finance" value="4" required>
									        <label class="btn btn-outline-dark mb-2" for="rateUpper50">50% 이상</label>
											<br>
	                                     </div>
                                   </div>
                                </div>
                            </div>
                            
                            <div class="custom-block-finance custom-block-topics-listing bg-white shadow-lg mb-5">
                                  <div class="d-flex justify-content-center text-center">
     								<div class="custom-block-topics-listing-info d-flex">
                                        <div>
                                            <p class="mb-0">
									        <h5>금융 자산 중 투자성 상품 비중이 어떻게 되시나요?</h5><br>
									        <input type="radio" class="btn-check" autocomplete="off" id="frateunder10" name="invest" value="1" required>
									        <label class="btn btn-outline-dark mb-2"  for="frateunder10">10% 미만</label>
									        <input type="radio" class="btn-check" autocomplete="off" id="frateunder30" name="invest" value="2" required>
									        <label class="btn btn-outline-dark mb-2" for="frateunder30">30% 미만</label>
									        <input type="radio" class="btn-check" autocomplete="off"  id="frateunder50" name="invest" value="3" required>
									        <label class="btn btn-outline-dark mb-2" for="frateunder50">50% 미만</label>
									        <input type="radio" class="btn-check" autocomplete="off"  id="frateupper50" name="invest" value="4" required>
									        <label class="btn btn-outline-dark mb-2" for="frateupper50">50% 이상</label><br>
											<br>
	                                     </div>
                                   </div>
                                </div>
                            </div>
                            
                       
                       		  <div class="custom-block-finance custom-block-topics-listing bg-white shadow-lg mb-5">
                                <div class="d-flex justify-content-center text-center">
     								<div class="custom-block-topics-listing-info d-flex">
                                        <div>
                                            <p class="mb-0">
									        <h5>금융 상품에 대해 얼마나 이해하고 계신가요?</h5><br>
									        <input type="radio" class="btn-check" autocomplete="off"  id="knowalot" name="understand" value="5" required>
									       	<label class="btn btn-outline-dark mb-2" for="knowalot">각종 파생 상품을 알고있다</label>
									        <input type="radio" class="btn-check" autocomplete="off"  id="knowhalf" name="understand" value="3" required>
									        <label class="btn btn-outline-dark mb-2" for="knowhalf">적당히 알고있다</label>
									        <input type="radio" class="btn-check" autocomplete="off"  id="knowless" name="understand" value="1" required>
									        <label class="btn btn-outline-dark mb-2" for="knowless">어디까지만 안다</label><br>
											<br>
	                                     </div>
                                   </div>
                                </div>
                            </div>
                       
                       
                       	  <div class="custom-block-finance custom-block-topics-listing bg-white shadow-lg mb-5">
                                <div class="d-flex justify-content-center text-center">
     								<div class="custom-block-topics-listing-info d-flex">
                                        <div>
                                            <p class="mb-0">
									        <h5>수익과 손실에 대해 어떤 생각이신가요?</h5><br>
									        <input type="radio" class="btn-check" autocomplete="off" id="yesloss" name="lossprofit" value="5" required>
									        <label class="btn btn-outline-dark mb-2" for="yesloss">손실 나도 수익이 나면 괜찮다</label>
									        <input type="radio" class="btn-check" autocomplete="off" id="noboth" name="lossprofit" value="3" required>
									        <label class="btn btn-outline-dark mb-2" for="noboth">손실은 부담스럽다</label>
									        <input type="radio" class="btn-check" autocomplete="off"id="noloss" name="lossprofit" value="1" required>
									        <label class="btn btn-outline-dark mb-2" for="noloss">수익이 나지 않아도 손실은 싫다</label><br>
											<br>
	                                     </div>
                                   </div>
                                </div>
                            </div>
                       
	                        <div class="custom-block-finance custom-block-topics-listing bg-white shadow-lg mb-5">
	                                <div class="d-flex justify-content-center text-center">
	     								<div class="custom-block-topics-listing-info d-flex">
	                                        <div>
	                                            <p class="mb-0">
										        <h5>파생상품에 대해 얼마나 이해하고 있나요?</h5><br>
										        <input type="radio" class="btn-check" autocomplete="off" id="fullknow" name="derivatives" value="5" required>
										        <label class="btn btn-outline-dark mb-2" for="fullknow">잘 알고 있다</label>
										        <input type="radio" class="btn-check" autocomplete="off" class="btn-check" autocomplete="off" id="halfknow" name="derivatives" value="3" required>
										        <label class="btn btn-outline-dark mb-2" for="halfknow">조금 알고 있다</label>
										        <input type="radio" class="btn-check" autocomplete="off" class="btn-check" autocomplete="off" id="lessknow" name="derivatives" value="1" required>
										        <label class="btn btn-outline-dark mb-2" for="lessknow">잘 모른다</label><br>
												<br>
		                                     </div>
	                                   </div>
	                                </div>
	                          </div>
	                          
	                          <div class="custom-block-finance custom-block-topics-listing bg-white shadow-lg mb-5">
                                <div class="d-flex justify-content-center text-center">
     								<div class="custom-block-topics-listing-info d-flex">
                                        <div>
                                            <p class="mb-0">
                                            <form action="personal/result" method="post" modelAttribute="toja">
									        <h5>예적금에 가입한다면 희망하는 투자 기간은 어떻게 되나요?</h5>
									        <input type="radio" class="btn-check" autocomplete="off" id="1y" name="periodtime" value="12" required>
									        <label class="btn btn-outline-dark mb-2" for="1y">1년 이하</label>
									        <input type="radio" class="btn-check" autocomplete="off" id="2y" name="periodtime" value="24" required>
									        <label class="btn btn-outline-dark mb-2" for="2y">2년 이하</label>
									        <input type="radio" class="btn-check" autocomplete="off" id="3y" name="periodtime" value="36" required>
									        <label class="btn btn-outline-dark mb-2" for="3y">3년 이하</label>
									        <input type="radio" class="btn-check" autocomplete="off" id="4y" name="periodtime" value="999" required>
									        <label class="btn btn-outline-dark mb-2"  for="4y">상관없음</label><br>
											<br>
	                                     </div>
                                   </div>
                                </div>
                            </div>
                          	<div class="d-flex justify-content-center mb-3">						
							<input type="submit" value="제출" class="btn btn-dark mt-3 mt-lg-0">
							</div>											    
						   </form>    	    
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