<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- 스토리 상세 폼 -->
<script>
$(document).ready(function() {
	// 댓글 입력 
	$("#btnCommentInsert").click(function() {
		var st_c_content = $("#txtComment").val();
		console.log(txtComment);
		var st_no = parseInt("${storyVo.st_no}");
		console.log(st_no);
		var url = "/st_comment/comment_write";
		var sendData = {
			"st_c_content" : st_c_content,
			"st_no"		   : st_no
		}
		$.post(url, sendData, function(rData) {
			console.log(rData);
			if (rData == "success") {
				
			}
		});
	});
	
	
	
	// 답글
	$("#commentReply").click(function(e) {
		e.preventDefault();
		console.log("답글클릭함");
// 		$("#span").html("<div class='row'><div class='col-md-10'>" + 
// 		"<textarea class='form-control' style='height:50px; resize:none;'></textarea></div>" + 
// 		"<div class='col-md-2'><button type='button' style='width:50px; height:30px' class='site-btn' id='btnInsert'>입력</button></div></div>");
	});
	
});
</script>
<div class="container-fluid" style="background: #F5F5F5">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-3">
					<div class="checkout__order">
						<!-- 유저 카드 프로필 -->
						<div class="box" style="margin: 12px auto;">
							<a href="/workroom/wr_main"><img class="profile" src="/resources/img/test/littleduck.png"
								alt="profile image" style="width: 100%; text-align: center"></a>
						</div>
						<div class="card-body">
							<h4 class="text-center">user1</h4>
							<p class="card-text text-center">안녕하세요</p>
							<div style="text-align: center;">
								<div style="display: inline-block;">
									<p style="margin-bottom: -5px">팔로워</p>
									<p style="text-align: center">5</p>
								</div>
								<div style="display: inline-block;">
									<p style="margin: -2px">
										<img src="/resources/img/test/minus.png" height="25px">
									</p>
									<p>
										<img src="/resources/img/test/minus.png" height="25px">
									</p>
								</div>
								<div style="display: inline-block;">
									<p style="margin-bottom: -5px">좋아요</p>
									<p style="text-align: center">5</p>
								</div>
							</div>
							<div style="text-align: center;">
								<a href="#" class="btn btn-primary">팔로우</a> <a href="#"
									class="btn btn-primary">쪽지</a> <a href="#"
									class="btn btn-primary">글쓰기</a>
							</div>
						</div>

					</div>
					<!-- 카테고리 -->
					<div class="checkout__order">
						<div class="blog__sidebar__item" style="margin-left: 40px;">
							<ul>
								<li><a href="#">소개</a></li>
								<li><a href="/workroom/wr_hobby">꼼지락</a></li>
								<li><a href="#">Story</a></li>
								<li><a href="/workroom/wr_mbm">MadeByMe</a></li>
								<li><a href="#">피드</a></li>
							</ul>
						</div>
					</div>
					<div>
						<input type="text"
							style="border: 1px solid #E5E8E8; height: 30px;">
						<button type="button"
							style="border: none; background: none; padding: 0;">
							<img src="/resources/img/test/loupe.png" height="17px">
						</button>
					</div>
				</div>
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
									<a class="fa fa-heart-o" href="#" style="margin-right: 5px">
										${storyVo.st_like_count}</a> <a class="fa fa-comment-o" href="#">
										${storyVo.st_c_count}</a>
								</div>
								<div class="col-md-3">
									<div style="text-align: right">
										<a href="/workroom/wr_story_update?st_no=${storyVo.st_no}"
											style="margin-right: 5px">수정</a> <a href="#">삭제</a>
									</div>
								</div>
							</div>
							<!-- 댓글 -->
							<div style="margin-top: 30px">
								<h3>댓글</h3>
								<hr>
								<div class="row">
									<div class="col-md-10">
										<div class="blog__details__author">
											<div class="blog__details__author__pic">
												<a href="#"><img
													src="/resources/img/test/littleduck.png" alt=""></a>
											</div>
											<div class="blog__details__author__text">
												<h6>작성자 이름 2021-07-20 15:08:27</h6>
												<span>댓글내용내용내용내용</span>
												<a href="#" style="font-size:13px" id="commentReply">답글</a>
												<br>
												<span id="span"></span>
											</div>
										</div>
									</div>
									<div class="col-md-2">
										<div style="text-align: right">
											<a href="#" style="margin-right: 5px; font-size:13px;">수정</a> 
											<a href="#" style="font-size:13px;">삭제</a>
										</div>
									</div>
								</div>
							</div>
							<!-- 댓글작성 -->
							<div class="row" style="margin-top: 30px">
								<div class="col-md-10">
									<textarea class="form-control" style="width:100%; resize:none;" id="txtComment"></textarea>
								</div>
								<div class="col-md-2">
									<button type="button" class="site-btn" id="btnCommentInsert">입력</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-2"></div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>