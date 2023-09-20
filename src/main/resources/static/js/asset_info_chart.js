// 데이터를 전달하는 함수
function loadAssetData() {
  // 데이터를 이용하여 차트를 생성하는 코드 작성
  var ctx1 = document.getElementById("myChart").getContext("2d");
  var ctx2 = document.getElementById("myChart2").getContext("2d");
  var cash = parseInt(pureAsset) - parseInt(realAsset) - parseInt(finAsset) + parseInt(debt);
  var monthlySum = parseInt(monthlyIncome) + parseInt(annuity);
  var myChart = new Chart(ctx1, {
    type: "doughnut",
    data: {
      labels: ["금융자산", "실물자산", "현금", "부채"],
      datasets: [
        {
          data: [finAsset, realAsset, cash, debt],
          backgroundColor: ["#11CCFF", "#98FB98", "#C7F7FB", "#FFC0CB	"],
        },
      ],
    },
    options: {
    responsive: false,
        tooltips: {
            enabled: false, // 툴팁 비활성화
        },
    },
  });

  var myChart2 = new Chart(ctx2, {
    type: "radar",
    data: {
      labels: ["금융자산", "실물자산", "현금", "부채", "월소득"],
      datasets: [
        {
          label: "나의 자산",
          data: [finAsset, realAsset*0.7, cash, debt * 10,monthlySum*30  ],
          backgroundColor: 'rgba(54, 162, 235, 0.2)',
          borderColor: 'rgb(54, 162, 235)',
          pointBackgroundColor: 'rgb(54, 162, 235)',
          pointBorderColor: '#fff',
          pointHoverBackgroundColor: '#fff',
          pointHoverBorderColor: 'rgb(54, 162, 235)'
        },
        {
          label: "60대 평균 자산",
          data: [averageFinAsset, averageRealAsset, averageCash, averageDebt, averageMonthlySum],
          backgroundColor: 'rgba(255, 99, 132, 0.2)',
          borderColor: 'rgb(255, 99, 132)',
          pointBackgroundColor: 'rgb(255, 99, 132)',
          pointBorderColor: '#fff',
          pointHoverBackgroundColor: '#fff',
          pointHoverBorderColor: 'rgb(255, 99, 132)'
        },
      ],
    },

    options: {
    
      scales: {
        r: {
          ticks: {
            display: false,
            stepSize:8000
          },
          grid: {
            display: true,
            lineWidth: 2,
            color: "#B0B0B0",
            borderDash: [5, 5],
            angleLines: {
              display: true,
              color: "#CCC",
              count: 5
            },
          },
          pointLabels: {
            fontSize: 40, // 항목 레이블 폰트 크기 설정 (수정)
            font: {
            weight: 'bold' // 글자 굵게 설정
          }
          },
        },
      },	
      plugins: {
        legend: {
          display: true,
          position: 'top',
        },
        title: {
          display: true,
          fontSize: 140,
        },
        tooltip: {
          enabled: true,
        },
      },
    },
  });
}

// 페이지 로드 시 데이터를 전달하고 차트 생성
loadAssetData();
