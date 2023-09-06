<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Topic Listing Bootstrap 5 Template</title>
<!-- CSS FILES -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700&family=Open+Sans&display=swap"
	rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-icons.css" rel="stylesheet">
<link href="css/templatemo-topic-listing.css" rel="stylesheet">
<link href="css/custom.css" rel="stylesheet">
</head>
<body id="top">
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
						<li class="nav-item"><a class="nav-link click-scroll"
							href="#section_1">실버타운</a></li>
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


		<!-- 메인 바디 -->

		<div
			style="margin-top: 80px; display: flex; justify-content: space-around;">
			<div class="profile_inner">
				<a href="#" onclick="changeImage()" class="photo"> <img
					src="https://static.nid.naver.com/images/web/user/default.png"
					width="84" height="84" alt="프로필 이미지"> <span
					class="photo_edit"></span>
				</a>
				<div class="profile">
					<p class="useid">이름 들어갈 자리</p>
					<p class="usemail">아이디 들어갈 자리</p>
				</div>
				<div class="alarm_area">
					<a href="https://talk.naver.com/ct/wc4bsu#nafullscreen"
						onclick="nclk(this,'nid.talktalkcheck','','',event)"> <span
						class="alarm_text">새로운 알림</span>
					</a> <a href="https://talk.naver.com/ct/wc4bsu#nafullscreen"
						onclick="nclk(this,'nid.talktalkcheck','','',event)"> <span
						class="alarm_more">+63</span>
					</a>
				</div>
			</div>


			<div class="info_box">
				<div class="base_box">
					<a href="/user2/help/myInfoV2?m=viewProfile&amp;lang=ko_KR"
						class="title" onclick="nclk(this,'nid.myprofilego','','',event)">

						<span class="title_text">내프로필</span> <!-- 						<button type="button" class="btn_edit"
							onclick="showMyLetterEmailChangePopUp()">

						</button> -->
					</a>

					<ul class="base_row">
						<li>
							<div class="row_item name ">
								<span class="item_text"></span>
								<!-- <button type="button" class="btn_edit" onclick="changeName()">
							<span class="text">이름 수정</span>
						</button> -->
							</div>
						</li>

						<li>
							<div id="phoneNoRegDiv" class="row_item phone ">
								<span id="phoneNoRegSpan" class="item_text">
									</span>
								<!-- <button type="button" id="phoneNoRegBtn" class="btn_edit"
							onclick="showPhoneNumberChangePopUp()">
							<span id="phoneNoRegBtnTxt" class="text">수정</span>
						</button> -->
								<table>
									<tr>
										<td>User ID:</td>
										<td>${user.userId}</td>
									</tr>
									<tr>
										<td>User Name:</td>
										<td>${user.userName }</td>
									</tr>
									<tr>
										<td>User Age:</td>
										<td>${user.userAge }</td>
									</tr>
								</table>
							</div>
						</li>


					</ul>

				</div>


				<div class="asset_box">
					<a href="/user2/help/myInfoV2?m=viewProfile&amp;lang=ko_KR"
						class="title" onclick="nclk(this,'nid.myprofilego','','',event)">
						<span class="title_text">자산정보</span>

					</a>

					<ul class="base_row">
						<li>
							<div id="phoneNoRegDiv" class="row_item phone ">
								<span id="phoneNoRegSpan" class="item_text"> 순자산</span>

							</div>
						</li>

						<li>
							<div id="phoneNoRegDiv" class="row_item phone ">
								<span id="phoneNoRegSpan" class="item_text"> 금융자산</span>

							</div>
						</li>

						<li>
							<div id="phoneNoRegDiv" class="row_item phone ">
								<span id="phoneNoRegSpan" class="item_text"> 실물자산</span>

							</div>
						</li>
						<li>
							<div id="phoneNoRegDiv" class="row_item phone ">
								<span id="phoneNoRegSpan" class="item_text"> 부채</span>

							</div>
						</li>
						<li>
							<div id="phoneNoRegDiv" class="row_item phone ">
								<span id="phoneNoRegSpan" class="item_text"> 월 소득</span>

							</div>
						</li>
						<li>
							<div id="phoneNoRegDiv" class="row_item phone ">
								<span id="phoneNoRegSpan" class="item_text"> 연금</span>

							</div>
						</li>
						<li>
							<div id="phoneNoRegDiv" class="row_item phone ">
								<span id="phoneNoRegSpan" class="item_text"> 입주 예상 나이</span>

							</div>
						</li>
						<li>
							<div id="phoneNoRegDiv" class="row_item phone ">
								<span id="phoneNoRegSpan" class="item_text"> 희망 거주 기간</span>

							</div>
						</li>
						<li>
							<div id="phoneNoRegDiv" class="row_item phone ">
								<span id="phoneNoRegSpan" class="item_text"> 나이</span>

							</div>
						</li>

					</ul>
				</div>
			</div>
		</div>

		<!-- JAVASCRIPT FILES -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.bundle.min.js"></script>
		<script src="js/jquery.sticky.js"></script>
		<script src="js/click-scroll.js"></script>
		<script src="js/custom.js"></script>

	</main>
</body>
</html>