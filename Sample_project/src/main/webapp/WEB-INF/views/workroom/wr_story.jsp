<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/workroomSide.jsp"%>
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
						<div class="col-md-10" style="padding: 0px; margin: auto;">
							<p style="font-size: 14px; margin: 10px" id="story_detail">
								<a href="/story/detail?st_no=${storyVo.st_no}">
									${storyVo.st_content}</a><br> 
									<a class="fa fa-heart-o" href="#" style="margin-right: 5px">
									${storyVo.st_like_count}</a> 
									<a class="fa fa-comment-o" href="/story/detail?st_no=${storyVo.st_no}">
									${storyVo.st_c_count}</a>
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
		<!-- 페이징 -->
		<div class="product__pagination justify-content-center"
			style="display: flex;">
			<c:if test="${storyPagingDto.startPage != 1}">
				<a href="/story/list/?page=${storyPagingDto.startPage - 1}&perPage=${storyPagingDto.perPage}">
					<i class="fa fa-long-arrow-left"></i>
				</a>
			</c:if>
			<c:forEach var="v" begin="${storyPagingDto.startPage}" end="${storyPagingDto.endPage}">
				<a href="/story/list/?page=${v}&perPage=${storyPagingDto.perPage}">${v}</a>
			</c:forEach>
			<c:if test="${storyPagingDto.endPage < storyPagingDto.totalPage}">
				<a href="/story/list/?page=${storyPagingDto.endPage + 1}&perPage=${storyPagingDto.perPage}">
					<i class="fa fa-long-arrow-right"></i>
				</a>
			</c:if>
		</div>
	</div>
</div>
</div>
<div class="col-md-2"></div>
</div>
</div>

<%@ include file="../include/footer.jsp"%>