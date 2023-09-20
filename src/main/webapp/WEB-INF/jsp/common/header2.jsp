<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	String home = "";
	String silver = "";
	String finance = "";
	String info = "";
	String user = "";
	
	String[] urlArr = request.getRequestURI().toString().split("/");
	String url = urlArr[3];
	switch(url){
		case "silver":
			silver = "active";	
			break;
		case "finance":
			finance = "active";	
			break;
		case "info":
			info = "active";	
			break;
		case "user":
			user = "active";	
			break;
		default:
			home = "active";
			break;
	}
	
	request.setAttribute("m_home", home);
	request.setAttribute("m_silver", silver);
	request.setAttribute("m_finance", finance);
	request.setAttribute("m_info", info);
	request.setAttribute("m_user", user);
%>
<!DOCTYPE html>

<!-- Template Main CSS File -->
<link href="/css/header/main.css" rel="stylesheet">
<!-- ======= Header ======= -->
<div id="header" class="header d-flex align-items-center shadow-sm">
  <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
    <a href="/" class="logo d-flex align-items-center">
      <!-- Uncomment the line below if you also wish to use an image logo -->
      <!-- <img src="assets/img/logo.png" alt=""> -->
      <img src="/images/main/파라솔.png"><h1>Parasol<span>.</span></h1>
    </a>
    <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
    <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>
    <nav id="navbar" class="navbar_v2">
      <ul>
        <li><a href="/" class="${ m_home }">Home</a></li>
        <li class="dropdown"><a href="#" class="${ m_silver }"><span>실버타운</span> <i
              class="bi bi-chevron-down dropdown-indicator"></i></a>
          <ul>
            <li><a href="/silver/search">실버타운 검색</a></li>
            <li><a href="/silver/custom">맞춤 실버타운 찾기</a></li>
          </ul>
        </li>

        <li class="dropdown"><a href="#" class="${ m_finance }"><span>금융상품</span> <i
              class="bi bi-chevron-down dropdown-indicator"></i></a>
          <ul>
            <li><a href="/finance/deposit">예금 상품</a></li>
            <li><a href="/finance/saving">적금 상품</a></li>
            <li><a href="/finance/bond">채권 상품</a></li>
            <li><a href="/finance/personal">맞춤 상품</a></li>
          </ul>
        </li>

        <li><a href="/info/info" class="${ m_info }">정보</a></li>
        <li>
        	<c:choose>
				<c:when test="${empty sessionScope.tokenDto}">
					<li class="dropdown"><a href="#" class="${ m_user }"><span><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
			  				<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
			  				<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
						</svg></span> <i
              class="bi bi-chevron-down dropdown-indicator"></i></a>
          <ul>
            <li><a href="/user/login">로그인</a></li>
          </ul>
        </li>

				</c:when>
				<c:otherwise>			
						        <li class="dropdown"><a href="#" class="${ m_user }"><span><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
			  				<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
			  				<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
						</svg></span> <i
              class="bi bi-chevron-down dropdown-indicator"></i></a>
          <ul>
            <li><a href="/user/myinfo">자산정보 조회</a></li>
            <li><a href="/user/assetinput">자산정보 기입</a></li>
			<li><a href="../../../../user/logout" class="form-control btn" id="logoutBtn">로그아웃</a></li>
          </ul>
        </li>			
				</c:otherwise>
			</c:choose>
		</li>

      </ul>
    </nav><!-- .navbar -->

  </div>

</div><!-- End Header -->

<script src="/js/header/main.js"></script>

