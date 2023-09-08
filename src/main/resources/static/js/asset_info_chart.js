
// 데이터를 전달하는 함수
function loadAssetData() {
  // 데이터를 이용하여 차트를 생성하는 코드 작성
  var ctx = document.getElementById("myChart").getContext("2d");
  var myChart = new Chart(ctx, {
    type: "doughnut",
    data: {
      labels: ["순자산", "금융자산", "실물자산","부채","월 소득","연금"],
      datasets: [
        {
          data: [pureAsset, finAsset, realAsset, debt, monthlyIncome, annuity],
          backgroundColor: ["#FF5733", "#3366FF", "#33FF57","#FFD700","#FF33A1","#800080"],
        },
      ],
    },
  });
}

// 페이지 로드 시 데이터를 전달하고 차트 생성
loadAssetData();