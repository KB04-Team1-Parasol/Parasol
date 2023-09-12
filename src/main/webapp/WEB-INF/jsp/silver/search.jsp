<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실버타운 검색</title>
<!-- CSS FILES -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700&family=Open+Sans&display=swap"
	rel="stylesheet">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap-icons.css" rel="stylesheet">
<link href="../css/templatemo-topic-listing.css" rel="stylesheet">
<link href="../css/custom.css" rel="stylesheet">
</head>
<body>
	<main>
		<!-- header include -->
		<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
	</main>

	<h1>실버타운 검색</h1>
	<br>
	<section class="section-padding">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-40 col-12 mb-4 mb-lg-0">
					<div class="custom-block bg-white shadow-lg">
						<form action="search" method="post">
							장소이름: <input type="text" name="stName"> <br>
							도시: <input type="text" name="city"> <br>
							크기(대형:1,중형:2,소형:3): <input type="number" name="stScale"> <br>
							세대수: <input type="number" name="stdOccupancy"> <br>
							주거타입(도심:1,근교:2,전원:3): <input type="number" name="stType"> <br>
							최대 보증금: <input type="number" name="stdDeposit"> <br>
							최대 월세: <input type="number" name="stdMonthlyCost"> <br>
							계약 기간: <input type="number" name="stPeriod"> <br>
							평수: <input type="number" name="stdRoomSize"> <br>
							<input type="submit" value="검색">		
						</form>
					</div>
				</div>
			</div>	
		</div>
	</section>
	
	<table>
		<tr>
			<th>타운이름</th>
			<th>방타입</th>
			<th>보증금</th>
			<th>월세</th>
			<th>이미지</th>
		</tr>
		<c:forEach items="${responseDto}" var="sliver">
			<tr>
				<td>${sliver.townName}</td>
				<td>${sliver.typeName}</td>
				<td>${sliver.deposit}</td>
				<td>${sliver.monCost}</td>
				<td>${sliver.imgUrl}</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>