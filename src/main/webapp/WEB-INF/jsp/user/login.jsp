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
<jsp:include page="/WEB-INF/jsp/settings/css.jsp" />
</head>

<body class="topics-listing-page" id="top">
	<main>
		<!-- header include -->

		<jsp:include page="/WEB-INF/jsp/common/header2.jsp"/>

		
		<section class="user-section-padding section-bg justify-content-center align-items-center">

			<div class="container">
				<div>

					<div class="col-lg-12 col-12">
						<h3 class="mb-4 pb-2 text-center">로그인 정보를 입력하세요</h3>
					</div>
					<div class="col-lg-12 col-6">

						<form action="login" method="post"
							class="custom-form contact-form" role="form">
							<div class="col-lg-4 col-12 mx-auto">
								<div class="form-floating">
									<input type="text" name="user_id" class="form-control" required />
									<label for="floatingInput">ID</label>

								</div>
							</div>
							<div class="col-lg-4 col-12 mx-auto">
								<div class="form-floating">
									<input type="password" name="user_pw" class="form-control"
										required /> <label for="floatingInput">Password</label>
								</div>
							</div>
							<div class="row justify-content-center">
								<div class="col-lg-2 col-6">
									<button type="submit" class="form-control">Login</button>
								</div>
								<div class="col-lg-2 col-6">
									<a href="signup" class="form-control btn" id="signupBtn">Sign
										Up</a>
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