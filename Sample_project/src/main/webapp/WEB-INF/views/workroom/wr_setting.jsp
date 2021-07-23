<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script>
$(document).ready(function() {
	// 작업실 이름
	// 수정 버튼 클릭 시 텍스트 입력으로 변경(수정버튼 비활성화)
	$("#btnName").click(function() {
		$("#wrName").replaceWith("<input type='text' id='wrName' style='border: 1px solid #E5E8E8; height: 30px;' value='${workroomVo.wr_name}'>");
		$("#btnName").attr("style", "margin-left:10px; height:20px; border:none; background:none; padding: 0; display:none");
		$("#btnNameMod").show();
		$("#btnNameCancel").show();
	});
	
	// 수정취소(wrName에 원래상태로 붙여줌)
	$("#btnNameCancel").click(function() {
		$("#wrName").replaceWith("<h4 style='margin-bottom:0px;' id='wrName'>${workroomVo.wr_name}</h4>");
		$("#btnName").show();
		$("#btnNameMod").attr("style", "margin-left:10px; display:none;");
		$("#btnNameCancel").attr("style", "margin-left:10px; display:none;");
	});
	
	// 수정실행(완료되면 수정버튼 활성화 / 변경,취소 비활성화)
	$("#btnNameMod").click(function() {
		var wr_name = $("#wrName").val();
		var user_id = "${workroomVo.user_id}";
		var url = "/workroomset/nameSet";
		var sendData = {
			"wr_name" : wr_name,
			"user_id" : user_id
		}
		$.post(url, sendData, function(rData) {
			console.log(rData);
			if (rData == "nameSuccess") {
				$("#wrName").replaceWith("<h4 style='margin-bottom:0px;' id='wrName'>" + wr_name + "</h4>");
				$("#btnName").show();
				$("#btnNameMod").attr("style", "margin-left:10px; display:none;");
				$("#btnNameCancel").attr("style", "margin-left:10px; display:none;");
			}
		});
	});
	
	// 작업실 소개 
	// 수정 버튼 클릭 시 텍스트 입력으로 변경(수정버튼 비활성화)
	// input type="text"말ㄹ고 TEXTAREA로 변경해
	$("#btnIntro").click(function() {
		$("#wrIntro").replaceWith("<textarea id='wrIntro' class='form-control'>${workroomVo.wr_intro}</textarea>");
		$("#btnIntro").attr("style", "margin-left:10px; height:20px; border:none; background:none; padding: 0; display:none");
		$("#btnIntroMod").show();
		$("#btnIntroCancel").show();
	});
	
	// 수정취소(wrName에 원래상태로 붙여줌)
	$("#btnIntroCancel").click(function() {
		$("#wrIntro").replaceWith("<p id='wrIntro'>${workroomVo.wr_intro}</p>");
		$("#btnIntro").show();
		$("#btnIntroMod").attr("style", "margin-left:10px; display:none;");
		$("#btnIntroCancel").attr("style", "margin-left:10px; display:none;");
	});
	
	// 수정실행(완료되면 수정버튼 활성화 / 변경,취소 비활성화)
	$("#btnIntroMod").click(function() {
		var wr_intro = $("#wrIntro").val();
		var user_id = "${workroomVo.user_id}";
		var url = "/workroomset/introSet";
		var sendData = {
			"wr_intro" 	: wr_intro,
			"user_id"	: user_id
		}
		$.post(url, sendData, function(rData){
			console.log(rData);
			if (rData == "introSuccess") {
				$("#wrIntro").replaceWith("<p id='wrIntro'>" + wr_intro + "</p>");
				$("#btnIntro").show();
				$("#btnIntroMod").attr("style", "margin-left:10px; display:none;");
				$("#btnIntroCancel").attr("style", "margin-left:10px; display:none;");
			}
		});
	});
});
</script>
<div class="container-fluid" style="background: #F5F5F5">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<div style="text-align: center; margin-top: 12px;">
				<h2 style="font-weight: 700">내 작업실 설정<a href="/workroom/main" class="fa fa-home" style="font-size:30px; margin-left:10px;"></a></h2>
			</div>
			<div class="checkout__order">
				<div class="workroom_box row">
					<h4 style="margin-bottom: 0px;" id="wrName">${workroomVo.wr_name}</h4>
					<button type="button" id="btnName" class="fa fa-pencil" style="margin-left:10px; height:20px; border:none; background:none; padding: 0;"></button>
					<button type="button" class="btn btn-primary btn-sm" id="btnNameMod" style="margin-left:10px; display:none;">변경</button>
					<button type="button" class="btn btn-warning btn-sm" id="btnNameCancel" style="margin-left:10px; display:none;">취소</button>
				</div>
					<hr>
				<div class="workroom_box row">
					<p id="wrIntro">${workroomVo.wr_intro}</p>
					<button type="button" class="fa fa-pencil" id="btnIntro" style="margin-left:10px; height:20px; border:none; background:none; padding: 0;"></button>
					<button type="button" class="btn btn-primary btn-sm" id="btnIntroMod" style="margin-left:10px; display:none;">변경</button>
					<button type="button" class="btn btn-warning btn-sm" id="btnIntroCancel" style="margin-left:10px; display:none;">취소</button>
				</div>
			</div>
			<!-- 보류 -->
<!-- 			<div class="checkout__order"> -->
<!-- 				<div class="workroom_box"> -->
<!-- 					<h4>나의 관심 취미</h4> -->
<!-- 				</div> -->
<!-- 				<div class="workroom_box"> -->
<!-- 					<hr> -->
<%-- 						<input type="radio" name="hobby">${workroomVo.cate_no1} --%>
<%-- 						<input type="radio" name="hobby">${workroomVo.cate_no2} --%>
<%-- 						<input type="radio" name="hobby">${workroomVo.cate_no3} --%>
<!-- 					</div> -->
<!-- 				</div> -->
			<div class="checkout__order">
				<div class="workroom_box">
					<h4>작업실 공개 여부</h4>
				</div>
				<div class="workroom_box">
					<hr>
					<p>공개</p>
				</div>
			</div>
			<div class="checkout__order">
				<div class="workroom_box">
					<h4>팔로잉 목록</h4>
				</div>
				<div class="workroom_box">
					<hr>
					<p>공개</p>
				</div>
			</div>
			<div class="checkout__order">
				<div class="workroom_box">
					<h4>북마크 목록</h4>
				</div>
				<div class="workroom_box">
					<hr>
					<p>공개</p>
				</div>
			</div>
</div>
			<div class="col-md-3"></div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>