<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
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
							<img src="/resources/img/test/duck.png" width="300px" style="display: block; margin: 0px auto; margin-top:50px">
						</div>
						<!-- 스토리 전체 내용 -->
						<div style="margin: 50px">
							<p>
							모더나와 화이자 백신은 바이러스 단백질을 만드는 기반인 유전 정보 일부를 주사해 해당 단백질에 대한 항체를 생성해 면역을 획득하는 mRNA 방식이 사용되고 있다. 
							양사의 백신은 2회 투여 후 6개월이 경과한 시점에서도 유효하다는 연구 결과가 보고된 바 있다. 항체에 집중한 이전 연구에서는 
							"항체는 일반적으로 몇 주~몇 달이 경과하면 사라지기 때문에 면역이 오래 유지되지 않을 가능성이 있다"는 내용이 발표됐다.</p>
						<hr>
						</div>
						<div class="row" style="margin: 50px">
							<p>좋아요 1 </p>
							<p>댓글수 3 </p>
						</div>
						
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>