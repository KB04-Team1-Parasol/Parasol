<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>파라솔 정보</title>
<jsp:include page="/WEB-INF/jsp/settings/css.jsp"/>
<link href="/css/common.css" rel="stylesheet">
</head>
<body id="top">
	<main>

		<!-- header include -->
		<jsp:include page="/WEB-INF/jsp/common/header2.jsp" />
		
		<header class="site-header-finance d-flex flex-column justify-content-center align-items-center">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-5 col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/index">HOME</a></li>
							<li class="breadcrumb-item active" aria-current="page">정보</li>
						</ol>
					</nav>

					<h2 class="text-white">추천 정보</h2>
				</div>
			</div>
		</div>
	</header>
		
		<!-- <nav class="navbar navbar-expand-lg">
			<div class="container">
				<a class="navbar-brand" href="/"> <i class="bi-back"></i> <span>Parasol</span>
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
						<li class="nav-item"><a class="nav-link click-scroll"
							href="index.html#section_1">Home</a></li>

						<li class="nav-item"><a class="nav-link click-scroll"
							href="index.html#section_2">Browse Topics</a></li>

						<li class="nav-item"><a class="nav-link click-scroll"
							href="index.html#section_3">How it works</a></li>

						<li class="nav-item"><a class="nav-link click-scroll"
							href="index.html#section_4">FAQs</a></li>

						<li class="nav-item"><a class="nav-link click-scroll"
							href="index.html#section_5">Contact</a></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#section_5"
							id="navbarLightDropdownMenuLink" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">Pages</a>

							<ul class="dropdown-menu dropdown-menu-light"
								aria-labelledby="navbarLightDropdownMenuLink">
								<li><a class="dropdown-item active"
									href="topics-listing.html">Topics Listing</a></li>

								<li><a class="dropdown-item" href="contact.html">Contact
										Form</a></li>
							</ul></li>
					</ul>

					<div class="d-none d-lg-block">
						<a href="#top" class="navbar-icon bi-person smoothscroll"></a>
					</div>
				</div>
			</div>
		</nav> -->


		<section class="section-padding">
			<div class="container">
				<div class="row">

					<div
						class="custom-block custom-block-topics-listing bg-white mb-5">
						<div class="col-lg-12 col-12 mt-3 mx-auto">
							<c:forEach var="information" items="${infoList.content}">
								<div
									class="custom-block custom-block-topics-listing bg-white shadow-lg mb-5">
									<div class="d-flex">
										<img src="${information.infoImg}"
											class="custom-block-image img-fluid"
											onerror="this.src='/images/main.jpg'">
										<!-- 이미지 및 기타 정보 출력 -->
										<div class="custom-block-topics-listing-info d-flex">
											<div>
												<a href="<c:url value="/info/info/${information.infoNo}"/>">
													<h5 class="mb-2">${information.infoTitle}</h5>
												</a>
												<p class="font-weight-bold mb-0">작성일:
													${information.infoDate}</p>
												<p class="mb-0" id="webkitText">${information.infoContent}</p>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>

						<div class="col-lg-12 col-12">
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center mb-0">
									<li
									class="page-item ${infoList.number == 0 ? 'disabled' : ''}">
									<a class="page-link" href="?page=${infoList.number}"
									aria-label="Previous"> <span aria-hidden="true">이전</span>
								</a>
								</li>
								
								   <c:forEach begin="1" end="${infoList.totalPages}"
										var="pageNumber">
										<li
											class="page-item ${pageNumber == infoList.number + 1 ? 'active' : ''}">
											<a class="page-link" href="?page=${pageNumber}">${pageNumber}</a>
										</li>
									</c:forEach>

									<li
									class="page-item ${infoList.number + 1 == infoList.totalPages ? 'disabled' : ''}">
									<a class="page-link" href="?page=${infoList.number + 2}"
									aria-label="Next"> <span aria-hidden="true">다음</span>
									</a>
									</li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</section>

	</main>

	<!-- footer include -->
	<jsp:include page="/WEB-INF/jsp/common/custom_footer.jsp"/>
		
	<!-- JAVASCRIPT FILES -->
	<jsp:include page="/WEB-INF/jsp/settings/js.jsp"/>
</body>
</html>