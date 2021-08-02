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
function showErrorMsg(obj, msg) {
    obj.attr("class", "error_next_box");
    obj.html(msg);
    obj.show();
}

// function setFocusToInputObject(obj) {
//     if(submitFlag) {
//         submitFlag = false;
//         obj.focus();
//     }
//}

$(document).ready(function(){
	var msg = "${msg}";
	if (msg == "success") {
		alert("수정 완료");
	}
	
	var isCheckDupId = false;
	var checkId = "";
	
	// 회원 가입 폼 전송
	$("#frmJoin").submit(function(){
		if($("#user_id").val() == ""){
			alert("아이디를  입력해주세요.");
			$("#user_id").focus();
			return false;
		}		
			
		if($("#user_pw").val() != $("#user_pw2").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#user_pw").focus();
			return false;
		}
		
		if(isCheckDupId == false || $("#user_id").val() != checkId){
			alert("아이디 중복 체크를 해주세요.");
			$("#btnCheckDupId").focus();
			return false;
		}
	});
	
	// 아이디 중복 확인 버튼
	$("#btnCheckDupId").click(function(){
		
		//var oMsg = $("#idMsg");
		if($("#user_id").val() == ""){
			//showErrorMsg(oMsg, "아이디를  입력해주세요.");
			$("#checkDupIdResult").text("아이디를  입력해주세요.").css("color", "red");
			$("#user_id").focus();
			return false;
		}
		
		var url = "/mypage/checkDupId";
		var user_id = $("#user_id").val();
		var sendData = {
				"user_id" : user_id
		};
		$.get(url, sendData, function(rData) {
			console.log(rData);
			if(rData == "true"){
				$("#checkDupIdResult").text("사용중인 아이디").css("color", "red");
				isCheckDupId = false;
			} else {
				$("#checkDupIdResult").text("사용 가능한 아이디").css("color", "blue");
				isCheckDupId = true;
			}
			checkId = user_id;
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
								 <span class="error_next_box" id="idMsg" style="display:none" aria-live="assertive"></span>
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