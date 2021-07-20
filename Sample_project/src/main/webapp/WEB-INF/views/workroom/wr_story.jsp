<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<script>

</script>
<!-- 스토리 목록 폼 -->
<div class="container-fluid" style="background: #F5F5F5">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-3">
					<div class="checkout__order">
						<!-- 유저 카드 프로필 -->
						<div class="box" style="margin: 12px auto;">
							<a href="/workroom/wr_main"><img class="profile" src="/resources/img/test/littleduck.png"
								alt="profile image" style="width: 100%; text-align: center"></a>
						</div>
						<div class="card-body">
							<h4 class="text-center">user1</h4>
							<p class="card-text text-center">안녕하세요</p>
							<div style="text-align: center;">
								<div style="display: inline-block;">
									<p style="margin-bottom: -5px">팔로워</p>
									<p style="text-align: center">5</p>
								</div>
								<div style="display: inline-block;">
									<p style="margin: -2px">
										<img src="/resources/img/test/minus.png" height="25px">
									</p>
									<p>
										<img src="/resources/img/test/minus.png" height="25px">
									</p>
								</div>
								<div style="display: inline-block;">
									<p style="margin-bottom: -5px">좋아요</p>
									<p style="text-align: center">5</p>
								</div>
							</div>
							<div style="text-align: center;">
								<a href="#" class="btn btn-primary">팔로우</a> <a href="#"
									class="btn btn-primary">쪽지</a> <a href="#"
									class="btn btn-primary">글쓰기</a>
							</div>
						</div>

					</div>
					<!-- 카테고리 -->
					<div class="checkout__order">
						<div class="blog__sidebar__item" style="margin-left: 40px;">
							<ul>
								<li><a href="#">소개</a></li>
								<li><a href="/workroom/wr_hobby">꼼지락</a></li>
								<li><a href="#">Story</a></li>
								<li><a href="/workroom/wr_mbm">MadeByMe</a></li>
								<li><a href="#">피드</a></li>
							</ul>
						</div>
					</div>
					<div>
						<input type="text"
							style="border: 1px solid #E5E8E8; height: 30px;">
						<button type="button"
							style="border: none; background: none; padding: 0;">
							<img src="/resources/img/test/loupe.png" height="17px">
						</button>
					</div>
				</div>
				<!-- 간단 카드 보여주기 -->
				<div class="col-md-9">
					<div class="checkout__order">
						<div class="workroom_box row" style="height: 39px;">
							<h4>Story detail</h4>
						</div>
						<div class="workroom_box">
							<hr>
							<div class="container-fluid">
								<c:forEach var="storyVo" items="${list}">
								<div class="row">
									<div class="col-md-10" style="padding: 0px; margin: auto;" >
										<p style="font-size: 14px; margin: 10px" id="story_detail">
										<a href="/workroom/wr_story_detail?st_no=${storyVo.st_no}">
										${storyVo.st_content}</a><br>
										<a class="fa fa-heart-o" href="#" style="margin-right:5px"> ${storyVo.st_like_count}</a>
										<a class="fa fa-comment-o" href="#"> ${storyVo.st_c_count}</a>
										</p>								
									</div>
									<div class="col-md-2" style="padding: 0px;">
										<img src="/resources/img/test/duck.png" width="100px">
									</div>
								</div>
								<hr>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>