<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<!-- views/cs_center/consultList.jsp -->
<!-- <title>문의 게시판 목록</title> -->
<!-- </head> -->
<!-- <body> -->
<!-- <h2>1:1문의 게시판</h2> -->
<!-- </body> -->
<script>
$(document).ready(function() {
	var msg = "${msg}";
	if (msg == "wirteRun_success") {
		alert("1:1 문의 접수 완료");
	}
	
// 	var msgDelete = "${msgDelete}";
// 	if (msgDelete == "success") {
// 		alert("글 삭제 완료");
// 	}
	
// 	// 페이지 번호
// 	$(".pagination > li > a").click(function(e) {
// 		e.preventDefault(); // 페이지 이동 막기
// 		var page = $(this).attr("href");
// 		var frmPaging = $("#frmPaging");
// 		frmPaging.find("[name=page]").val(page);
// 		frmPaging.submit();
// 		// -> 주소창에 : http://localhost/board/listAll?page=1&perPage=10&searchType=&keyword=
// 	});
		
	// 글제목  (10개)
	$(".a_title").click(function(e) {
		e.preventDefault(); // prevent:막다, 방지하다, default: 기본
		// $(this) -> 10개 중에서 클릭한 .a_title
		// attr: attribute(속성)
		var qna_no = $(this).attr("qna_no"); // 489
		$("#frmPaging > input[name=qna_no]").val(qna_no);
		//$("#frmPaging > input[name=user_id]").val(user_id);
		$("#frmPaging").attr("action", "/cs_center/consultQnA");
		$("#frmPaging").submit();
	});
	
});
</script>
<!-- <form id="frmPaging" action="/cs_center/consultList" method="get"> -->
<%-- 	<input type="hidden" name="page" value="${pagingDto.page}"/> --%>
<%-- 	<input type="hidden" name="perPage" value="${pagingDto.perPage}"/> --%>
<%-- 	<input type="hidden" name="searchType" value="${pagingDto.searchType}"/> --%>
<%-- 	<input type="hidden" name="keyword" value="${pagingDto.keyword}"/> --%>
<!-- 	<input type="hidden" name="qna_no"/> -->
<!-- </form> -->
<form id="frmPaging" action="/cs_center/consultList" method="get">
	<input type="hidden" name="qna_no"/>
	<input type="hidden" name="user_id"/>
</form>
<%-- ${list} --%>
<body>
<div class="container-fluid" style="background: #F5F5F5">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
					<!-- 전체 페이지에서 왼쪽 패널  -->
				</div>
				<div class="col-md-8">
					<!-- 전체 페이지 메인 패널 -->
					<div class="row">
					<div class="col-md-3">
						<!-- 내부 패널 왼쪽 -->
						<%@ include file="../include/mypageSide.jsp"%>
					</div>
					<div class="col-md-9">
						
						<div class="checkout__order">
							<div class="workroom_box row" style="height: 39px; display:flex;">
							<h4>1:1 문의 게시판</h4>
								<a href="/cs_center/consultQs" class="fa fa-pencil" style="margin-top: 5px; margin-left: 10px;"></a>
							</div>
						<!-- <hr> -->
						<ul class="nav" style="float: right" >
							<li class="nav-item"><a class="nav-link active" href="/cs_center/consultQs">1:1 문의하기</a></li>
							<li class="nav-item"><a class="nav-link" href="/cs_center/consultList">나의 질문과 답변보기</a></li>
						</ul>
						<table class="table" style="word-break:break-all">
						<!-- <table class="table" border=0 cellpadding=0 cellspacing=10 style="table-layout:fixed"> -->
							<thead>
								<tr>
									<th>글제목</th>
									<th>작성일</th>
									<th>상태</th>
									<!-- <th>취소하기</th> -->
								</tr>
							</thead>
							<tbody>
							
								<c:forEach var="qnAVo" items="${list}">
									<tr>
										<td>
											<a class="a_title" href="#" qna_no="${qnAVo.qna_no}">${qnAVo.title}</a>
										</td>
										<td style="white-space:nowrap">${qnAVo.save_time}</td>
										<td style="white-space:nowrap">${qnAVo.a_state}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					</div>
				</div>
				<!-- // 데이터 목록 -->
				</div> 	<!-- 전체 페이지 메인 패널 끝 -->
				<div class="col-md-2">
					<!-- 전체 페이지 오른쪽 패널 -->
				</div>
			</div> <!-- </div class="row"> -->
		</div> <!-- </div class="col-md-12"> -->
	</div> <!-- </div class="row"> -->
</div> <!-- <div class="container-fluid"> -->
</body>

<%@ include file="../include/footer.jsp"%>