<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/workroomSide.jsp" %>
<!-- 간단 카드 보여주기 -->
<div class="col-md-9">
	<!-- 소개 -->
	<div class="checkout__order">
		<div class="workroom_box">
			<h4>${workroomVo.wr_name}</h4>
		</div>
		<div class="workroom_box">
			<hr>
			<p>${workroomVo.wr_intro}</p>
		</div>
	</div>
	<!-- 취미 -->
	<div class="checkout__order" id="hobby">
		<div class="workroom_box row" style="height: 39px;">
			<h4>꼼지락</h4>
			<p style="text-align:right;">
			<a href="/workroom/hobby/${page_id}" class="btn btn-outline-dark btn-sm" style="margin-left:700px;">더보기</a></p>
		</div>
		<hr>
		<div>
			<div class="row">
				<div class="categories__slider owl-carousel">
					<c:forEach begin="0" end="3" var="hobbyVo" items="${hobbyList}">
						<div class="col-lg-3">
							<div class="categories__item set-bg"
								data-setbg="/resources/img/test/sample06.jpg">
							</div>
							<div class="product__item__text">
                           		<h6><a href="#">${hobbyVo.hobby_title}</a></h6>
                         	</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- 스토리 -->
	<div class="checkout__order" id="story">
		<div class="workroom_box row" style="height: 39px;">
			<h4>Story</h4>
			<p style="text-align:right;">
				<c:if test="${user_id == page_id}">
					<a href="/story/write" class="fa fa-pencil" style="margin-top: 5px; margin-left: 10px;"></a>
				</c:if>
				<a href="/story/list/${page_id}" class="btn btn-outline-dark btn-sm" style="margin-left:700px;">더보기</a>
		</div>
		<div class="workroom_box">
			<hr>
			<div class="container-fluid">
				<c:forEach begin="0" end="2" var="storyVo" items="${storyList}">
					<div class="row">
						<div class="col-md-10" style="padding: 0px; margin: auto;">
							<p style="font-size: 14px; margin: 10px" class="story_detail">
								<a href="/story/detail/${page_id}?st_no=${storyVo.st_no}">${storyVo.st_content}</a><br> 
								<a class="fa fa-heart-o" href="/story/detail/${page_id}?st_no=${storyVo.st_no}" 
									style="margin-right: 5px"> ${storyVo.st_like_count}</a> 
								<a class="fa fa-comment-o" href="/story/detail/${page_id}?st_no=${storyVo.st_no}">
									${storyVo.st_c_count}</a>
							</p>
						</div>
						<div class="col-md-2" style="padding: 0px;">
							<c:if test="${storyVo.st_img != null}">
								<img src="/displayImage?fileName=${storyVo.st_img}" width="100px">
							</c:if>
						</div>
					</div>
					<hr>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- mbm -->
	<div class="checkout__order" id="mbm">
		<div class="workroom_box row" style="height: 39px;">
			<h4>MadeByMe</h4>
			<a href="/workroom/mbm/${page_id}">더보기</a>
		</div>
		<hr>
		<div>
			<div class="row">
				<div class="categories__slider owl-carousel">
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="/resources/img/test/sample08.jpg">
							<h5>
								<a href="#">test1</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="/resources/img/test/sample06.jpg">
							<h5>
								<a href="#">test2</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="/resources/img/test/sample07.jpg">
							<h5>
								<a href="#">test3</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="/resources/img/test/sample06.jpg">
							<h5>
								<a href="#">test4</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="/resources/img/test/sample07.jpg">
							<h5>
								<a href="#">test5</a>
							</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 피드 -->
	<div class="checkout__order" id="feed">
		<div class="workroom_box">
			<h4>북마크</h4>
		</div>
		<div class="workroom_box">
			<hr>
			<p>안녕하세요. 북마크북마크</p>
		</div>
	</div>
</div>
</div>
</div>
<div class="col-md-2"></div>
</div>
</div>

<%@ include file="../include/footer.jsp"%>