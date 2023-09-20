// 숫자에 쉼표 추가하는 함수
function addCommasToNumber(number) {
  return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// 변수에 쉼표 추가
var formattedFinAsset = addCommasToNumber(finAsset);
var formattedRealAsset = addCommasToNumber(realAsset);
var formattedCash = addCommasToNumber(cash);
var formattedDebt = addCommasToNumber(debt);
var formattedMonthlyIncome = addCommasToNumber(monthlyIncome);

// jsp 변수로 설정
<%
  pageContext.setAttribute("formattedFinAsset", formattedFinAsset);
  pageContext.setAttribute("formattedRealAsset", formattedRealAsset);
  pageContext.setAttribute("formattedCash", formattedCash);
  pageContext.setAttribute("formattedDebt", formattedDebt);
  pageContext.setAttribute("formattedMonthlyIncome", formattedMonthlyIncome);
%>