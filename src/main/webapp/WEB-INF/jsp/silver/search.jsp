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
		<nav class="navbar navbar-expand-lg">
			<div class="container">
				<a class="navbar-brand" href="index.html"> <i class="bi-back"></i>
					<span>Topic</span>
				</a>
				<div class="d-lg-none ms-auto me-4">
					<a href="#top" class="navbar-icon bi-person smoothscroll"></a>
				</div>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav ms-lg-5 me-lg-auto">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarLightDropdownMenuLink" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">실버타운</a>
							<ul class="dropdown-menu dropdown-menu-light"
								aria-labelledby="navbarLightDropdownMenuLink">
								<li><a class="dropdown-item" href="silver/search">실버타운
										검색</a></li>
								<li><a class="dropdown-item" href="silver/custom">맞춤
										실버타운 찾기</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link click-scroll"
							href="#section_2">금융상품</a></li>
						<li class="nav-item"><a class="nav-link click-scroll"
							href="#section_3">Information</a></li>
						<li class="nav-item"><a class="nav-link click-scroll"
							href="#section_4">FAQs</a></li>
						<li class="nav-item"><a class="nav-link click-scroll"
							href="#section_5">Contact</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarLightDropdownMenuLink" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">Pages</a>
							<ul class="dropdown-menu dropdown-menu-light"
								aria-labelledby="navbarLightDropdownMenuLink">
								<li><a class="dropdown-item" href="topics-listing.html">Topics
										Listing</a></li>
								<li><a class="dropdown-item" href="contact.html">Contact
										Form</a></li>
							</ul></li>
					</ul>
					<div class="d-none d-lg-block">
						<a href="#top" class="navbar-icon bi-person smoothscroll"></a>
					</div>
				</div>
			</div>
		</nav>
	</main>

	<h1>실버타운 검색</h1>
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
	<br>
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
		<input type="submit" value="제출">		
	</form>
</body>
</html>