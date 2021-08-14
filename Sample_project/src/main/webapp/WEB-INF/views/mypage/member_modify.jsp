<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<script>
$(document).ready(function(){
	// 회원 정보 수정 폼 전송
	$("#frmModify").submit(function(){
		if($("#user_pw").val() != $("#user_pw2").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#user_pw").focus();
			return false;
		}
	});
});
</script>
<%-- ${memberVo} --%>
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
					<div class="col-md-8">
						<!-- 내부 패널 메인 -->
						<!-- <br>
						<h3>회원 정보 수정 폼</h3>
						<br> -->
						<div class="checkout__order">
							<div class="workroom_box row" style="height: 39px; display:flex;">
							<h4>회원 정보 수정</h4>
								<a href="/mypage/modifyForm" class="fa fa-pencil" style="margin-top: 5px; margin-left: 10px;"></a>
							</div>
						<hr>
						<form role="form" id="frmModify" action="/mypage/modifyRun" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<!-- <label for="user_info">필수 정보</label> -->
							</div>
							<div class="form-group">
								<label for="user_id">아이디<img src="../resources/images/ico_required.gif" alt="필수" /></label> 
								<input type="text" class="form-control" id="user_id" name="user_id" value="${memberVo.user_id}" readonly>
								<!-- <br /> -->
								<!-- <button type="button" class="btn btn-small btn-danger" id="btnCheckDupId">아이디 중복 확인</button>
								<span id="checkDupIdResult"></span> -->
							</div>
							<div class="form-group">
								<label for="user_pw">비밀번호<img src="../resources/images/ico_required.gif" alt="필수" /></label> 
								<input type="password" class="form-control" id="user_pw" name="user_pw" value="${memberVo.user_pw}" required />
							</div>
							<div class="form-group">
								<label for="user_pw2">비밀번호 확인</label>
								<input type="password" class="form-control" id="user_pw2" value="${memberVo.user_pw}" required />
							</div>
							<div class="form-group">
								<label for="user_name">이름<img src="../resources/images/ico_required.gif" alt="필수" /></label>
								<input type="text" class="form-control" id="user_name" name="user_name" value="${memberVo.user_name}" required />
							</div>
							<div class="form-group">
								<label for="user_email">이메일<img src="../resources/images/ico_required.gif" alt="필수" /></label>
								<input type="email"	class="form-control" id="user_email" name="user_email" value="${memberVo.user_email}" required />
							</div>
							<div class="form-group">
								<label for="user_tel">연락처</label>
								<input type="text" class="form-control" id="user_tel" name="user_tel" value="${memberVo.user_tel}" />
							</div>
						
<!-- 							<div class="form-group">
								<button type="submit" class="btn btn-primary">정보수정</button>
							</div> -->
							<div style="text-align: center;">
								<button type="submit" id="btnProfileSave"class="btn btn-primary">정보 저장</button>
							</div>
						</form>
						</div>
						<div class="col-md-1"></div>
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