
// 데이터를 전달하는 함수
function loadAssetData() {
  // 데이터를 이용하여 차트를 생성하는 코드 작성
  var ctx = document.getElementById("myChart").getContext("2d");
  var cash = parseInt(pureAsset) - parseInt(realAsset) - parseInt(finAsset) + parseInt(debt);
  
  var myChart = new Chart(ctx, {
    type: "doughnut",
    data: {
      labels: ["금융자산", "실물자산","현금","부채"],
      datasets: [
        {
          data: [finAsset, realAsset, cash, debt],
          backgroundColor: ["#F6D0D3", "#EBA592", "#DF9958","#463E64"],
        },
      ],
    },
  });
}

// 페이지 로드 시 데이터를 전달하고 차트 생성
loadAssetData();