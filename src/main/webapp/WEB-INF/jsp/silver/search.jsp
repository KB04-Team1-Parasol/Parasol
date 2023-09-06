<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실버타운 검색</title>
</head>
<body>
	<h1>실버타운 검색</h1>
	<table>
		<tr>
			<th>타운이름</th>
			<th>방타입</th>
			<th>보증금</th>
			<th>월세</th>
			<th>이미지</th>
		</tr>
		<c:forEach items="${reponseDto}" var="sliver">
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