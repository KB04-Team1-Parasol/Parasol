<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<nav class="navbar navbar-expand-lg">
	<div class="container">
		<a class="navbar-brand" href="/"> <i class="bi-back"></i>
			<span>Parasol</span>
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
						<li><a class="dropdown-item" href="/silver/search">실버타운 검색</a></li>
						<li><a class="dropdown-item" href="/silver/custom">맞춤 실버타운 찾기</a></li>
					</ul>
				</li>
				<li class="nav-item"><a class="nav-link click-scroll"
					href="#section_2">금융상품</a></li>
				<li class="nav-item"><a class="nav-link click-scroll"
					href="information">Information</a></li>
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
						<li><a class="dropdown-item" href="/">Topics Listing</a></li>
						<li><a class="dropdown-item" href="/">Contact Form</a></li>
					</ul>
				</li>
			</ul>
			<div class="d-none d-lg-block">
				<c:choose>
					<c:when test="${empty sessionScope.tokenDto}">
						<a href="user/login" class="navbar-icon bi-person smoothscroll"></a>
					</c:when>
					<c:otherwise>
						<a href="user/myinfo" class="navbar-icon bi-person smoothscroll"></a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</nav>