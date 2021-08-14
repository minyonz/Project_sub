<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<!-- views/cs_center/consultQS.jsp -->
<!-- <title>1:1 문의</title> -->
<!-- </head> -->
<!-- <body> -->
<!-- <h2>문의하기 게시판 글쓰기</h2> -->
<!-- </body> -->
<script src ="/resources/js/my-script.js"></script>
<script>
$(document).ready(function(){
	var msg = "${msg}";
	if(msg == "success"){
		alert("저장 완료");
	}
	// 저장 버튼 클릭
	$("#frmConsultQS").submit(function(){
		if($("#qna_sort_cd").val() == "0"){
			alert("질문 유형을 선택해주세요.");
			$("#qna_sort_cd").focus();
			return false;
		}
		if($("#input_name").val() == ""){
			alert("이름을 입력해주세요.");
			return false;
		}
		if($("#input_tel").val() == ""){
			alert("연락처를 입력해주세요.");
			return false;
		}
		if($("#title").val() == ""){
			alert("제목을 입력해주세요.");
			return false;
		}
		if($("#content").val() == ""){
			alert("내용을 입력해주세요.");
			return false;
		}
		if($("#IsEmailReceive").checked == "on") {
			if($("#user_email").val() == ""){
				alert("답변 받을 이메일을 입력해주세요.");
				return false;
			}
		}
	});
});	
</script>
<%-- ${memberVo} --%>
<%-- ${qnAVo} --%>
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
					<!-- 데이터 목록 -->
					<div class="col-md-9">
					<div class="checkout__order">
					<div class="workroom_box row" style="height: 39px; display:flex;">
					<h4>1:1 문의 글 작성</h4>
						<a href="" class="fa fa-pencil" style="margin-top: 5px; margin-left: 10px;"></a>
					</div>
					<hr>
						<form role="form" id="frmConsultQS" action="/cs_center/consultQsRun" method="post" enctype="multipart/form-data">
							<input type="hidden" name="qna_type" value="Q"/> 
							<input type="hidden" id="user_id" name="user_id" value="${memberVo.user_id}"/> 
							<%-- <input type="hidden" id="user_name" name="user_name" value="${memberVo.user_name}"/>  --%>
							<%-- <input type="hidden" id="user_tel" name="user_tel" value="${memberVo.user_tel}"/>  --%>
							<input type="hidden" id="user_email" name="user_email" value="${memberVo.user_email}"/> 
							<%-- <input type="hidden" id="qna_no" name="qna_no" value="${qnAVo.qna_no}"/> --%> 
							<div class="form-group">
							<table>
							<tr>
								<td>
									<select name="qna_sort_cd" id="qna_sort_cd" name="qna_sort_cd">
											<option value="0">유형을 선택하세요</option>
											<option value="101">사이트 이용 방법</option>
											<option value="102">서비스 개선 의견</option>
											<option value="103">시스템 오류 제보</option>
											<option value="104">비지니스 문의</option>
											<option value="105">회원 정보 문의</option>
											<option value="106">기타</option>
									</select>
								</td>
							</tr>
							</table>
							</div>
							<!-- 로그인 한 사용자의 정보를 읽어와서 나타내고 & 수정한 내용 저장되게 추가함 -->
							<div class="form-group">
								<label for="user_name">고객명</label>
								<input type="text" class="form-control" id="input_name" name="input_name" value="${memberVo.user_name}"/>
							</div>
							<div class="form-group">
								<label for="user_tel">연락처</label>
								<input type="text" class="form-control" id="input_tel" name="input_tel" value="${memberVo.user_tel}"/>
							</div>
							
							<!-- 폼 모양은 테이블로 수정할 예정 -->
							<div class="form-group">
 								<label for="title"> 글제목 </label> 
								<input type="text" class="form-control" id="title" name="title" value="${qnAVo.title}"/>
							</div>
							<div class="form-group">
								<label for="content"> 글내용 </label>
								<textarea class="form-control" id="content" name="content" style="height: 200px"></textarea>
							</div>
							<!-- 답변 내용을 연락받을 이메일을 수정가능하게 만들 수 있음 -->
							<div class="form-group">
								<input type="checkbox" id="IsEmailReceive" name="is_email_receive" checked="checked">
								<label for="is_email_receive">이메일로 답변 받기</label>
                            	<div id="trIsEmailReceive" style="display:inline-block;">
                              		<input name="input_email" id="input_email" type="text" style="width:250px;" class="f3" value="${memberVo.user_email}">
                               	</div>
                            </div>               
							<button type="submit" class="btn btn-success" id="btnSubmit">저장완료</button>
						</form>
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