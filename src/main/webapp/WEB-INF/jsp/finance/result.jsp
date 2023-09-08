<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>설문 결과 페이지, 계산 적용 전 결과 값 받아오는 것 확인</h1>

	<h1>나이: ${personal.age}</h1>
	<h1>수입: ${personal.income}</h1>
	<h1>금융비중: ${personal.age}</h1>
	<h1>투자비중: ${personal.income}</h1>
	<h1>이해도: ${personal.understand}</h1>
	<h1>이익손실어디까지감당가능: ${personal.lossprofit}</h1>
	<h1>이해도: ${personal.derivatives}</h1>
	<h1>계산결과: ${personal.result}</h1>
</body>
</html>