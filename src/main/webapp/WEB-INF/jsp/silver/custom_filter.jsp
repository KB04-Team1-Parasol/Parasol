<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맞춤 실버타운 찾기</title>
<!-- css setting -->
<jsp:include page="/WEB-INF/jsp/settings/css.jsp"/>
<link href="/css/silver/list.css" rel="stylesheet" />
<link href="/css/common.css" rel="stylesheet">
</head>
<body id="top">
	<main>
	
		<!-- header include -->
		<jsp:include page="/WEB-INF/jsp/common/header2.jsp"/>
		
		<header
			class="site-header-finance d-flex flex-column justify-content-center align-items-center">
			<div class="container">
				<div class="row align-items-center">

					<div class="col-lg-5 col-12">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/index">HOME</a></li>

								<li class="breadcrumb-item active" aria-current="page">실버타운</li>
							</ol>
						</nav>

						<h2 class="text-white">맞춤 실버타운 찾기</h2>
					</div>

				</div>
			</div>
		</header>
		
		<section class="section-padding section_custum_filter">
			<div class="container">
            	<div class="row">
            		<form method="post" action="custom">
	            		<div class="col-lg-8 col-12 mt-3 mx-auto">
					        <div class="custom-block custom-block-topics-listing bg-white shadow-lg mb-5">
					        	<h5 class="text-center text-black">필터</h5>
					        	<hr>
					            <div class="text-center">
					                <!-- 이미지 및 기타 정보 출력 -->
					                <div class="custom-block-topics-listing-info d-flex mb-6">
					                    <div>
					                        <h5 class="mb-4 text-center">지역</h5>
					                        <input type="radio" class="btn-check" name="city" id="1" autocomplete="off" value="서울">
											<label class="btn btn-outline-dark mb-2" for="1">서울</label>
					                        <input type="radio" class="btn-check" name="city" id="2" autocomplete="off" value="경기">
											<label class="btn btn-outline-dark mb-2" for="2">경기</label>
					                        <input type="radio" class="btn-check" name="city" id="3" autocomplete="off" value="부산">
											<label class="btn btn-outline-dark mb-2" for="3">부산</label>
					                        <input type="radio" class="btn-check" name="city" id="4" autocomplete="off" value="대구">
											<label class="btn btn-outline-dark mb-2" for="4">대구</label>
					                        <input type="radio" class="btn-check" name="city" id="5" autocomplete="off" value="대전">
											<label class="btn btn-outline-dark mb-2" for="5">대전</label>
					                        <input type="radio" class="btn-check" name="city" id="6" autocomplete="off" value="세종">
											<label class="btn btn-outline-dark mb-2" for="6">세종</label>
					                        <input type="radio" class="btn-check" name="city" id="7" autocomplete="off" value="광주">
											<label class="btn btn-outline-dark mb-2" for="7">광주</label>
					                        <input type="radio" class="btn-check" name="city" id="8" autocomplete="off" value="강원">
											<label class="btn btn-outline-dark mb-2" for="8">강원</label>
					                        <input type="radio" class="btn-check" name="city" id="9" autocomplete="off" value="경북">
											<label class="btn btn-outline-dark mb-2" for="9">경북</label>
					                        <input type="radio" class="btn-check" name="city" id="10" autocomplete="off" value="경남">
											<label class="btn btn-outline-dark mb-2" for="10">경남</label>
					                        <input type="radio" class="btn-check" name="city" id="11" autocomplete="off" value="충북">
											<label class="btn btn-outline-dark mb-2" for="11">충북</label>
					                        <input type="radio" class="btn-check" name="city" id="12" autocomplete="off" value="충남">
											<label class="btn btn-outline-dark mb-2" for="12">충남</label>
					                        <input type="radio" class="btn-check" name="city" id="13" autocomplete="off" value="전북">
											<label class="btn btn-outline-dark mb-2" for="13">전북</label>
					                        <input type="radio" class="btn-check" name="city" id="14" autocomplete="off" value="전남">
											<label class="btn btn-outline-dark mb-2" for="14">전남</label>
					                        <input type="radio" class="btn-check" name="city" id="15" autocomplete="off" value="제주">
											<label class="btn btn-outline-dark mb-2" for="15">제주</label>
	      								</div>
					                </div>
					                <div class="custom-block-topics-listing-info">
					                    <div>
					                        <h5 class="mb-4 text-center">유형</h5>
					                        <input type="radio" class="btn-check" name="stType" id="s1" autocomplete="off" value="1">
											<label class="btn btn-outline-dark mb-2" for="s1">도심형</label>
					                        <input type="radio" class="btn-check" name="stType" id="s2" autocomplete="off" value="2">
											<label class="btn btn-outline-dark mb-2" for="s2">근교형</label>
					                        <input type="radio" class="btn-check" name="stType" id="s3" autocomplete="off" value="3">
											<label class="btn btn-outline-dark mb-2" for="s3">전원형</label>
	      								</div>
      								</div>
					            </div>
					        </div>
					        <div class="text-center">
								<button type="submit" class="btn btn-dark">검색</button>
					        </div>
						</div>
            		</form>
    			</div>
            </div>
        </section>
		
		<!-- footer include -->
		<jsp:include page="/WEB-INF/jsp/common/custom_footer.jsp"/>
		
		<!-- JAVASCRIPT FILES -->
		<jsp:include page="/WEB-INF/jsp/settings/js.jsp"/>
		
	</main>
</body>
</html>