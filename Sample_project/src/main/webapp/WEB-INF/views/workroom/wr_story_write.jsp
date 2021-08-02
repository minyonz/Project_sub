<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/workroomSide.jsp"%>
<script src="${contextPath}/resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/sweetalert2.min.css">
<style>
.btn-cancle {
    padding: 9px 30px;
    font-size: 18px;
    /* line-height: 1.3333333; */
    /* border-radius: 3px; */
    margin: 0 4px;
    border: 1px solid #ccc;
}

.story_write_pic_add {
    width: 140px;
    height: 140px;
    border: 1px solid #ddd;
    background: #f7f7f7;
    color: #ababab;
    margin: 0;
    padding: 0;
    border-radius: 0;
    font-size: 18px;
    vertical-align: top;
}
</style>
<script>
$(document).ready(function() {	
	$("#frmStory").submit(function() {
		var st_content = $("#st_content").val();
		if (st_content.trim() == "" || st_content == null) {
			console.log("내용입력");
			$("#msg").text("스토리 내용을 입력해 주세요.");
			$("#st_content").focus();
			return false;
		}
		$(this).submit();
	});
});
</script>
<!-- 글작성 폼 -->
<div class="col-md-9">
	<div class="checkout__order contact-form">
		<form id="frmStory" action="/story/write_run" method="post">
		<div class="row" style="margin-top:10px; justify-content: center;">
			<div class="divCompleteImg" style="margin-right:20px; height: 200px;">
				<label class="storyImg_label" for="story_file" style="border: 1px solid #e1e1e1;">
					<img id="previewImg_story" class="previewImg_compl" 
						src="${contextPath}/resources/images/preview_img.jpg" style="width:200px; height:200px;  cursor: pointer;">
				</label>
				<input type="file" class="story_file" id="story_file" accept=".gif, .jpg, .png" 
				onchange="previewStoryImg(this);" style="display:none;width:0px;height:0px;font-size:0px;">
				<input type="hidden" class="storyImg_hidden" data-exist="0" id="st_img" name="st_img"/>
				<div style="position: relative;bottom: 9.3rem;">
					<a id="btnDelStoryImg" href="javascript:delStoryImg()" 
						class="btn_del btn_delStoryImg" style="float:right; display:none"></a>
				</div>
			</div>		
		</div>
		<br>
		<!-- 임시 -->
<!-- 			<div class="divMainImg" style="position: relative;"> -->
<!-- 				<label for="mainImg_file" id="mainImg_label" style="overflow: hidden;"> -->
<%-- 					<img class="card-img rounded" id="previewImg_main" src="${contextPath}/resources/images/main_img_btn.jpg" --%>
<!-- 					style="object-fit: cover; cursor: pointer; border: 1px solid #e1e1e1;"> -->
<!-- 				</label> -->
<!-- 				<input type="file" class="mainImg_file" name="mainImg_file" id="mainImg_file" accept=".gif, .jpg, .png" -->
<!-- 				onchange="previewMainImg(this);" style="display: none; width: 0px; height: 0px; font-size: 0px;" /> -->
<!-- 				<input type="hidden" name="st_img" id="st_img"  required/> -->
<!-- 				<a id="btnDelMainImg" href="javascript:delMainImg()" class="btn_del" -->
<!-- 				style="position: absolute; top: 0; right: 0.1rem;"></a> -->
<!-- 			</div> -->
			<div class="col-lg-12 text-center">
				<span id="msg"></span>
				<textarea placeholder="스토리를 작성해 주세요." name="st_content"
					id="st_content"></textarea>
<!-- 				<div> -->
<!-- 					<button type="button" class="story_write_pic_add"> -->
<!-- 						<p class="fa fa-plus" style="width:40px; height:40px; margin-top:18px; margin-bottom:0px; font-size:30px; color:#1f5e43;"/> -->
<!-- 					</button> -->
<!-- 					<input type="file" class="mainImg_file" name="mainImg_file" id="mainImg_file" accept=".gif, .jpg, .png" -->
<!-- 					onchange="previewMainImg(this);" style="display: none; width: 0px; height: 0px; font-size: 0px;" /> -->
<!-- 					<input type="hidden" name="e_img" id="e_img"  required/> -->
<!-- 				</div> -->
<!-- 				<br> -->
				<button type="submit" class="site-btn">등록</button>
				<a href="/story/list/${page_id}" class="btn-cancle">취소</a>
			</div>
		</form>
	</div>
</div>
<div class="col-md-2"></div>
</div>
</div>

<%@ include file="../include/footer.jsp"%>

<script>
function calcFileName(thumbPath) {
	// var rootIndex;
	// const home = 21;
	// const yj = 12;
	// const team;
	var rootIndex = 12;
	// -> /test ~ 이런식으로 대쉬부터 시작하는 값으로 설정해놔야함 ! 
	
	console.log(thumbPath);
	var str = thumbPath.substring(rootIndex);
	var prefix = str.substring(0, str.lastIndexOf("/") + 1);
	console.log(prefix);
	console.log("str", str);
	var thumbName = str.substring(str.lastIndexOf("/") + 1);
	var splits = thumbName.split("_");
	console.log(splits);
	var suffix = "";
	for (var v = 1; v < splits.length; v++) {
		if (v == (splits.length - 1)) {
			suffix += splits[v];
			break;
		}
		suffix += splits[v] + "_";
	}
	var fileName = prefix + suffix;
	
	return fileName;
}

//ajax, 사진넣기
function previewStoryImg(targetObj) {
	if (targetObj.files.length == 0){
		// hidden에 값변화 없게하기 (그대로 두기 일단 값 확인해보고)
		// 보여주는건(미리보기) 파일선택취소 누르기전이미지로 
		console.log("$('#st_img').val()", $('#st_img').val());
		return false;
	}
	
	var file = targetObj.files[0];
	console.log("파일존재");
	var formData = new FormData();
	formData.append("file", file);
	// sort의 storyImg(Controller의 case문)
	formData.append("sort", "storyImg");
	
	var url = "/story/uploadImg";
	
	$.ajax({
		"processData" : false,
		"contentType" : false,
		"url" : url,
		"method" : "post",
		"data" : formData,
		"success" : function(thumbPath) {
			var fileName = calcFileName(thumbPath);
			console.log("fileName:" + fileName);
			// 1. hidden에 값 넣기 
			$("#st_img").val(fileName);
			// 2. 프리뷰이미지 보여주기 
			$("#previewImg_story").attr("src", "/story/displayImage?filePath=" + thumbPath);
			console.log("$('#st_img').val()", $('#st_img').val());
			$("#btnDelStoryImg").show();
		},
		"error" : function() {
			alert("사진 업로드에 실패하였습니다.");
		},
		"beforeSend" : function() {
			$("#previewImg_main").attr("src", "${contextPath}/resources/images/loading.gif");
		},
		"complete" : function() {
			console.log("로딩끝")
		}
	});
}
	
function delStoryImg() {
	console.log("삭제")
	var fileName = $("#st_img").val();
	console.log(fileName);
	var url = "/story/deleteFile?fileName=" + fileName;
	$.get(url, function(rData) {
		if (rData == "success") {
			$("#st_img").val("");
			$("#previewImg_story").attr("src", "${contextPath}/resources/images/preview_img.jpg");
			$("#btnDelStoryImg").css("display", "none");
		}
	})
}

</script>