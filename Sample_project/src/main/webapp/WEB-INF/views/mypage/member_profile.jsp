<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<!-- mypage/profileForm.jsp -->
<style>
	#fileDrop{
		width: 80%;
		height: 100px;
		background-color: yellow;
		margin: 20px auto;
		border: 2px dashed blue;
	}
.divUploaded{
	width: 150px;
	height: left;
}
</style>
<script src="/resources/js/my-script.js"></script>
<script>
$(document).ready(function(){
	$("#fileDrop").on("dragenter dragover", function(e){
		e.preventDefault();
	});
	
	$("#fileDrop").on("drop", function(e){
		e.preventDefault();
		// 이벤트 확인
		console.log(e);
		var file = e.originalEvent.dataTransfer.files[0];
		console.log(file);
		// 이미지파일(바이너리 파일)
		// <form enctype ="multipart/form-data">
		// 		<input type="file"/>
		// </form>
		var formData = new FormData(); // <form>
		formData.append("file", file); // <input type="file">
									   // -> 선택한 파일 (파일을 선택한 상태)
		// 파일을 비동기 방식으로 전송
		// enctype = "multipart/form-data"
		var url = "/uploadAjax"; // HomeController
		$.ajax({
			"processData" : false,
			"contentType" : false, 
			"url": url, 
			"method": "post",
			"data": formData,
			"success": function(receivedData){
				console.log(receivedData);
				// split(delim) uuid_origial ??? 
//				var arrStr = receivedData.split("_"); ???
				var fileName = receivedData.substring(
						receivedData.lastIndexOf("_") + 1);
				var cloneDiv = $("#uploadedList").prev().clone();
				// var fileName = arrStr[1];
				// alert(fileName);
				// $("#uploadedList").append("<span style='margin:10px'>" + fileName + "</span>");
				// $("#uploadedList").append("<img src='http://localhost/displayImage?fileName=" + receivedData + "'/>");
				var img = cloneDiv.find("img");
				// 이미지인 경우
				if(isImage(fileName)){
					img.attr("src", "http://localhost/displayImage?fileName=" + receivedData);
				}
				cloneDiv.find("span").text(fileName);
				cloneDiv.find(".a_times").attr("href", receivedData);
// 				// 모달창 띄우기
// 				$("#modal-167712").trigger("click");
// 				// 2초 뒤에 실행 되는 함수
// 				setTimeout(function(){
// 					$("#modal-167712 .close").trigger("click");
// 					$("#uploadedList").append(cloneDiv.show());
// 				}, 2000);
				$("#uploadedList").append(cloneDiv.show());
			}
		});
	});
	
	// 첨부파일 삭제 링크
	// $(".a_times").click(function() {}); -> 이런 방법으로 사용하면 안 됨
	$("#uploadedList").on("click", ".a_times", function(e){
		e.preventDefault();
		var that = $(this);
		console.log("클릭");
		var fileName = $(this).attr("href");
		console.log(fileName);
		var url = "/deleteFile?fileName=" + fileName;
		$.get(url, function(rData){
			if(rData == "success"){
				that.parent().remove();
			}
		});
	});
	
/* 	// 폼전송
	$("#frmWrite").submit(function(){
		var div = $("#uploadedList .divUploaded");
		$(this).find("[names^=files]").remove(); // 더블클릭할 수 있어서 추가한 부분...?
		div.each(function(index){
			var fileName = $(this).find(".a_times").attr("href");
			var html = "<input type='hidden' name = 'files["+ index +"]' value='"+ fileName +"'/>";
			$("#frmWrite").prepend(html);
		});
		
		return false;
	}); */
	
/* 	// 폼전송
	$("#frmWrite").submit(function() {
		console.log("폼전송 들어옴...")
		var div = $("#uploadedList .divUploaded");
		$(this).find("[names^=files]").remove();
		div.each(function(index) {
			var fileName = $(this).find(".a_times").attr("href");
			var html = "<input type='hidden' name='files["+index+"]' value='"+fileName+"'/>";
			$("#frmWrite").prepend(html);
		});
		
		// return false;
	}); */
});
</script>
<!-- 파일 업로드 안내 모달-->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<a id="modal-167712" href="#modal-container-167712" role="button"
				class="btn" data-toggle="modal" style="">Launch demo modal</a>

			<div class="modal fade" id="modal-container-167712" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">파일 처리</h5>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">파일을 업로드하는 중입니다...</div>
						<div class="modal-footer">
							<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
							<button type="button" class="btn btn-secondary"	data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<head>
<meta charset="UTF-8">
<title>프로필 정보</title>
</head>
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
						<%@ include file="mypage_include/mypage_left.jsp"%>
					</div>
					<div class="col-md-9">
						<!-- 내부 패널 메인 -->
						<form role="form" id="frmProfile" action="joinRun" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label for="user_id"> 닉네임</label> 
								<input type="text" class="form-control" id="user_id" name="user_id" /> 
								<br/>
								<button type="button" class="btn btn-small btn-danger"
									id="btnCheckDupId">닉네임 중복 확인</button>
								<span id="checkDupIdResult"></span>
							</div>
							<div class="form-group">
								<label for="floatingTextarea2">프로필 정보</label> 
							  	<textarea class="form-control" placeholder="프로필을 입력해주세요..." id="floatingTextarea2" 
							  			style="height: 100px"></textarea>
							</div>
						<div class="form-group">
<!-- 							<label for="exampleInputFile">사진</label>  -->
<!-- 							<input type="file" class="form-control-file" id="file" name="file" /> -->
						</div>

						<!-- 첨부 파일  -->
						<div class="form-group">
							<label for="exampleInputFile">사진</label> 
							<input type="file"/>
								<label>첨부할 파일을 드래그 &amp; 드롭하세요.</label>
							<div id="fileDrop"></div>
						</div>
						
<!-- 						<div class="sc-1xjzf4m-0 bXMjXX"></div> -->
<!-- 						<div class="sc-1ov8bm8-2 dMXdMC">이미지를 여기로 끌어다 놓거나, 여기를 눌러 파일을 선택하세요.</div> -->
<!-- 						<input type="file" accept="image/*" multiple="" class="sc-5d51x-0 gSOqCo"/></div> -->
						
						
						<!-- // 첨부 파일  -->
						
						<!-- 상단 폼전송 클릭에서 맞추는 부분 var div = $("#uploadedList .divUploaded");  -->
						<div style ="display:none" class="divUploaded"> 
							<img height = "100" src="/resources/img/default_image.png"
								class ="img-rounded"/><br>
								<span>default</span> 
								<a href = "#" class="a_times">&times;</a>
						</div>
						
						<div id ="uploadedList">
							
						</div>
							<button type="submit" class="btn btn-primary">프로필 저장</button>
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