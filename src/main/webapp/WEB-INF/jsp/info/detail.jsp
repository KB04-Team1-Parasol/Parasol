<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Topic Listing Contact Page</title>
<!-- CSS FILES -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700&family=Open+Sans&display=swap"
	rel="stylesheet">
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/bootstrap-icons.css" rel="stylesheet">
<link href="/css/templatemo-topic-listing.css" rel="stylesheet">
<link href="/css/custom.css" rel="stylesheet">
</head>
<body id="top">
	<main>
		<!-- header include -->
		<jsp:include page="/WEB-INF/jsp/common/header2.jsp" />

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