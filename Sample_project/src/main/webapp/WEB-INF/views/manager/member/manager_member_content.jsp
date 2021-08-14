<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../manager_include/manager_header.jsp" %>
<script>
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "${pagingDto.pCheck}?page=${pagingDto.page}&perPage=${pagingDto.perPage}&searchType=${pagingDto.searchType}&keyword=${pagingDto.keyword}";	
	});
	

	$("#btnLeave").click(function() {
		var result = confirm("${memberVo.user_id}님을 탈퇴시키시겠습니까?");
		if(result){
		    $(this).attr("href", "/manager/managerMemberDeleteRun?user_id=${memberVo.user_id}");
		}else{
		    return false;
		}
	});

});
</script>
<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<div style="display: flex;">
		<h1 class="h3 mb-2 text-gray-800">회원 상세 정보</h1>
		<button id="btnList" class="btn btn-success green_background" style="margin-left: auto; margin-bottom: 20px">목록</button>
	</div>
	
	<!-- Dropdown Card Example -->
	<div class="card shadow mb-4">
		<!-- Card Header - Dropdown -->
		<div
			class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			<h6 class="m-0 font-weight-bold green_color">가입 정보</h6>
			<div class="dropdown no-arrow">
				<a class="dropdown-toggle" href="#" role="button"
					id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i
					class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
				</a>
				<div
					class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
					aria-labelledby="dropdownMenuLink">
					<div class="dropdown-header">회원 정보 관리</div>
					<a class="dropdown-item" href="/manager/managerMemberContentModify?user_id=${memberVo.user_id}">회원 정보 수정</a>
					<div class="dropdown-divider"></div>
					<a id="btnLeave" class="dropdown-item">회원 탈퇴</a>
				</div>
			</div>
		</div>
		<!-- Card Body -->
		<div class="card-body">

			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-xl-2 col-lg-3 col-md-4 col-sm-12">
							<h6><strong>프로필 이미지</strong></h6>
							<c:choose>
	                        <c:when test="${memberVo.user_img != null}">
	                        	<img src="/displayImage?filePath=${memberVo.user_img}" class="rounded-circle"
	                        	
									alt="..." width="150px" height="150px" style="margin: 20px">
	                        </c:when>
	                        <c:otherwise>
	                        	<img src="/resources/img/noprofile.png" class="rounded-circle"
									alt="..." width="150px" height="150px" style="margin: 20px">
	                        </c:otherwise>
	                        </c:choose>
						</div>
						
						<div class="col-xl-10 col-lg-9 col-md-8 col-sm-12">
							<div>
								<table class="table table-borderless">
									<tbody>
										<tr>
											<th scope="col">이름</th>
											<td style="width: 80%">${memberVo.user_name}</td>
										</tr>
										<tr>
											<th scope="col">아이디</th>
											<td>${memberVo.user_id}</td>
										</tr>
										<tr>
											<th scope="col">비밀번호</th>
											<td>${memberVo.user_pw}</td>
										</tr>
										<tr>
											<th scope="col">이메일</th>
											<td>${memberVo.user_email}</td>
										</tr>
										<tr>
											<th scope="col">전화번호</th>
											<td>${memberVo.user_tel}</td>
										</tr>
										<tr>
											<th scope="col">닉네임</th>
											<td>${memberVo.user_nick}</td>
										</tr>
										<tr>
											<th scope="col">관심 취미</th>
											<td>
												<button class="btn btn-light" disabled>${cateVo.cate_no1}</button>
												<button class="btn btn-light" disabled>${cateVo.cate_no2}</button>
												<button class="btn btn-light" disabled>${cateVo.cate_no3}</button>
												<button class="btn btn-light" disabled>
												<c:choose>
													<c:when test="${memberVo.cate_etc == null}">
													선택안함
													</c:when>
													<c:otherwise>
													${memberVo.cate_etc}
													</c:otherwise>
												</c:choose>
												
												</button>
											</td>
										</tr>
										<tr>
											<th scope="col">회원 가입일</th>
											<td>${memberVo.reg_date}</td>
										</tr>
										<tr>
											<th scope="col">회원탈퇴여부</th>
											<td>${memberVo.is_del}</td>
										</tr>
										<tr>
											<th scope="col">회원탈퇴일</th>
											<td>${memberVo.del_date}</td>
										</tr>
									</tbody>
								</table>
							</div>

						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold green_color">활동 정보</h6>
		</div>
		<div class="card-body">
		
			<table class="table">
			  <tbody>
					<tr>
						<th scope="col" style="width: 15%">등급</th>
						<td style="width: 35%">${grade}</td>
						<th scope="col"  style="width: 15%; border-left: 1px solid lightgray">로그인 기록</th>
						<td style="width: 35%">${loginTime.login_time} (${countLogin}회)</td>
					</tr>
					<tr>
						<th scope="col">게시글 수</th>
						<td>${contentCnt}</td>
						<th scope="col" style="border-left: 1px solid lightgray">문의글 수</th>
						<td>${QnACnt}</td>
					</tr>
					<tr>
						<th scope="col">필로잉 수</th>
						<td>${memberVo.following_cnt}</td>
						<th scope="col" style="border-left: 1px solid lightgray">팔로워 수</th>
						<td>${memberVo.follower_cnt}</td>
					</tr>
					<tr>
						<th scope="col">소개 글</th>
						<td colspan=3>${intro}</td>
					</tr>
					
				</tbody>
			</table>
		
		</div>
	</div>
	
	<!-- DataTales Example -->
<!-- 	<div class="card shadow mb-4"> -->
<!-- 		<div class="card-header py-3" style="overflow: hidden"> -->
<!-- 			<h6 class="m-0 font-weight-bold green_color" style="float: left;">작성 글</h6> -->
			
<!-- 			<div class="dropdown"> -->
<!-- 				<select name="category" -->
<!-- 					class="btn btn-outline-light green_background dropdown-toggle" -->
<!-- 					data-bs-toggle="dropdown" aria-expanded="false"> -->
<!-- 					<option class="dropdown-item" value="1">취미</option> -->
<!-- 					<option class="dropdown-item" value="2">스토리</option> -->
<!-- 					<option class="dropdown-item" value="3">Made by Me</option> -->
<!-- 					<option class="dropdown-item" value="4">문의</option> -->
<!-- 				</select> -->
<!-- 			</div> -->
			
<!-- 		</div> -->
		
		
<!-- 		<div class="card-body"> -->
<!-- 			<table class="table" id="dataTable" width="100%" cellspacing="0"> -->
<!-- 					<thead> -->
<!-- 						<tr> -->
<!-- 							<th>글번호</th> -->
<!-- 							<th>게시판</th> -->
<!-- 							<th>제목</th> -->
<!-- 							<th>작성일</th> -->
<!-- 							<th>삭제여부</th> -->
<!-- 							<th>삭제일</th> -->
<!-- 						</tr> -->
<!-- 					</thead> -->
<!-- 					<tbody> -->
<!-- 						<tr> -->
<!-- 							<td>1</td> -->
<!-- 							<td>취미</td> -->
<!-- 							<td><a href="#">Architect</a></td> -->
<!-- 							<td>2011/04/25</td> -->
<!-- 							<td>X</td> -->
<!-- 							<td>-</td> -->
<!-- 						</tr> -->
<!-- 					</tbody> -->
<!-- 				</table> -->
		
<!-- 		</div> -->
<!-- 	</div> -->

</div>
<!-- /.container-fluid -->


<%@ include file="../manager_include/manager_footer.jsp" %>