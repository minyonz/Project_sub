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
	var msg = "${msg}";
	if (msg == "success") {
		// alert("수정 완료");
	}
	
	var isCheckDupId = false;
	var checkedId = "";
	
	var isCheckDupNick = false;
	var checkedNick = "";
	
	// 회원 가입 폼 전송
	$("#frmJoin").submit(function(){
		if($("#user_id").val() == ""){
			alert("아이디를  입력해주세요.");
			$("#user_id").focus();
			return false;
		}
		if($("#user_id").val().length < 4){
			alert("아이디를   4자 이상 입력해주세요");
			$("#user_id").focus();
			return false;
		}
		if($("#user_name").val() == ""){
			alert("이름을  입력해주세요.");
			$("#user_name").focus();
			return false;
		}	
		if($("#user_pw").val() != $("#user_pw2").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#user_pw").focus();
			return false;
		}
		if(isCheckDupId == false || $("#user_id").val() != checkedId){
			alert("아이디 중복 체크를 해주세요.");
			$("#btnCheckDupId").focus();
			return false;
		}
		if(isCheckDupNick == false || $("#user_nick").val() != checkedNick){
			alert("닉네임을 중복 체크를 해주세요.");
			$("#btnCheckDupNick").focus();
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
				$("#checkDupIdResult").text("이미 사용 중이거나 탈퇴한 아이디입니다.").css("color", "red");
				isCheckDupId = false;
			} else {
				$("#checkDupIdResult").text("멋진 아이디네요!").css("color", "blue");
				isCheckDupId = true;
			}
			checkedId = user_id;
		});
	});
	
	// 닉네임 중복 확인 버튼
	$("#btnCheckDupNick").click(function(){
		
		if($("#user_nick").val() == ""){
			$("#checkDupNickResult").text("닉네임을  입력해주세요.").css("color", "red");
			$("#user_nick").focus();
			return false;
		}
		
		var url = "/mypage/checkDupNick";
		var user_nick = $("#user_nick").val();
		var sendData = {
				"user_nick" : user_nick
		};
		$.get(url, sendData, function(rData) {
			console.log(rData);
			if(rData == "true"){
				$("#checkDupNickResult").text("이미 사용 중인 닉네임입니다.").css("color", "red");
				isCheckDupNick = false;
			} else {
				$("#checkDupNickResult").text("멋진 닉네임이에요!").css("color", "blue");
				isCheckDupNick = true;
			}
			checkedNick = user_nick;
		});
	});
});
</script>
<%-- ${list} --%>
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
				<div class="col-md-2">
					<!-- 내부 패널 왼쪽 -->
					<%-- <%@ include file="mypage_include/mypage_left.jsp"%> --%>
				</div>
				<div class="col-md-8">
				<!-- MyPageController -->
				<form role="form" id="frmJoin" action="/mypage/joinRun" method="post" enctype="multipart/form-data">
				<div style="text-align: center; margin-top: 12px;">
					<h2 style="font-weight: 700">회원 가입
					<a href="" class="fa fa-home" style="font-size:30px; margin-left:10px;"></a></h2>
				</div>
				<div class="checkout__order">
				<div class="workroom_box row">
					<h4 style="margin-bottom: 0px;">정보 입력</h4>
					<button type="button" id="btnName" class="fa fa-pencil" style="margin-left:10px; height:20px; border:none; background:none; padding: 0;"></button>
				</div>
				<hr>
				<div style="text-align: center;">
					<!-- <div class="checkout__order"> -->
						<div class="card-body">
							<div style="justify-content: center;">
							<div style="text-align: left;">
							<div class="form-group">
								<label for="user_id">아이디<img src="../resources/images/ico_required.gif" alt="필수" /></label> 
								<table>
								<tr>
									<td>
										<input type="text" class="form-control" id="user_id" name="user_id" maxlength="25" required/> 
									</td>
									<td width="30%">
										<button type="button" class="btn btn-sm btn-success" id="btnCheckDupId">아이디 중복 확인</button>
									</td>
								</tr>
								</table>
								<span class="error_next_box" id="idMsg" style="display:none" aria-live="assertive"></span>
								<span id="checkDupIdResult"></span>
							</div>
							<div class="form-group">
								<label for="user_pw">비밀번호<img src="../resources/images/ico_required.gif" alt="필수" /></label> 
								<input type="password" class="form-control" id="user_pw" name="user_pw" maxlength="20"
									   required placeholder="" />
							</div> 
							<div class="form-group">
								<label for="user_pw2">비밀번호 확인</label>
								<input type="password" class="form-control" id="user_pw2" maxlength="25" required/>
							</div>
							<div class="form-group">
								<label for="user_name">이름<img src="../resources/images/ico_required.gif" alt="필수" /></label>
								<input type="text" class="form-control" id="user_name" name="user_name" maxlength="20" required/>
							</div>
							<div class="form-group">
								<label for="user_nick">닉네임<img src="../resources/images/ico_required.gif" alt="필수" /></label>
								<table>
								<tr>
									<td>
										<input type="text" class="form-control" id="user_nick" name="user_nick" maxlength="20" required/>
									</td>
									<td width="30%">
										<button type="button" class="btn btn-sm btn-info"id="btnCheckDupNick">닉네임 중복 확인</button>
									</td>
								</tr>
								</table>
								<span id="checkDupNickResult"></span>
							</div>
							<div class="form-group">
								<label for="user_email">이메일<img src="../resources/images/ico_required.gif" alt="필수" /></label>
								<input type="email"	class="form-control" id="user_email" name="user_email" maxlength="50" required/>
							</div>
							<div class="form-group">
								<label for="user_tel">연락처</label>
								<input type="text" class="form-control" id="user_tel" name="user_tel" maxlength="20"/>
							</div>
						</div>
					</div>
						<div class="form-group">
						<button type="submit" class="btn btn-primary">가입완료</button>
					</div>
				</div>
				</div>
				<!-- </div> -->
			</div>
<!-- 			<div class="checkout__order">
				<div class="workroom_box">
					<h4>선택 정보</h4>
				</div>
				<div class="workroom_box">
					<hr>
					<div class="custom-control custom-switch">
					  <input type="checkbox" class="custom-control-input" id="customSwitch1">
					  <label class="custom-control-label" for="customSwitch1">공개</label>
					</div>
				</div>
			</div> -->
			</form>
			<div class="col-md-2">
				<!-- 내부 패널 오른쪽 -->
			</div>
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