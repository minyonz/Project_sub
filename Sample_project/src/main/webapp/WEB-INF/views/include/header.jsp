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
<link href="css/styles.css" rel="stylesheet" />
<style>
.green_background {
	background-color: rgb(31, 94, 67);
}
.green_color {
	color:  rgb(31, 94, 67);
}
.wite_text {
	color: white;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">

				<!-- navbar -->
				<div class="row">
					<div class="col-md-12 green_background">
						<div class="row">
							<div class="col-md-2"></div>
							<div class="col-md-8">

								<nav class="navbar navbar-expand-lg navbar-dark"
									style="margin-bottom: 70px;">
									<div class="container">
										<a class="navbar-brand" href="/main/mainHome3">꼼지락</a>
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
												<li class="nav-item">
												<a class="nav-link" href="/main/mainHobby">취미</a></li>
												<li class="nav-item"><a class="nav-link" href="#">이벤트</a></li>
												<li class="nav-item"><a class="nav-link" href="#">소개</a></li>
												<li class="nav-item dropdown ml-md-auto">
												<li class="nav-item dropdown ml-md-auto">
												<a class="nav-link " href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown">
													<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
															fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
														<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
													</svg>
												</a>
													<div class="dropdown-menu dropdown-menu-right"
														aria-labelledby="navbarDropdownMenuLink">
														<a class="dropdown-item" href="#">Action</a>
														<a class="dropdown-item" href="#">Another action</a>
															<a class="dropdown-item" href="#">마이페이지</a>
														<div class="dropdown-divider"></div>
														<a class="dropdown-item" href="#">로그아웃</a>
													</div></li>
											</ul>
										</div>
									</div>
								</nav>



								<!-- search -->
								<div class="input-group"
									style="padding-left: 150px; padding-right: 150px; margin-bottom: 50px">
									<button class="btn dropdown-toggle btn-outline-light"
										type="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</button>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="#">Action</a></li>
										<li><a class="dropdown-item" href="#">Another action</a></li>
										<li><a class="dropdown-item" href="#">Something else here</a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item" href="#">Separated link</a></li>
									</ul>
									<input type="text" class="form-control" aria-label="Text input with dropdown button">
									<button class="btn btn-outline-light" type="button" id="button-addon2">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
										  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
										</svg>
										<span class="visually-hidden">검색</span>
									</button>
								</div>
								<div class="col-md-2"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>