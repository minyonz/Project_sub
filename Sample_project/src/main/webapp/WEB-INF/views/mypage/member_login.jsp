<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<!-- mypage/alarmSetup.jsp -->
<!-- <title>설정</title> -->
<!-- </head> -->
<body>
<script>
$(document).ready(function(){
	var msg = "${msg}";
	if (msg == "success") {
		alert("회원 가입을 환영합니다! \n 로그인하고 사용해주세요.");
	}
});
</script>
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
						<%-- <%@ include file="mypage_include/mypage_left.jsp"%> --%>
					</div>
					<div class="col-md-6">
						<!-- 내부 패널 메인 -->
							<form role="form" action="/mypage/loginRun" method="post">
							<div class="checkout__order">
							<div class="workroom_box row" style="height: 39px; display:flex;">
								<h4>로그인</h4>
								<a href="/mypage/login" class="fa fa-pencil" style="margin-top: 5px; margin-left: 10px;"></a>
							</div>
							<hr>
							<div class="form-group">
								<label for="user_id"> 아이디 </label> 
								<input type="text" class="form-control" 
									id="user_id" name="user_id" required
									value="" />
							</div>
							<div class="form-group">
								<label for="user_pw"> 패스워드 </label> 
								<input type="password" class="form-control" 
									id="user_pw" name="user_pw" required
									value="" />
							</div>
							<div class="checkbox">
								<label> 
									<input type="checkbox" /> 아이디 저장
								</label>
							</div>
							<button type="submit" class="btn btn-primary">로그인</button>
							<a href="/mypage/joinForm" class="btn btn-success">회원가입</a>
							</div>
						</form>
						<div class="col-md-3"></div>
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