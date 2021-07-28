<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/workroomSide.jsp"%>
<script src="/resources/js/my-script.js"></script>
<!-- 스토리 상세 폼 -->
<script>
$(document).ready(function() {
	// 스토리 삭제
	$("#storyDel").click(function(e) {
		e.preventDefault();
		if (confirm("삭제하시겠습니까?")) {
			location.href = "/story/delete_run?st_no=${storyVo.st_no}";
		}
	});
	
	// 댓글 보이기
	var url = "/st_comment/list";
	var st_no = parseInt("${storyVo.st_no}");
	var sendData = { "st_no" : st_no }
		$.get(url, sendData, function(rData) {
			var commentHtml = "";
			$.each(rData, function() {
				commentHtml += "<div class='row' style='margin-top: 15px; margin-bottom:15px'>";
				commentHtml += "	<div class='col-md-10'>";
				commentHtml += "		<div class='blog__details__author'>";
				commentHtml += "			<div class='blog__details__author__pic'>";
				commentHtml += "				<a href='#'><img src='/resources/img/test/littleduck.png' alt=''></a></div>"
				commentHtml += "					<div class='blog__details__author__text'>";
				commentHtml += "						<h6>"+ this.user_id + " " + changeDateString(this.reg_date) + "</h6>";
				commentHtml += "							<span id='content'>" + this.st_c_content + "</span></div></div></div>";
				commentHtml += "	<div class='col-md-2'><div style='text-align: right'>";
				commentHtml += "		<a href='#' style='margin-right:5px; font-size:13px;' id='commentMod' data-content=" + this.st_c_content + ">수정</a>"
				commentHtml += "		<a href='#' style='font-size:13px;' id='commentDel' data-cno=" + this.st_c_no + ">삭제</a></div></div></div><hr>"
				$("#comment").html(commentHtml);
				
				$("commentMod").click(function() {
					console.log("클릭");
				});
			});
	});
	
	// 댓글 입력 
	$("#btnCommentInsert").click(function() {
		var st_c_content = $("#txtComment").val();
		console.log(txtComment);
		var st_no = parseInt("${storyVo.st_no}");
		console.log(st_no);
		var url = "/st_comment/write";
		var sendData = {
			"st_c_content" : st_c_content,
			"st_no"		   : st_no
		}
		$.post(url, sendData, function(rData) {
			if (rData.success) {
				$("#txtComment").val("");
				$("#commentList").text(" " + rData.commentCount);
				var url = "/st_comment/list";
				var st_no = parseInt("${storyVo.st_no}");
				var sendData = { "st_no" : st_no }
					$.get(url, sendData, function(rData) {
						console.log(rData);
						var commentHtml = "";
						$.each(rData, function() {
							// 입력했을 때 댓글 새로 로딩
							commentHtml += "<div class='row' style='margin-top: 15px; margin-bottom:15px'>";
							commentHtml += "	<div class='col-md-10'>";
							commentHtml += "		<div class='blog__details__author'>";
							commentHtml += "			<div class='blog__details__author__pic'>";
							commentHtml += "				<a href='#'><img src='/resources/img/test/littleduck.png' alt=''></a></div>"
							commentHtml += "					<div class='blog__details__author__text'>";
							commentHtml += "						<h6>" + this.user_id + " " + changeDateString(this.reg_date) + "</h6>";
							commentHtml += "							<span id='content'>" + this.st_c_content + "</span></div></div></div>";
							commentHtml += "	<div class='col-md-2'><div style='text-align: right'>";
							commentHtml += "		<a href='#' style='margin-right: 5px; font-size:13px;' id='commentMod' data-content=" + this.st_c_content + ">수정</a>"
							commentHtml += "		<a href='#' style='font-size:13px;' id='commentDel' data-cno=" + this.st_c_no + ">삭제</a></div></div></div><hr>"
							$("#comment").html(commentHtml);
						});
				});
			}
		});
	});
	
	$("#comment").on("click", "#commentMod", function(e) {
		e.preventDefault();
		var st_c_content = $(this).attr("data-content");
		var commentModHtml = "";
		commentModHtml += "<div class='row'><div class='col-md-9'>";
		commentModHtml += "<textarea class='form-control' style='width: 100%; resize: none; id='txtCommentMod'>" + st_c_content + "</textarea></div>";
		commentModHtml += "<div class='col-md-3'>";
		commentModHtml += "<button type='button' class='site-btn' id='btnCommentMod'>수정</button></div></div>";
		$("#content").replaceWith(commentModHtml);
		$("#btnCommentMod").click(function() {
			var txtCommentMod = $("#txtCommentMod").val();
			console.log(txtCommentMod);			
		});
	});
	
	// 댓글 삭제
	$("#comment").on("click", "#commentDel", function(e) {
		e.preventDefault();
		console.log("삭제");
		// 현재 댓글을 감싸고 있는 div
		var div = $(this).parent().parent().parent();
		// 감싼 div다음 hr
		var hr = div.next();
		if (confirm("댓글을 삭제하시겠습니까?")) {
			var url = "/st_comment/delete";
			var st_c_no = $(this).attr("data-cno");
			var st_no = parseInt("${storyVo.st_no}");
			var sendData = {
				"st_no" 	: st_no,
				"st_c_no" 	: st_c_no
			}
			$.get(url, sendData, function(rData) {
				console.log(rData);
				if (rData.success) {
					div.attr("style", "display:none;");
					hr.remove();
					$("#commentList").text(" " + rData.commentCount);
				}
			});
		}
	});
	
	// 답글
	$("#commentReply").click(function(e) {
		e.preventDefault();
// 		console.log("답글클릭함");
// 		$("#span").html("<div class='row'><div class='col-md-10'>" + 
// 		"<textarea class='form-control' style='height:50px; resize:none;'></textarea></div>" + 
// 		"<div class='col-md-2'><button type='button' style='width:50px; height:30px' class='site-btn' id='btnInsert'>입력</button></div></div>");
	});
	
	// 좋아요 유지
	if ("${likeCheck}" == 1) {
		$("#like").attr("class", "fa fa-heart");
	}
	
	// 좋아요
	$("#like").click(function(e) {
		e.preventDefault();
		var url = "/story/like/${storyVo.st_no}";
		$.get(url, function(rData) {
			console.log(rData.likeCount);
			if (rData.like) {
				$("#like").attr("class", "fa fa-heart");
			} else if (rData.cancel) {
				$("#like").attr("class", "fa fa-heart-o");
			}
			$("#like > span").text(rData.likeCount);
		});
	});
	
});
</script>
<!-- 간단 카드 보여주기 -->
<div class="col-md-9">
	<div class="checkout__order">
		<div class="workroom_box row" style="height: 39px;">
			<h4>Story detail</h4>
		</div>
		<hr>
		<div>
			<img src="/resources/img/test/duck.png" width="300px"
				style="display: block; margin: 0px auto; margin-top: 50px">
		</div>
		<!-- 스토리 전체 내용 -->
		<div style="margin: 50px">
			<p>${storyVo.st_content}</p>
			<hr>
			<div class="row">
				<div class="col-md-9">
					<a class="fa fa-heart-o" href="#" style="margin-right: 5px; color:#FF5454"
						id="like"><span style="color:#666666; margin-left: 5px;">${storyVo.st_like_count}</span></a>
					<button type="button" class="fa fa-comment-o"
						style="border: none; background: none; padding: 0; margin-right: 5px; color: #666666;"
						id="commentList"> ${storyVo.st_c_count}</button>
				</div>
				<div class="col-md-3">
					<div style="text-align: right">
						<a href="/story/update?st_no=${storyVo.st_no}" style="margin-right: 5px">수정</a> 
						<a href="#" id="storyDel">삭제</a>
					</div>
				</div>
			</div>
			<!-- 댓글작성 -->
			<div class="row" style="margin-top: 30px">
				<div class="col-md-10">
					<textarea class="form-control" style="width: 100%; resize: none;"
						id="txtComment"></textarea>
				</div>
				<div class="col-md-2">
					<button type="button" class="site-btn" id="btnCommentInsert">입력</button>
				</div>
			</div>
			<!-- 댓글 -->
			<div style="margin-top: 30px;">
				<h3>댓글</h3>
				<hr>
				<span id="comment"></span>
				<!-- 댓글 수정 -->
				<div class="row updateComment"
					style="margin-top: 30px; display: none;">
					<div class="col-md-10">
						<textarea class="form-control" style="width: 100%; resize: none;"
							id="txtComment"></textarea>
					</div>
					<div class="col-md-2">
						<button type="button" class="site-btn" id="btnCommentInsert">입력</button>
					</div>
				</div>
<!-- 댓글목록 -->
<%-- 								<c:forEach var="commentVo" items="${list}"> --%>
<!-- 								<div class="row" style="margin-top: 15px; margin-bottom:15px"> -->
<!-- 									<div class="col-md-10"> -->
<!-- 										<div class="blog__details__author"> -->
<!-- 											<div class="blog__details__author__pic"> -->
<!-- 												<a href="#"><img -->
<!-- 													src="/resources/img/test/littleduck.png" alt=""></a> -->
<!-- 											</div> -->
<!-- 											<div class="blog__details__author__text"> -->
<%-- 												<h6>${commentVo.user_id} ${commentVo.reg_date}</h6> --%>
<%-- 												<span>${commentVo.st_c_content }</span> --%>
<!-- 												<a href="#" style="font-size:13px" id="commentReply">답글</a> -->
<!-- 												<br> -->
<!-- 												<span id="span"></span> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="col-md-2"> -->
<!-- 										<div style="text-align: right"> -->
<!-- 											<a href="#" style="margin-right: 5px; font-size:13px;">수정</a>  -->
<!-- 											<a href="#" style="font-size:13px;">삭제</a> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<hr> -->
<%-- 								</c:forEach> --%>
			</div>
		</div>
	</div>
</div>
<div class="col-md-2"></div>
</div>
</div>

<%@ include file="../include/footer.jsp"%>