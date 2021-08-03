<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/workroomSide.jsp" %>
<!-- 간단 카드 보여주기 -->
<div class="col-md-9">
	<div class="checkout__order">
		<div class="workroom_box row" style="height: 39px;">
			<h4>꼼지락</h4>
			<select>
				<option>인기순</option>
				<option>최신순</option>
			</select>
		</div>
		<hr>
		<div class="row featured__filter">
		<c:forEach var="hobbyVo" items="${hobbyList}">
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
		<div class="product__pagination justify-content-center"
			style="display: flex;">
			<!-- 이전페이지(<-) -->
			<c:if test="${pagingDto.startPage != 1}">
				<a href="/workroom/hobby/${page_id}?page=${pagingDto.startPage - 1}&perPage=${pagingDto.perPage}">
					<i class="fa fa-long-arrow-left"></i>
				</a>
			</c:if>
			<c:forEach var="v" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
			<a 
				<c:choose>
					<c:when test="${v == pagingDto.page}">
						class="green_background" style="color: white;"
				 	</c:when>
				 	<c:otherwise>
				 		class="page-item"
					</c:otherwise>
				</c:choose>
			href="/workroom/hobby/${page_id}?page=${v}&perPage=${pagingDto.perPage}">${v}</a> 
			</c:forEach> 
			<!-- 다음페이지(->) -->
			<c:if test="${pagingDto.endPage < pagingDto.totalPage}">
			<a href="/workroom/hobby/${page_id}?page=${pagingDto.endPage + 1}&perPage=${pagingDto.perPage}">
				<i class="fa fa-long-arrow-right"></i>
			</a>
			</c:if>
		</div>
	</div>
</div>
<div class="col-md-2"></div>
</div>
</div>

<%@ include file="../include/footer.jsp"%>