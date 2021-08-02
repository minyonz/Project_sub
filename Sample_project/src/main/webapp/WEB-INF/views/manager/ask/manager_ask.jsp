<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../manager_include/manager_header.jsp" %>
<script>
$(document).ready(function() {
	$(".pagination > li > a").click(function(e) {
		e.preventDefault(); // 페이지 이동 막기
		var page = $(this).attr("href");
		var frmPaging = $("#frmPaging");
		frmPaging.find("[name=page]").val(page); // page에 페이지 숫자 넣어줌
		console.log(page);
		frmPaging.submit();
		// -> 주소창에 : http://localhost/board/listAll?page=1&perPage=10&searchType=&keyword=
	});
	// 카테고리 검색
	$(".qCheck > li > a").click(function(e) {
		e.preventDefault();
		var qCheck = $(this).attr("href");
		
		console.log(qCheck);
		$("#frmPaging > input[name=qCheck]").val(qCheck);
		
		$("#frmPaging > input[name=page]").val("1");

		$("#frmPaging").submit();

	});
});
</script>
<form id="frmPaging" action="/manager/managerAsk" method="get">
<input type="hidden" name="page" value="${pagingDto.page}"/>
<input type="hidden" name="perPage" value="${pagingDto.perPage}"/>
<input type="hidden" name="endRow" value="${pagingDto.endRow}"/>
<input type="hidden" name="qCheck" value="${pagingDto.qCheck}"/>
</form>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">1:1문의 관리</h1>
	<div class="card shadow mb-4">
		<div class="card-body">
		
			<!-- 검색 -->
			<div class="input-group">
				<div class="dropdown">

					<select name="category"
						class="btn btn-outline-light green_background dropdown-toggle"
						data-bs-toggle="dropdown" aria-expanded="false">
						<option class="dropdown-item" value="ca">검색 옵션</option>
						<option class="dropdown-item" value="1">1</option>
						<option class="dropdown-item" value="2">2</option>
						<option class="dropdown-item" value="3">3</option>
						<option class="dropdown-item" value="4">4</option>
					</select>


				</div>

				<input id="searchText" type="text" class="form-control"
					aria-label="Text input with dropdown button" placeholder="회원 정보 검색">

				<button type="button" class="btn btn-outline-light green_background" id="button-addon2">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
						<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
					</svg>
					<span class="visually-hidden">검색</span>
				</button>
			</div>
			<!-- 검색 끝 -->
			
		</div>
	</div>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold green_color">문의 리스트</h6>
		</div>
		
		<div class="card-body">
		
			<ul class="nav nav-tabs qCheck">
			<li class="nav-item"><a 
				<c:choose>
					<c:when test="${pagingDto.qCheck == 0}"> class="nav-link active" </c:when>
					<c:otherwise> class="nav-link" </c:otherwise>
				</c:choose>
			href="0">전체 문의</a></li>
			<li class="nav-item"><a 
			<c:choose>
					<c:when test="${pagingDto.qCheck == 1}"> class="nav-link active" </c:when>
					<c:otherwise> class="nav-link" </c:otherwise>
				</c:choose>
			href="1">미답변 문의</a></li>
			<li class="nav-item"><a
			<c:choose>
					<c:when test="${pagingDto.qCheck == 2}"> class="nav-link active" </c:when>
					<c:otherwise> class="nav-link" </c:otherwise>
				</c:choose>
			href="2">완료된 문의</a></li>
			<li class="nav-item"><a
			<c:choose>
					<c:when test="${pagingDto.qCheck == 3}"> class="nav-link active" </c:when>
					<c:otherwise> class="nav-link" </c:otherwise>
				</c:choose>
			href="3">삭제된 문의</a></li>
		</ul>
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>문의 번호</th>
							<th>회원 아이디</th>
							<th>제목</th>
							<th>문의일</th>
							<th>삭제유무</th>
							<th>삭제일</th>
							<th>답변상태</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="qna" items="${qnaVo}">
						<tr>
							<td>${qna.qna_no}</td>
							<td>${qna.user_id}</td>
							<td><a href="/manager/managerAskContent?qna_no=${qna.qna_no}">${qna.title}</a></td>
							<td>${qna.save_time}</td>
							<td>${qna.is_del}</td>
							<td>${qna.delete_time}</td>
							<td>
							<c:choose>
							<c:when test="${qna.a_no == 0}">
							<a href="/manager/managerAskAnswer?qna_no=${qna.qna_no}" type="button" class="btn btn-success green_background">답변하기</a>
							</c:when>
							<c:otherwise>
							답변 완료
							</c:otherwise>
							</c:choose>
								
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>
	<!-- 페이징 -->
	${pagingDto }
	<div class="row  text-center">
		<div class="col-md-12">
			<nav class="pagination justify-content-center">
				<ul class="pagination">
				<c:if test="${pagingDto.startPage != 1}">
					<li class="page-item"><a class="page-link" href="${pagingDto.startPage - 1}">&laquo;</a></li>
				</c:if>
				
				<c:forEach var="v" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
					<li
						<c:choose>
							<c:when test="${v == pagingDto.page}">
								class="page-item active"
						 	</c:when>
						 	<c:otherwise>
						 		class="page-item"
							</c:otherwise>
						</c:choose>
							><a class="page-link" href="${v}">${v}</a></li>
				</c:forEach>
				
				<c:if test="${pagingDto.endPage < pagingDto.totalPage}">
					<li class="page-item"><a class="page-link" href="${pagingDto.endPage + 1}">&raquo;</a></li>
				</c:if>
				</ul>
			</nav>
		</div>
	</div>
	<!-- // 페이징 -->

</div>
<!-- /.container-fluid -->

<%@ include file="../manager_include/manager_footer.jsp" %>