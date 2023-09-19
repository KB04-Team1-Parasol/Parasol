<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>정보 상세</title>
<!-- CSS FILES -->
<jsp:include page="/WEB-INF/jsp/settings/css.jsp" />
<link href="/css/common.css" rel="stylesheet">
<link href="/css/finance/custom-fin.css" rel="stylesheet">
</head>

<body id="top">
	<main>
		<jsp:include page="/WEB-INF/jsp/common/header2.jsp" />
		<header
			class="site-header-finance d-flex flex-column justify-content-center align-items-center">
			<div class="container">
				<div class="row align-items-center">

					<div class="col-lg-5 col-12">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/index">HOME</a></li>

								<li class="breadcrumb-item active" aria-current="page">정보</li>
							</ol>
						</nav>

						<h2 class="text-white">상세정보</h2>
					</div>

				</div>
			</div>
		</header>



		<section class="section-padding">
			<div class="container col-lg-8 col-8">
				<div class="row">
					<div class="col-lg-12 col-12 text-center">
						<h2 class="mb-4">${infoDetail.infoTitle}</h2>
					</div>
					<div class="d-flex col-lg-12 col-12 justify-content-end">
						<p class="mb-0">작성일: ${infoDetail.infoDate}</p>
					</div>
					<div>
						<p class="mb-0" id="contentCustom">${infoDetail.infoContent}</p>
					</div>

				</div>
			</div>
		</section>

	</main>

	<!-- footer include -->
	<jsp:include page="/WEB-INF/jsp/common/custom_footer.jsp" />

	<!-- JAVASCRIPT FILES -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/custom.js"></script>

</body>
</html>