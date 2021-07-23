<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>


<div class="row">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-1 col-lg-2"></div>
			<div class="col-md-10 col-lg-8">

				<!-- 검색 카테고리 메뉴 -->
				<div class="row">
					<div class="col-md-3 col-lg-2">
					
						<div class="flex-shrink-0 p-3 bg-white">
					    <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
					      <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
					      <span class="fs-5 fw-semibold">카테고리</span>
					    </a>
					    <ul class="list-unstyled ps-0">
					      <li class="mb-1">
					        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">
					          대주제1
					        </button>
					        <!-- class="collapse show" 하위 보이게 하기 -->
					        <div class="collapse" id="home-collapse">
					          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1">
					            <li><a href="#" class="link-dark rounded">소주제1</a></li>
					            <li><a href="#" class="link-dark rounded">소주제2</a></li>
					            <li><a href="#" class="link-dark rounded">소주제3</a></li>
					          </ul>
					        </div>
					      </li>
					      <li class="mb-1">
					        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
					          대주제2
					        </button>
					        <div class="collapse" id="dashboard-collapse">
					          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1">
					            <li><a href="#" class="link-dark rounded">소주제1</a></li>
					            <li><a href="#" class="link-dark rounded">소주제2</a></li>
					            <li><a href="#" class="link-dark rounded">소주제3</a></li>
					            <li><a href="#" class="link-dark rounded">소주제4</a></li>
					          </ul>
					        </div>
					      </li>
					      <li class="mb-1">
					        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
					          대주제3
					        </button>
					        <div class="collapse" id="orders-collapse">
					          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1">
					            <li><a href="#" class="link-dark rounded">소주제1</a></li>
					            <li><a href="#" class="link-dark rounded">소주제2</a></li>
					            <li><a href="#" class="link-dark rounded">소주제3</a></li>
					            <li><a href="#" class="link-dark rounded">소주제4</a></li>
					          </ul>
					        </div>
					      </li>
					      <li class="border-top my-3"></li>
					      <li class="mb-1">
					        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
					          Account
					        </button>
					        <div class="collapse" id="account-collapse">
					          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1">
					            <li><a href="#" class="link-dark rounded">New...</a></li>
					            <li><a href="#" class="link-dark rounded">Profile</a></li>
					            <li><a href="#" class="link-dark rounded">Settings</a></li>
					            <li><a href="#" class="link-dark rounded">Sign out</a></li>
					          </ul>
					        </div>
					      </li>
					    </ul>
					  </div>
						
					</div>
					
					<!-- 검색 카테고리 메뉴 끝-->
					
					<!-- 검색 결과 -->
					<div class="col-md-9 col-lg-10">
					
					<ul class="nav nav-pills">
					  <li class="nav-item">
					    <h4 class="green_color">취미</h4>
					  </li>
					  <li class="nav-item dropdown">
					    <button type="button" class="btn dropdown-toggle btn-outline-light green_background" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">검색옵션</button>
					    <ul class="dropdown-menu">
					      <li><a class="dropdown-item" href="#">인기순</a></li>
					      <li><a class="dropdown-item" href="#">최신순</a></li>
					    </ul>
					  </li>
					  <li class="nav-item dropdown">
					    <button type="button" class="btn dropdown-toggle btn-outline-light green_background" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">난이도</button>
					    <ul class="dropdown-menu">
					      <li><a class="dropdown-item" href="#">고급</a></li>
					      <li><a class="dropdown-item" href="#">중급</a></li>
					      <li><a class="dropdown-item" href="#">초급</a></li>
					    </ul>
					  </li>
					</ul>

						<div style="overflow:hidden;">
								<c:forEach var="popular" items="${popularHobby}">
								<div class="col-lg-3 col-md-4 col-sm-6" style="float:left;">
									<div class="featured__item">
										<div class="featured__item__pic set-bg" data-setbg="/resources/img/featured/feature-2.jpg">
											<ul class="featured__item__pic__hover">
												<li><a href="#"><i class="fa fa-heart"></i></a></li>
												<li><a href="#"><i class="fa fa-retweet"></i></a></li>
												<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
											</ul>
										</div>
										<div class="featured__item__text">
											<h6><a href="#">${popular.hobby_title}</a></h6>
											<h5>${popular.hobby_writer}</h5>
										</div>
									</div>
								</div>
								</c:forEach>
								
								
								
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 검색 결과 끝 -->

			<div class="col-md-1 col-lg-2"></div>
		</div>
	</div>




<%@ include file="../include/footer.jsp" %>