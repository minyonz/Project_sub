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
});
</script>
<form id="frmPaging" action="/manager/managerMemberList" method="get">
<input type="hidden" name="page" value="${pagingDto.page}"/>
<input type="hidden" name="perPage" value="${pagingDto.perPage}"/>
<input type="hidden" name="endRow" value="${pagingDto.endRow}"/>
</form>
<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">회원 가입 정보</h1>
	<div class="card shadow mb-4">
		<div class="card-body">
		
			<!-- 검색 -->
			<div class="input-group">

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
	
	<div class="card-header py-3" style="overflow: hidden">
			<h6 class="m-0 font-weight-bold green_color" style="float: left;">회원 리스트</h6>
			
			<div class="dropdown">
				<select name="category"
					class="btn btn-outline-light green_background dropdown-toggle"
					data-bs-toggle="dropdown" aria-expanded="false">
					<option class="dropdown-item" value="ca">최신 순</option>
					<option class="dropdown-item" value="1">등급 순</option>
					<option class="dropdown-item" value="3">인기 순</option>
					<option class="dropdown-item" value="4">2</option>
				</select>
				<select name="category" class="btn btn-outline-light green_background dropdown-toggle"
					data-bs-toggle="dropdown" aria-expanded="false">
					<option class="dropdown-item" value="ca">검색 필터</option>
					<option class="dropdown-item" value="1">1</option>
					<option class="dropdown-item" value="2">2</option>
					<option class="dropdown-item" value="3">3</option>
					<option class="dropdown-item" value="4">4</option>
				</select>
			</div>
			
		</div>
	
		
		<div class="card-body">

			<div class="table-responsive">
				<table class="table" id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>이름</th>
							<th>아이디</th>
							<th>비밀번호</th>
							<th>이메일</th>
							<th>전화번호</th>
							<th>닉네임</th>
							<th>회원가입일</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="member" items="${memberList}">
						<tr>
							<td>${member.user_name}</td>
							<td><a href="/manager/managerMemberContent?user_id=${member.user_id}">${member.user_id}</a></td>
							<td>${member.user_pw}</td>
							<td>${member.user_email}</td>
							<td>${member.user_tel}</td>
							<td>${member.user_nick}</td>
							<td>${member.reg_date}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- 페이징 -->
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