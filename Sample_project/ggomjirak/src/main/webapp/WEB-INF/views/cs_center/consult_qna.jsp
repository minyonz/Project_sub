<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<!-- views/cs_center/consultQnA.jsp -->
<!-- <title>문의 게시판 글 내용</title> -->
<!-- </head> -->
<!-- <body> -->
<!-- <h2>문의하기 글 내용 확인 수정</h2> -->
<!-- <h3>-답변 완료된건 수정 안되게</h3> -->
<!-- </body> -->
<script src ="/resources/js/my-script.js"></script>
<script>
$(document).ready(function(){
	var msg = "${msg}";
	if(msg == "success"){
		alert("수정 완료");
	}
	
	// 수정 버튼 클릭
	$("#btnModify").click(function() {
		if($("#a_state").val() == "답변완료"){
			alert("답변 완료된 내용은 수정할 수 없습니다.");
			return false;
		} else {
			$("#btnModifyFinish").show();
			$("#title").prop("readonly", false);
			$("#content").prop("readonly", false);
		}
	});
	
	// 수정 완료 버튼 클릭
	$("#btnModifyFinish").click(function() {
		location.href = "/cs_center/consultQnARun";
	});
	
// 	// 삭제 버튼 클릭
// 	$("#btnDelete").click(function() {
// 		if($("#a_state").val() == "답변완료"){
// 			alert("답변 완료된 내용은 삭제할 수 없습니다.");
// 			return false;
// 		} else {
// 			location.href = "/cs_center/consultQnADelete";
// 		}
// 	});
	
	$("#btnDelete").click(function(){
		if($("#a_state").val() == "답변완료"){
			alert("답변 완료된 내용은 삭제할 수 없습니다.");
			return false;
		}
		if(confirm("삭제하시겠습니까?")){
			location.href = "/cs_center/consultQnADelete?qna_no=${qnAVo.qna_no}";
		}
	});
	
	// 목록버튼
	$("#btnList").click(function() {
		location.href = "/cs_center/consultList";
	});
	
});
</script>
${qnAVo}
${memberVo}
<body>
<div class="container-fluid">
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
						<%@ include file="../mypage/mypage_include/mypage_left.jsp"%>
					</div>
					<!-- 데이터 목록 -->
					<div class="col-md-9">
					<ul class="nav" >
							<li class="nav-item"><a class="nav-link active" href="/cs_center/consultQs">1:1 문의하기</a></li>
							<li class="nav-item"><a class="nav-link" href="/cs_center/consultList">나의 질문과 답변보기</a></li>
					</ul>
					
						<div class="jumbotron">
							<h2>내용 확인</h2>
					</div>
<!-- 					<form role="frm" action="/cs_center/consultQnADelete" method="post"> -->
<%-- 						<input type="hidden" name="qna_no" value="${qnAVo.qna_no}" />  --%>
<!-- 					</form> -->
						<form role="form" action="/cs_center/consultQnARun" method="post">
						
							<input type="hidden" name="user_id" value="${qnAVo.user_id}" /> 
							<input type="hidden" name="qna_no" value="${qnAVo.qna_no}" /> 
							<input type="hidden" name="qna_sort_cd" value="${qnAVo.qna_sort_cd}" /> 
							<%-- <input type="hidden" id="user_id" value="${memberVo.user_id}" />  --%>
							<div class="form-group">
								<label for="qna_type_nm"> 문의 유형 </label> 
								<input type="text" class="form-control" id="qna_type_nm" name="qna_type_nm" value="${qnAVo.qna_type_nm}" readonly />
							</div>
<!-- 							<div class="form-group"> -->
<!-- 							<table> -->
<!-- 							<tr> -->
<!-- 								<td> -->
<%-- 									<select name="qna_sort_cd" id="qna_sort_cd" name="qna_sort_cd" value="${qnAVo.qna_type_nm}"> --%>
<!-- 											<option value="0">유형을 선택하세요</option> -->
<!-- 											<option value="101">사이트 이용 방법</option> -->
<!-- 											<option value="102">서비스 개선 의견</option> -->
<!-- 											<option value="103">시스템 오류 제보</option> -->
<!-- 											<option value="104">비지니스 문의</option> -->
<!-- 											<option value="105">회원 정보 문의</option> -->
<!-- 											<option value="106">기타</option> -->
<!-- 									</select> -->
<!-- 								</td> -->
<!-- 							</tr> -->
<!-- 							</table> -->
<!-- 							</div> -->
								<div class="form-group">
								<label for="save_time"> 등록일시 </label> 
								<input type="text" class="form-control" id="q_save_time" value="${qnAVo.q_save_time}" readonly />
							</div>
							<div class="form-group">
								<label for="a_state"> 상태 </label> 
								<input type="text" class="form-control" id="a_state" name="a_state" value="${qnAVo.a_state}" readonly />
							</div>
							<div class="form-group">
								<label for="content"> 제목 </label>
								<textarea class="form-control" id="title" name="title" readonly>${qnAVo.title}</textarea>
							</div>
							<div class="form-group">
								<label for="content"> 내용 </label>
								<textarea class="form-control" id="content" name="content" readonly>${qnAVo.content}</textarea>
							</div>
							<div class="form-group">
								<label for="content"> 답변 </label>
								<textarea class="form-control" id="a_content" name="a_content" readonly>${qnAVo.a_content}</textarea>
							</div>
							<button type="button" class="btn btn-primary" id="btnModify">수정</button>
							<button type="submit" class="btn btn-success" style="display:none" id="btnModifyFinish">수정완료</button>
							<button type="button" class="btn btn-danger" id="btnDelete">삭제</button>
							<button type="button" class="btn btn-warning" id="btnList">목록</button>
						</form>
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