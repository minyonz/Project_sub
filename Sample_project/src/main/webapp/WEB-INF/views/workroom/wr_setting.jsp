<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script>
$(document).ready(function() {
	// 작업실 이름
	// 수정 버튼 클릭 시 텍스트 입력으로 변경(수정버튼 비활성화)
	$("#btnWrName").click(function() {
		$("#wrName").replaceWith("<input type='text' id='wrName' style='border: 1px solid #E5E8E8; height: 30px;' value='${workroomVo.wr_name}'>");
		$("#btnWrName").attr("style", "margin-left:10px; height:20px; border:none; background:none; padding: 0; display:none");
		$("#btnWrNameMod").show();
		$("#btnWrNameModCancel").show();
	});
	
	// 수정취소(wrName에 원래상태로 붙여줌)
	$("#btnWrNameModCancel").click(function() {
		$("#wrName").replaceWith("<h4 style='margin-bottom:0px;' id='wrName'>${workroomVo.wr_name}</h4>");
		$("#btnWrName").show();
		$("#btnWrNameMod").attr("style", "margin-left:10px; display:none;");
		$("#btnWrNameModCancel").attr("style", "margin-left:10px; display:none;");
	});
	
	// 수정실행(완료되면 수정버튼 활성화 / 변경,취소 비활성화)
	$("#btnWrNameMod").click(function() {
		var wr_name = $("#wrName").val();
		var user_id = "${workroomVo.user_id}";
		var url = "/workroomset/nameSet";
		var sendData = {
			"wr_name" : wr_name,
			"user_id" : user_id
		}
		$.post(url, sendData, function(rData) {
			console.log(rData);
			if (rData == "success") {
				$("#wrName").replaceWith("<h4 style='margin-bottom:0px;' id='wrName'>" + wr_name + "</h4>");
				$("#btnWrName").show();
				$("#btnWrNameMod").attr("style", "margin-left:10px; display:none;");
				$("#btnWrNameModCancel").attr("style", "margin-left:10px; display:none;");
			}
		});
	});
	
	// 작업실 소개 
	// 수정 버튼 클릭 시 텍스트 입력으로 변경(수정버튼 비활성화)
	// input type="text"말ㄹ고 TEXTAREA로 변경해
	$("#wrIntro").click(function() {
		$("#wrIntro").replaceWith("<input type='text' id='wrIntro' style='border: 1px solid #E5E8E8; height: 30px;' value='${workroomVo.wr_intro}'>");
		$("#btnIntro").attr("style", "margin-left:10px; height:20px; border:none; background:none; padding: 0; display:none");
		$("#btnIntroMod").show();
		$("#btnIntroCancel").show();
	});
	
	// 수정취소(wrName에 원래상태로 붙여줌)
	$("#btnWrNameModCancel").click(function() {
		$("#wrName").replaceWith("<h4 style='margin-bottom:0px;' id='wrName'>${workroomVo.wr_name}</h4>");
		$("#btnWrName").show();
		$("#btnWrNameMod").attr("style", "margin-left:10px; display:none;");
		$("#btnWrNameModCancel").attr("style", "margin-left:10px; display:none;");
	});
	
	// 수정실행(완료되면 수정버튼 활성화 / 변경,취소 비활성화)
	$("#btnWrNameMod").click(function() {
		var wr_name = $("#wrName").val();
		var user_id = "${workroomVo.user_id}";
		var url = "/workroomset/nameSet";
		var sendData = {
			"wr_name" : wr_name,
			"user_id" : user_id
		}
		$.post(url, sendData, function(rData) {
			console.log(rData);
			if (rData == "success") {
				$("#wrName").replaceWith("<h4 style='margin-bottom:0px;' id='wrName'>" + wr_name + "</h4>");
				$("#btnWrName").show();
				$("#btnWrNameMod").attr("style", "margin-left:10px; display:none;");
				$("#btnWrNameModCancel").attr("style", "margin-left:10px; display:none;");
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
					<button type="button" id="btnWrName" class="fa fa-pencil" style="margin-left:10px; height:20px; border:none; background:none; padding: 0;"></button>
					<button type="button" class="btn btn-primary btn-sm" id="btnWrNameMod" style="margin-left:10px; display:none;">변경</button>
					<button type="button" class="btn btn-warning btn-sm" id="btnWrNameModCancel" style="margin-left:10px; display:none;">취소</button>
				</div>
				<div class="workroom_box">
					<hr>
					<p id="wrIntro">${workroomVo.wr_intro}
					<button type="button" class="fa fa-pencil" id="btnIntro" style="margin-left:10px; height:20px; border:none; background:none; padding: 0;"></button>
					</p>
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