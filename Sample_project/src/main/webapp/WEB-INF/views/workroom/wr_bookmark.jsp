<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/workroomSide.jsp" %>
<style>
.card {
  background: #fff;
  border-radius: 2px;
  display: inline-block;
  height: 320px;
  margin: 1rem;
  position: relative;
  width: 180px;
  border-radius: 10px;
}

.card-1 {
  box-shadow: 0 1px 1px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.14);
  transition: all 0.3s cubic-bezier(.25,.8,.25,1);
}

.card-1:hover {
  box-shadow: 0 10px 20px rgba(0,0,0,0.10), 0 5px 19px rgba(0,0,0,0.12);
}
</style>
<div class="col-md-9">
	<div class="checkout__order">
		<div class="workroom_box row" style="height: 39px;">
			<h4>북마크</h4>
		</div>
		<hr>
		<div class="row">
				<c:forEach var="likebmVo" items="${bmList}">
					<div class="col-lg-3">
						<div class="card card-1">
							<div class="categories__item set-bg"
								style="border-radius: 10px 10px 0px 0px;"
								data-setbg="/displayImage?filePath=${likebmVo.main_img}">
							</div>
							<div class="product__item__text">
								<h6>
									<a href="/hobby/content/${likebmVo.hobby_no}">${likebmVo.hobby_title}</a>
								</h6>
								<div class="blog__details__author__pic row"
									style="width: 100%; height: 100%;">
									<a href="/workroom/main/${likebmVo.user_id}"
										style="margin-left: auto; margin-right: auto;"> 
										<c:choose>
										<c:when test="${likebmVo.user_img != null}">
											<img src="/displayImage?filePath=${likebmVo.user_img}" style="height: 30px; width: 30px;" alt="profile">
										</c:when>
										<c:otherwise>
											<img src="/resources/img/noprofile.png" style="height: 30px; width: 30px;" alt="profile">
										</c:otherwise>
									</c:choose>
										 <span class="st_c_content"
										style="font-size: 14px; margin-top: 5px; margin-left: 5px;">${likebmVo.user_nick}</span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
		</div>
		<div class="product__pagination justify-content-center pagination" style="display: flex;">
			<!-- 이전페이지(<-) -->
			<c:if test="${pagingDto.startPage != 1}">
				<a href="${pagingDto.startPage - 1}">
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
			href="${v}">${v}</a> 
			</c:forEach> 
			<!-- 다음페이지(->) -->
			<c:if test="${pagingDto.endPage < pagingDto.totalPage}">
			<a href="${pagingDto.startPage + 1}">
				<i class="fa fa-long-arrow-right"></i>
			</a>
			</c:if>
		</div>
	</div>
</div>
<div class="col-md-2"></div>
</div>
</div>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="../include/footer.jsp"%>