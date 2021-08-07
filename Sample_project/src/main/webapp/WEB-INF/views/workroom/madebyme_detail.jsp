<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<script src="/resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="/resources/css/sweetalert2.min.css">
<script>
$(document).ready(function() {
	var loginVo = "${loginVo}";
	
	// 좋아요 유지
	if ("${likeCheck}" == 1) {
		$("#like").attr("class", "fa fa-heart");
	}
	
	//좋아요
	$("#like").click(function(e) {
		e.preventDefault();
		if (loginVo == "") {
			alert("로그인이 필요한 서비스입니다.");
			return false;
		}
		var url = "/mbm/like/${madebymeVo.mbm_no}";
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
})
</script>
<div class="container-fluid" style="background: #F5F5F5">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<div class="checkout__order contact-form">
			<div class="container-fluid">
			<div style="text-align: center">
				<h4>MadeByMe</h4>
				<hr>
			</div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
							<div class="row">
								<div class="col-md-5" style="height: 167px;">
									<img src="/displayImage?filePath=${hobbyVo.main_img}"
										style="width: 100%; height: 100%; object-fit: cover;">
								</div>
								<div class="col-md-7" style="padding: 0px; margin: auto;">
									<p style="margin: 10px" id="hobby_detail">
										<a href="/hobby/content/${hobbyVo.hobby_no}" style="font-size:20px; font-weight: bold" id="hobbyContent">
										${hobbyVo.hobby_title}</a><br><br>
										<span>${hobbyVo.hobby_intro}</span>
									</p>
								</div>
							</div>
						</div>
					<div class="col-md-2"></div>
				</div>
				
			</div>
			</div>
			<!-- 후기 -->
			<div class="checkout__order contact-form">
			<div class="workroom_box row" style="height: 39px; margin-top: -10px;">
				<div class="blog__details__author">
					<div class="blog__details__author__pic">
						<a href="/workroom/main/${madebymeVo.user_id}"><img src="/displayImage?filePath=${madebymeVo.user_img}" alt=""></a>
					</div>
					<div class="blog__details__author__text">
						<h6 style="margin-top: 10px;">${madebymeVo.user_nick}</h6>
					</div>
				</div>
			</div>
			<hr>
				<div style="text-align: right">
			<p>${madebymeVo.reg_date}</p>
			<c:if test="${madebymeVo.mod_date != null}">
				<p style="font-size:13px;">${madebymeVo.mod_date}(수정 됨)</p>
			</c:if>
			<p>조회수 : ${madebymeVo.view_cnt}</p>
		</div>
		<div>
			<c:if test="${madebymeVo.mbm_img != null}">
				<img src="/img/displayImage?filePath=${madebymeVo.mbm_img}" width="300px" 
				style="display: block; margin: 0px auto; margin-top: 50px">
			</c:if>
		</div>
		<!-- 스토리 전체 내용 -->
		<div style="margin: 50px">
			<c:choose>
				<c:when test="${madebymeVo.level_no == 1}">
					<p style="font-weight:bold;">체감 난이도 : 😆very easy</p>
				</c:when>
				<c:when test="${madebymeVo.level_no == 2}">
					<p style="font-weight:bold;">체감 난이도 : 😃easy</p>
				</c:when>
				<c:when test="${madebymeVo.level_no == 3}">
					<p style="font-weight:bold;">체감 난이도 : 🙂normal</p>
				</c:when>
				<c:when test="${madebymeVo.level_no == 4}">
					<p style="font-weight:bold;">체감 난이도 : 😧hard</p>
				</c:when>
				<c:when test="${madebymeVo.level_no == 5}">
					<p style="font-weight:bold;">체감 난이도 : 😱crazy</p>
				</c:when>
			</c:choose>
			<p>${madebymeVo.mbm_content}</p>
			<hr>
			<div class="row">
				<div class="col-md-9">
					<a class="fa fa-heart-o" href="#" style="margin-right: 5px; color:#FF5454" id="like">
					<span style="color:#666666; margin-left: 5px;">${madebymeVo.like_cnt}</span>
					</a>
				</div>
				<div class="col-md-3">
					<div style="text-align: right">
					<c:if test="${user_id != null || user_id == page_id}">
						<a href="/mbm/update?hobby_no=${hobbyVo.hobby_no}&mbm_no=${madebymeVo.mbm_no}" style="margin-right: 5px">수정</a> 
						<a href="javascript:doDelete();">삭제</a>
					</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	<div class="col-md-3"></div>
</div>
<%@ include file="../include/footer.jsp"%>
<script>
function doDelete() {
	Swal.fire({
		text: '삭제하시겠습니까?', 
		allowOutsideClick: false,
		iconColor: "#1f5e43",
		icon: 'question', 
		confirmButtonText: "확인",
		confirmButtonColor: "#1f5e43",
		cancelButtonText: "취소",
		showCancelButton: true,
	}).then(function(result) {
		if(result.isConfirmed) {
			location.href = "/mbm/deleteRun?mbm_no=${madebymeVo.mbm_no}&hobby_no=${madebymeVo.hobby_no}";
		} 
	});
}
</script>