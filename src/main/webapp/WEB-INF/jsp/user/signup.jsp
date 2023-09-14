<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="description" content="">
<meta name="author" content="">

<title>Parasol Sign In</title>

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
		

		<section class="user-section-padding section-bg justify-content-center align-items-center">
			<div class="container">
				<div>

					<div class="col-lg-12 col-12">
						<h3 class="mb-4 pb-2 text-center">회원가입 정보를 입력하세요</h3>
					</div>
					<div class="col-lg-12 col-6">
						<form action="signup_action" method="post" class="custom-form contact-form"
							role="form">
								<input type="hidden" name="role" value="ROLE_USER">
								<input type="hidden" name="user_asset_status" value="INPUT_NO">
								<div class="col-lg-4 col-12 mx-auto">
									<div class="form-floating">
										<input type="text" name="user_id"
											class="form-control" required/>
										<label for="floatingInput">ID</label>
									</div>
								</div>
								<div class="col-lg-4 col-12 mx-auto">
									<div class="form-floating">
										<input type="password" name="user_pw"
											class="form-control" required/>
										<label for="floatingInput">Password</label>
									</div>
								</div>
								<div class="col-lg-4 col-12 mx-auto">
									<div class="form-floating">
										<input type="text" name="user_name"
											class="form-control" required/>
										<label for="floatingInput">이름</label>
									</div>
								</div>
								<div class="col-lg-4 col-12 mx-auto">
									<div class="form-floating">
										<input type="text" name="user_age"
											class="form-control" required/>
										<label for="floatingInput">나이(만)</label>
									</div>
								</div>
								<div class="row justify-content-center">
									<div class="col-lg-3 col-6">
										<button type="submit" class="form-control">회원가입</button>
									</div>
								</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</main>

	<!-- footer include -->
	<jsp:include page="/WEB-INF/jsp/common/custom_footer.jsp" />
	
	
	<!-- JAVASCRIPT FILES -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.bundle.min.js"></script>
	<script src="/js/jquery.sticky.js"></script>
	<script src="/js/custom.js"></script>

</body>
</html>