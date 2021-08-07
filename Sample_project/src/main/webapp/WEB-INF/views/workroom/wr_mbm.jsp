<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/workroomSide.jsp" %>
<script>
$(document).ready(function() {
	$(".pagination > a").click(function(e) {
		e.preventDefault(); // 페이지 이동 막기
		var page = $(this).attr("href");
		var frmPaging = $("#frmPaging");
		frmPaging.find("[name=page]").val(page);
		frmPaging.submit();
	});

	$(".qCheck > li > a").click(function(e) {
		e.preventDefault();
		var searchType = $(this).text();
		$("#btnOption").text(searchType);
		var qCheck = $(this).attr("href");
		
		$("#frmPaging > input[name=qCheck]").val(qCheck);
		$("#frmPaging > input[name=page]").val("1");
		$("#frmPaging").submit();

	});
});
</script>
<form id="frmPaging" action="/workroom/mbm/${page_id}" method="get">
<input type="hidden" name="page" value="${pagingDto.page}"/>
<input type="hidden" name="perPage" value="${pagingDto.perPage}"/>
<input type="hidden" name="endRow" value="${pagingDto.endRow}"/>
<input type="hidden" name="qCheck" value="${pagingDto.qCheck}"/>
</form>
<div class="col-md-9">
	<div class="checkout__order">
		<div class="workroom_box row" style="height: 39px;">
			<h4>MadeByMe</h4>
			<ul class="nav nav-pills">
					<li>
					<div class="dropdown">
					  <button id="btnOption" class="form-control btn btn-outline-light green_background dropdown-toggle" 
					  type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" style="margin-left: 20px;">
					    <c:choose>
					    <c:when test="${pagingDto.qCheck == 0}">인기순</c:when>
					    <c:when test="${pagingDto.qCheck == 1}">최신순</c:when>
					    </c:choose>
					  </button>
					  <ul class="qCheck dropdown-menu" aria-labelledby="dropdownMenuButton1">
					    <li><a class="dropdown-item" href="0">인기순</a></li>
					    <li><a class="dropdown-item" href="1">최신순</a></li>
					  </ul>
					</div>
					</li>
			</ul>
		</div>
		<div class="workroom_box">
			<hr>
			<div class="container-fluid">
				<c:forEach var="mbmVo" items="${mbmList}">
					<div class="row">
						<div class="col-md-3" style="height:167px;">
							<c:if test="${mbmVo.mbm_img != null}">
								<img src="/img/displayImage?filePath=${mbmVo.mbm_img}"
								style="width: 100%; height: 100%; object-fit:cover;">
							</c:if>
						</div>
						<div class="col-md-8" style="padding: 0px; margin: auto;">
							<p style="font-size: 15px; margin: 10px" class="story_detail">
							<a href="/mbm/detail/${page_id}?hobby_no=${mbmVo.hobby_no}&mbm_no=${mbmVo.mbm_no}" class="oooo">${mbmVo.mbm_content}</a><br> 
							<a class="fa fa-heart-o" href="/mbm/detail/${page_id}?hobby_no=${mbmVo.hobby_no}&mbm_no=${mbmVo.mbm_no}" 
								style="margin-right: 5px"> ${mbmVo.like_cnt}</a> 
							</p>
						</div>
					</div>
					<hr>
				</c:forEach>
			</div>
		</div>
		<!-- 페이징 -->
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="../include/footer.jsp"%>