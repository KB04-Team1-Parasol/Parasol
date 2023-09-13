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
        <title>맞춤형 결과</title>
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
		<script>
		  const Utils = Chart.helpers;
		</script>		
        <!-- CSS FILES -->        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700&family=Open+Sans&display=swap" rel="stylesheet">                       
        <link href="/css/bootstrap.min.css" rel="stylesheet">
        <link href="/css/bootstrap-icons.css" rel="stylesheet">
        <link href="/css/templatemo-topic-listing.css" rel="stylesheet">
        <link href="/css/custom.css" rel="stylesheet">

</head>

<!-- 사용자 위험도 그래프 -->
<script type="text/javascript"> 
const labels = ['안정형', '안전추구형', '위험중립형', '적극투자형', '공격투자형'];
const details = ['안정추구형은 원금에 대한 손실을 원하지 않아요. 안정성이 높아 확실한 원금과 환금성을 얻을수 있으나 수익률이 낮아 재무목표 달성에 한계가 있을 수 있어요! CMA, MMF, 예금, 적금, 절세상품등을 추천해요!',
	'안정추구형은 예적금 수익보단 높은 수익을 원하나, 투자원금이 보호되기를 원해요. 안정성이 높아 확실한 원금과 환금성을 기대할 수 있으나 수익률이 낮아 재무목표 달성에 한계가 있을 수 있어요! 채권형 펀드를 추천해요!',
	'위험중립형은 기대수익을 얻기 위해 어느 정도의 원금 손실은 인정해요. 많은 위험을 원하지 않아 시장변화에 민감한 편이에요. 안정성과 수익성을 모두 추구하고, 시장변화에 민감하여 불안감을 느끼기 쉬워요. 적립식 펀드와 중위험 펀드를 추천해요!',
	'적극투자형은 유동성 확보를 위한 일부 자산을 제외하고는 위험이 높은 자산에 투자해요. 높은 수익률을 기대할 수 있으나 위험도가 높다는 특징이 있어요. 위험이 높은 채권형 펀드와 주식형 펀드를 추천해요!',
	'공격투자형은 위험을 기꺼이 감수하더라도 고수익을 추구해요. 투자수익 가능성이 있다고 판단되면 유형을 가리지 않고 투자해요. 높은 수익률만큼 높은 위험도를 감수해요. 주식 비중이 70% 이상인 고위험 펀드와 직접투자를 추천해요!']
const resultValue = ${personal.result}; // personal.result 값
const backgroundColors = [
  'rgba(0, 255, 0, 0.2)', // 초록
  'rgba(0, 128, 0, 0.2)', // 연두
  'rgba(255, 255, 0, 0.2)', // 노랑
  'rgba(255, 165, 0, 0.2)', // 주황
  'rgba(255, 0, 0, 0.2)' // 빨강
];

//personal.result 값에 따라 특정 데이터 포인트의 색상을 변경
backgroundColors[resultValue - 1] = backgroundColors[resultValue - 1].replace('0.2', '1.0'); // personal.result 값을 1부터 5까지로 가정

const borderWidths = [1, 1, 1, 1, 1]; // 모든 데이터 포인트의 borderWidth 초기값은 1

const data = {
  labels: labels,
  datasets: [{
    label: '투자성향설문결과',
    data: [1, 2, 3, 4, 5],
    backgroundColor: backgroundColors, // personal.result 값에 따라 색상 선택
    borderColor: [
      'rgb(0, 255, 0)',
      'rgb(0, 128, 0)',
      'rgb(255, 255, 0)',
      'rgb(255, 165, 0)',
      'rgb(255, 0, 0)'
    ],
    borderWidth: borderWidths // borderWidths 배열을 사용하여 borderWidth 지정
  }]
};

const config = {
  type: 'bar',
  data: data,
  options: {
    scales: {
      y: {
        beginAtZero: true
      }
    }
  },
};
</script>

<script>
document.addEventListener("DOMContentLoaded", function () {
    const ctx = document.getElementById('myChart').getContext('2d');
    const myChart = new Chart(ctx, config);

    // personal.result 서버측 동적생성을 이용하여 페이지 랜더링
    const resultValue = ${personal.result}; // 예시 값, personal.result 값을 1부터 5까지로 가정

    // 설문 결과
    const resultLabel = document.getElementById('resultLabel');
    resultLabel.textContent = labels[resultValue - 1];
    

 	// 설명
    const detailLabel = document.getElementById('detail');
    detailLabel.textContent = details[resultValue - 1];

});
</script>




<body id="top">
	<main>	
		<!-- header include -->
		<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>		
		<section
			class="hero-section d-flex justify-content-center align-items-center" id="section_1">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-12 mx-auto">
						<h1 class="text-black text-center">{고객}님의 간단 투자 성향</h1>
						<h6 class="text-center">마이데이터를 활용한 상품추천도 둘러보세요!</h6>
					</div>
				</div>
			</div>
		</section>
		<section class="featured-section">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-6 col-12">			
						<div class="custom-block custom-block-overlay bg-white">		
							<div class="custom-block-overlay-text d-flex bg-white">
									<div>							
											<canvas id="myChart" width="550" height="250"></canvas>													
									</div>
							</div>
						</div>
					</div>		
				<div class="col-lg-4 col-12 mb-4 mb-lg-0">
					<div class="custom-block bg-white shadow-lg">
							<div class="d-flex">
								<div>
									  <h6 class="mb-2" id="resultLabel"></h6>	
									  <br>
									  <p id="detail" class="mb-0">Detail will be shown here.</p>			
					           </div>
							</div>
					</div>
				</div>

				</div>
			</div>
		</section>
        <section class="section-padding">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-12 col-12 text-center">
                            <h3 class="mb-4">KB맞춤 상품 추천</h3>
                            <h6 class="text-center">고객님의 마이데이터를 이용한 결과에요!</h6>
                        </div>
				       <div class="col-lg-8 col-12 mt-3 mx-auto">
					 </div>
                    </div>
                </div>
          </section>
          
          <!-- 탑 마진 줄일 것  -->
            <section class="section-padding">
            <div class="container">
					<div class="col-12">
								<div class="row">
									<div class="col-lg-4 col-md-6 col-12 mb-4 mb-lg-0">
										<div class="custom-block bg-white shadow-lg">
											<a href="topics-detail.html">
												<div class="d-flex">
													<div>
														<h5 class="mb-2">추천 채권</h5>
														<br>
														<h5 class="mb-2">${recommendedBond.bondName}</h5>
														<br>
														<p class="mb-0">채권 위험도 : ${recommendedBond.bondRisk}</p>
														<p class="mb-0">채권 수익률 : ${recommendedBond.bondRate}</p>
														<br>
														<a href="topics-detail.html" class="btn custom-btn mt-3 mt-lg-4">상품자세히보기</a>
													</div>				
												</div> 
											</a>
										</div>
									</div>

									<div class="col-lg-4 col-md-6 col-12 mb-4 mb-lg-0">
										<div class="custom-block bg-white shadow-lg">
											<a href="topics-detail.html">
												<div class="d-flex">
													<div>
														<h5 class="mb-2">추천 예금</h5>
														<br>
														<h5 class="mb-2">${recommendedDeposit.depositName}</h5>
														<br>
														<p class="mb-0">예금 만기일 : ${recommendedDeposit.depositPeriod}</p>
														<p class="mb-0">예금 이율 : ${recommendedDeposit.depositRate}</p>
														<br>
														<a href="topics-detail.html" class="btn custom-btn mt-3 mt-lg-4">상품자세히보기</a>
											
													</div>
												</div>
											</a>
										</div>
									</div>

									<div class="col-lg-4 col-md-6 col-12">
										<div class="custom-block bg-white shadow-lg">
											<a href="topics-detail.html">
												<div class="d-flex">
													<div>
														<h5 class="mb-2">${personal.result}</h5>

														<p class="mb-0">${personal.periodtime}</p>
													</div>
												</div>
											</a>
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