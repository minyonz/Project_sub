<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/workroomSide.jsp"%>
<!-- 간단 카드 보여주기 -->
<div class="col-md-9">
	<!-- 검색결과 -->
	<h3 class="text-center">${keyword}의검색결과 입니다.</h3>
	<div class="checkout__order" id="hobby">
		<div class="workroom_box row" style="height: 39px;">
			<h4>취미</h4>
		</div>
		<hr>
		<div class="row featured__filter">
		<c:forEach var="hobbyVo" items="${searchHobbyList}">
			<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
				<div class="featured__item">
					<div class="featured__item__pic set-bg"
						data-setbg="/resources/img/test/sample06.jpg">
						<ul class="featured__item__pic__hover">
							<li><a href="#"><i class="fa fa-heart"></i></a></li>
							<li><a href="#"><i class="fa fa-retweet"></i></a></li>
							<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
						</ul>
					</div>
					<div class="featured__item__text">
						<h6>
							<a href="#">${hobbyVo.hobby_title}</a>
						</h6>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	<!-- 스토리 -->
	<div class="checkout__order" id="story">
		<div class="workroom_box row" style="height: 39px;">
			<h4>Story</h4>
		</div>
		<hr>
		<div class="container-fluid">
			<c:forEach var="storyVo" items="${searchStoryList}">
				<div class="row">
					<div class="col-md-10" style="padding: 0px; margin: auto;">
						<p style="font-size: 14px; margin: 10px" class="story_detail">
							<a href="/story/detail?st_no=${storyVo.st_no}">${storyVo.st_content}</a><br> 
							<a class="fa fa-heart-o" href="#" style="margin-right: 5px"> ${storyVo.st_like_count}</a>
							<a class="fa fa-comment-o" href="/story/detail?st_no=${storyVo.st_no}"> ${storyVo.st_c_count}</a>
						</p>
					</div>
					<div class="col-md-2" style="padding: 0px;">
						<img src="/resources/img/test/duck.png" width="100px">
					</div>
				</div>
				<hr>
			</c:forEach>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>