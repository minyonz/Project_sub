<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<!--   <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<!-- mypage/alarmSetup.jsp -->
<!-- <title>회원 가입</title>
</head>
<body> -->
<script>
$(document).ready(function(){
	var isCheckDupId = false;
	var checkId = "";
	
	// 회원 가입 폼 전송
	$("#frmJoin").submit(function(){
		if($("#user_pw").val() != $("#user_pw2").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#user_pw").focus();
			return false;
		}
		
		if(isCheckDupId == false){
			alert("아이디 중복 체크를 해주세요.");
			$("#btnCheckDupId").focus();
			return false;
		}
	});
	// 아이디 중복 확인 버튼
	$("#btnCheckDupId").click(function(){
		var url = "/mypage/checkDupId";
		var user_id = $("#user_id").val();
		var sendData = {
				"user_id" : user_id
		};
		$.get(url, sendData, function(rData) {
			console.log(rData);
			if(rData == "true"){
				$("#checkDupIdResult").text("사용중인 아이디").css("color", "red");
			} else {
				$("#checkDupIdResult").text("사용 가능한 아이디").css("color", "blue");
			}
			isCheckDupId = true;
			checkId = user_id;
		});
	});
	
// 	var selectBoxChange = function(value){
// 		console.log("값 변경 테스트: " + value);
// 		$("#changeInput").val(value);
	$("#changeTest").change(function(){

		var url = "/mypage/changeCate";
		var parent_cate_no = $(this).val();
		console.log("값 변경 테스트: " + parent_cate_no);
		$("#changeInput").val(parent_cate_no);
		
		var sendData = {
			"parent_cate_no" : parent_cate_no
		};
		
		$.get(url, sendData, function(rData) {
			console.log(rData);
		});
	});
	
});
</script>
${list}
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
						<%@ include file="mypage_include/mypage_left.jsp"%>
					</div>
					<div class="col-md-9">
						<!-- 내부 패널 메인 -->
						<br>
						<h3>회원 가입 폼</h3>
						<br>
						<!-- MyPageController -->
						<form role="form" id="frmJoin" action="/mypage/joinRun" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label for="user_info">필수 정보</label>
							</div>
							<div class="form-group">
								<label for="user_id">아이디*</label> 
								<input type="text" class="form-control" id="user_id" name="user_id" /> 
								<br />
								<button type="button" class="btn btn-small btn-danger" id="btnCheckDupId">아이디 중복 확인</button>
								<span id="checkDupIdResult"></span>
							</div>
							<div class="form-group">
								<label for="user_pw">비밀번호*</label> 
								<input type="password" class="form-control" id="user_pw" name="user_pw" required />
							</div>
							<div class="form-group">
								<label for="user_pw2">비밀번호 확인</label>
								<input type="password" class="form-control" id="user_pw2" required />
							</div>
							<div class="form-group">
								<label for="user_name">이름</label>
								<input type="text" class="form-control" id="user_name" name="user_name" />
							</div>
							<div class="form-group">
								<label for="user_email">이메일*</label>
								<input type="email"	class="form-control" id="user_email" name="user_email" />
							</div>
							<div class="form-group">
								<label for="user_tel">연락처</label>
								<input type="text" class="form-control" id="user_tel" name="user_tel" />
							</div>
							<div class="form-group">
								<label for="user_details">부가 정보</label>
							</div>
							
							<div class="form-group">
								<label for="user_hobbys">관심 취미 선택</label>
							</div>
							
							<table>	
							<tr>
								<td>
								<input type="text" id ="changeInput"/>
								<c:if test ="${!empty list1}" >
									<!-- <select id="changeTest" onchange="selectBoxChange(this.value)"> -->
									<select id="changeTest">
									<c:forEach var ="list1" items="${list1}">
										<option value="${list1.cate_no}">${list1.cate_name}</option>
									</c:forEach>
									</select>
								</c:if>									
									&nbsp;<!-- ??? -->
								</td>
								
								<td>
<%-- 								<c:if test ="${!empty list2}">										 --%>
									<select name="cate_no1" id="cate_no1">
										<c:forEach var ="list2" items="${list2}">
										<option value="${list2.cate_no}">${list2.cate_name}</option>
									</c:forEach>
									</select>
<%-- 								</c:if> --%>
								</td>
								<td>
								<!-- <label for="changeInput">대분류에서 선택한 내용 코드</label> -->
							
								</td>
							</tr>
							<tr>
								<td>
									<select name="bigSort2" id="bigSort2">
										<option value="bigSort2">대분류</option>
										<option value="DIY">만들기</option>
										<option value="painting">그리기</option>
										<option value="decorating">꾸미기</option>
									</select>
								</td>
								<td>										
									<select name="midSort2" id="midSort2">
										<option value="midSort2">중분류</option>
										<option value="DIY">향초</option>
										<option value="painting">수채화</option>
										<option value="decorating">다이어리</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<select name="bigSort3" id="bigSort3">
										<option value="bigSort3">대분류</option>
										<option value="DIY">만들기</option>
										<option value="painting">그리기</option>
										<option value="decorating">꾸미기</option>
									</select>
								</td>
								<td>										
									<select name="midSort3" id="midSort3">
										<option value="midSort3">중분류</option>
										<option value="DIY">향초</option>
										<option value="painting">수채화</option>
										<option value="decorating">다이어리</option>
									</select>
								</td>
							</tr>
							</table>
							<br>
							<div class="form-group">
								<label for="cate_etc">직접 입력</label>
								<input type="text" class="form-control" id="cate_etc" name="cate_etc" />
							</div>
							
<!-- 							<div class="form-group"> -->
<!-- 								<label for="user_grade">회원 등급</label> -->
<!-- 								<input type="text" class="form-control" id="user_grade" name="user_grade" /> -->
<!-- 							</div> -->
							
							<br><br>
							<div class="form-group">
								<button type="submit" class="btn btn-primary">가입완료</button>
							</div>
						</form>
						</div> <!-- </div class="row"> --> 
					</div> <!-- 내부 패널 메인  끝 -->
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