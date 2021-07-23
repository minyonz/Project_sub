<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">								
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">								
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>								
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>								
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">


<title>Blog Home - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/css/styles.css" rel="stylesheet" />
<style>
.green_background {
	background-color: rgb(31, 94, 67);
}
.green_color {
	color:  rgb(31, 94, 67);
}
.white_color {
	color: white;
}
.orange_background {
	background-color:  rgb(231, 112, 92);
}
.orange_color {
	color:  rgb(231, 112, 92);
}
</style>
<script>
$(document).ready(function() {
	$("#frmSearch").submit(function() {
		console.log($(this));
		return false;
	});
	
	
});
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">

				<div class="row">
					<div class="col-md-12 green_background">
						<div class="row">
							<div class="col-md-2"></div>
							<div class="col-md-8">
								
								<!-- 메뉴바 -->
								<nav class="navbar navbar-expand-lg navbar-dark" style="margin-bottom: 30px;">
									<div>
										<a class="navbar-brand" href="/main/mainHome" style="display:none">꼼지락</a>
										<button class="navbar-toggler" type="button"
											data-bs-toggle="collapse"
											data-bs-target="#navbarSupportedContent"
											aria-controls="navbarSupportedContent" aria-expanded="false"
											aria-label="Toggle navigation">
											<span class="navbar-toggler-icon"></span>
										</button>
										<div class="collapse navbar-collapse"
											id="navbarSupportedContent">
											<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
												<li class="nav-item"><a class="nav-link" href="/main/mainHome">홈</a></li>
												<li class="nav-item"><a class="nav-link" href="/main/mainHobby">취미</a></li>
												<li class="nav-item"><a class="nav-link" href="/main/mainEvent">이벤트</a></li>
												<li class="nav-item"><a class="nav-link" href="/main/mainAboutUs">소개</a></li>
												<li class="nav-item"><a class="nav-link" href="/workroom/main">내 작업실</a></li>
												<li class="nav-item"><a class="nav-link" href="/mypage/login">로그인</a></li>
												
												
												<li class="nav-item dropdown">
												<div class="dropdown">
												  <a class="btn nav-link" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
												   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 16 16">
													  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
													</svg>
												  </a>
												  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
												    <li><a class="dropdown-item" href="#">알림내용</a></li>
												    <li><a class="dropdown-item" href="#">알림내용</a></li>
												    <li><a class="dropdown-item" href="#">알림내용</a></li>
												    <li><a class="dropdown-item" href="#">알림내용</a></li>
												    <li><a class="dropdown-item" href="#">알림내용</a></li>
												    <li><a class="dropdown-item" href="#">알림내용</a></li>
												    <li><hr class="dropdown-divider"></li>
												    <li><a class="dropdown-item" href="#">알림함</a></li>
												  </ul>
												</div>
												</li>
												
												<li class="nav-item dropdown ml-md-auto">
												<div class="dropdown">
												  <a class="btn nav-link" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
												   <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
															fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
														<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
													</svg>
												  </a>
												  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
												    <li><a class="dropdown-item" href="/mypage/infoForm">마이페이지</a></li>
												    <li><a class="dropdown-item" href="#">쪽지함</a></li>
												    <li><a class="dropdown-item" href="#">1:1문의</a></li>
												    <li><hr class="dropdown-divider"></li>
												    <li><a class="dropdown-item" href="#">로그아웃</a></li>
												  </ul>
												</div>
												</li>
												
											</ul>
										</div>
									</div>
								</nav>
								<!-- 메뉴바 끝 -->
							
								<!-- 로고 -->
								<header class="py-3 mb-4">
								  <div class="container d-flex flex-wrap justify-content-center">
								    <a href="/main/mainHome" class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto text-dark text-decoration-none">
								      <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
								      <span class="fs-4 white_color">꼼지락</span>
								    </a>
								  </div>
								</header>
								<!-- 로고 끝 -->

								<!-- 검색 -->
								<form id="frmSearch" class="col-12 col-lg-10 mb-12 mb-lg-10 mx-auto"
										action="/main/mainSearch" method="get">
								<div class="input-group" style="margin-bottom: 50px">
									
									<select name="category" class="btn btn-light orange_background white_color shadow bg-body"
										data-bs-toggle="dropdown" aria-expanded="false">
										<option class="dropdown-item" value="ca">카테고리</option>
										<option class="dropdown-item" value="1">1</option>
										<option class="dropdown-item" value="2">2</option>
										<option class="dropdown-item" value="3">3</option>
										<option class="dropdown-item" value="4">4</option>
									</select>
									<button id="btnCategory" class="btn dropdown-toggle btn-outline-light orange_background shadow bg-body"
										type="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</button>
									<ul class="dropdown-menu">
										<li value="1"><a class="dropdown-item" href="#">1</a></li>
										<li value="2"><a class="dropdown-item" href="#">2</a></li>
										<li value="3"><a class="dropdown-item" href="#">3</a></li>
										<li value="4"><hr class="dropdown-divider"></li>
										<li value="5"><a class="dropdown-item" href="#">4</a></li>
									</ul>
									
									<input id="searchText" type="text" class="form-control shadow bg-body" aria-label="Text input with dropdown button"
									placeholder="나의 취미를 찾아보세요">
									
									<button type="submit" class="btn btn-outline-light orange_background shadow bg-body rounded" id="button-addon2">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
										  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
										</svg>
										<span class="visually-hidden">검색</span>
									</button>
									</div>
								</form>
								<!-- 검색 끝 -->
								
								</div>
								<div class="col-md-2"></div>
							</div>
						</div>
					</div>
				</div>
			</div>