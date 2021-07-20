<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script>
$(document).ready(function() {
// 파일첨부(보류)	
// 	$("#fileDrop").on("dragenter dragover", function(e){
// 		e.preventDefault();
// 	});
	
// 	$("#fileDrop").on("drop", function(e) {
// 		e.preventDefault();
// 		console.log(e);
// 	});
});
</script>
<!-- 스토리 수정 폼 -->
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
						<a href="#" class="fa fa-search"></a>
					</div>
				</div>
				<!-- 글작성 폼 -->
				<div class="col-md-9">
					<div class="checkout__order contact-form">
					 <form action="/workroom/wr_story_update_run" method="post">
                    <div class="col-lg-12 text-center">
                    <input type="hidden" name="st_no" value="${storyVo.st_no}" />
                        <textarea placeholder="스토리를 작성해 주세요." name="st_content" id="st_content">${storyVo.st_content}</textarea>
                        <div>
                        	<p style="text-align:left; font-size:13px; margin-bottom:-10px">첨부파일을 드래그 해 주세요</p>
                        	<div class="checkout__order" id="fileDrop"></div>
                        </div>
                        <button type="submit" class="site-btn">작성완료</button>
                    </div>
            		</form>
					</div>
			</div>
			<div class="col-md-2"></div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>