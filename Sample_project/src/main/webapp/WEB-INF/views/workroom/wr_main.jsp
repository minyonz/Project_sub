<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<!-- jquery -->
<script>
$(document).ready(function() {
	// 애니메이션 효과 사용 보류
	// 스토리 더보기
	var txt = $(".story_detail").text().substring(0,100) + ". . .";
	console.log(txt);
// 	var txt_short = "<a href='/workroom/wr_story_detail style='color: #666666;'>" + txt + "</a>"
	var text = $("#story_detail").text().length;
	if (text >= 100) {
		$(".story_detail").text(txt);
// 		$("#story_detail").hover(function() {
// 			$(this).animate({fontSize: "16px"});}, function() {
// 				$(this).animate({fontSize: "14px"});});
	}
	
	$("#btnStSearch").click(function() {
		var txtStSearch = $("#txtStSearch").val();
		console.log(txtStSearch);	
		location.href = "/workroom/wr_search?txtStSearch=" + txtStSearch;
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
							<div style="display: flex; justify-content: center;">
							<h4 class="text-center" style="display:inline;">user1</h4><a href="#" class="fa fa-cog" style="margin-top:5px; margin-left:3px"></a>
							</div>
							<p class="text-center" style="font-size:12px; margin-top:-20px">곰손</p>
							<p class="card-text text-center">베이킹</p>
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
								<a href="#" class="btn btn-primary">팔로우</a> 
								<a href="#" class="btn btn-primary">쪽지</a> 
								<a href="/story/write" class="btn btn-primary">글쓰기</a>
							</div>
						</div>

					</div>
					<!-- 카테고리 -->
					<div class="checkout__order">
						<div class="blog__sidebar__item" style="margin-left: 40px;">
							<ul>
								<li><a href="#">소개</a></li>
								<li><a href="#hobby">꼼지락</a></li>
								<li><a href="#story">Story</a></li>
								<li><a href="#mbm">MadeByMe</a></li>
								<li><a href="#feed">피드</a></li>
							</ul>
						</div>
					</div>
					<div>
						<input type="text"
							style="border: 1px solid #E5E8E8; height: 30px;" id="txtStSearch">
						<button type="button" class="fa fa-search" 
						style="border:none; background:none; padding: 0;" id="btnStSearch"></button>
					</div>
				</div>
				<!-- 간단 카드 보여주기 -->
				<div class="col-md-9">
					<!-- 소개 -->
					<div class="checkout__order">
						<div class="workroom_box">
							<h4>작업실</h4>
						</div>
						<div class="workroom_box">
							<hr>
							<p>안녕하세요. 취미공유취미공유</p>
						</div>
					</div>
					<!-- 취미 -->
					<div class="checkout__order" id="hobby">
						<div class="workroom_box row" style="height:39px;">
							<h4>꼼지락</h4>
							<a href="/workroom/wr_hobby">더보기</a>
						</div>
							<hr>
						<div>
							<div class="row">
								<div class="categories__slider owl-carousel">
									<c:forEach begin="0" end="4" var="hobbyVo" items="${hobbyList}">
									<div class="col-lg-3">
										<div class="categories__item set-bg" data-setbg="/resources/img/test/sample06.jpg">
											<h5><a href="#">${hobbyVo.hobby_title}</a></h5>
										</div>
									</div>
									</c:forEach>
<!-- 									<div class="col-lg-3"> -->
<!-- 										<div class="categories__item set-bg" data-setbg="/resources/img/test/sample07.jpg"> -->
<!-- 											<h5><a href="#">test2</a></h5> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="col-lg-3"> -->
<!-- 										<div class="categories__item set-bg" data-setbg="/resources/img/test/sample08.jpg"> -->
<!-- 											<h5><a href="#">test3</a></h5> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="col-lg-3"> -->
<!-- 										<div class="categories__item set-bg" data-setbg="/resources/img/test/sample06.jpg"> -->
<!-- 											<h5><a href="#">test4</a></h5> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="col-lg-3"> -->
<!-- 										<div class="categories__item set-bg" data-setbg="/resources/img/test/sample07.jpg"> -->
<!-- 											<h5><a href="#">test5</a></h5> -->
<!-- 										</div> -->
<!-- 									</div> -->
								</div>
							</div>
						</div>
					</div>
					<!-- 스토리 -->
					<div class="checkout__order" id="story">
						<div class="workroom_box row" style="height:39px;">
							<h4>Story</h4>
							<a href="/story/list">더보기</a>
						</div>
						<div class="workroom_box">
							<hr>
							<div class="container-fluid">
							<c:forEach begin="0" end="2" var="storyVo" items="${storyList}">						
								<div class="row">
									<div class="col-md-10" style="padding: 0px; margin: auto;" >
										<p style="font-size: 14px; margin: 10px" class="story_detail"><a href="/story/detail?st_no=${storyVo.st_no}">
										${storyVo.st_content}</a><br>
										<a class="fa fa-heart-o" href="#" style="margin-right:5px"> ${storyVo.st_like_count}</a>
										<a class="fa fa-comment-o" href="/story/detail?st_no=${storyVo.st_no}"> ${storyVo.st_c_count}</a>
										</p>								
									</div>
									<div class="col-md-2" style="padding: 0px;">
										<img src="/resources/img/test/duck.png" width="100px">
									</div>
								</div>
								<hr>
							</c:forEach>
							</div>
						</div>
					</div>
					<!-- mbm -->
					<div class="checkout__order" id="mbm">
						<div class="workroom_box row" style="height:39px;">
							<h4>MadeByMe</h4>
							<a href="/workroom/wr_mbm">더보기</a>
						</div>
							<hr>
						<div>
							<div class="row">
								<div class="categories__slider owl-carousel">
									<div class="col-lg-3">
										<div class="categories__item set-bg" data-setbg="/resources/img/test/sample08.jpg">
											<h5><a href="#">test1</a></h5>
										</div>
									</div>
									<div class="col-lg-3">
										<div class="categories__item set-bg" data-setbg="/resources/img/test/sample06.jpg">
											<h5><a href="#">test2</a></h5>
										</div>
									</div>
									<div class="col-lg-3">
										<div class="categories__item set-bg" data-setbg="/resources/img/test/sample07.jpg">
											<h5><a href="#">test3</a></h5>
										</div>
									</div>
									<div class="col-lg-3">
										<div class="categories__item set-bg" data-setbg="/resources/img/test/sample06.jpg">
											<h5><a href="#">test4</a></h5>
										</div>
									</div>
									<div class="col-lg-3">
										<div class="categories__item set-bg" data-setbg="/resources/img/test/sample07.jpg">
											<h5><a href="#">test5</a></h5>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 피드 -->
					<div class="checkout__order" id="feed">
						<div class="workroom_box">
							<h4>피드</h4>
						</div>
						<div class="workroom_box">
							<hr>
							<p>안녕하세요. 피드피드피드피드</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>