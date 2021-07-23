<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>


<div class="row">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-1 col-lg-2"></div>
			<div class="col-md-10 col-lg-8">

				<!-- 검색 카테고리 메뉴 -->
				<div class="row">
					<div class="col-md-3 col-lg-2">
					
						<nav id="navbar-example3"  style="position: fixed"
							class="navbar navbar-light flex-column align-items-stretch p-3 green_background">
							<a class="navbar-brand border-bottom" style="color: white" href="#">검색</a>
							<nav class="nav nav-pills flex-column">
								<a class="nav-link" style="color: white" href="#item-1">취미</a>
								<a class="nav-link" style="color: white" href="#item-2">작가</a>
								<a class="nav-link" style="color: white" href="#item-3">Made by Me</a>
								<nav class="nav nav-pills flex-column">
									<a class="nav-link ms-3 my-1" href="#item-3-1">Item 3-1</a>
									<a class="nav-link ms-3 my-1" href="#item-3-2">Item 3-2</a>
								</nav>
							</nav>
						</nav>
						
					</div>
					
					<!-- 검색 카테고리 메뉴 끝-->
					
					<!-- 검색 결과 -->
					<div class="col-md-9 col-lg-10">

						

						<div data-bs-spy="scroll" data-bs-target="#navbar-example3"
							data-bs-offset="0" tabindex="0">
							
							<table class="table">
							<thead>
								<tr><th scope="col">검색결과</th></tr>
							</thead>
							
							<tbody>
								<tr>
									<td>
										<div style="overflow:hidden;">
											<h4 id="item-1">취미</h4>
												<div class="col-lg-3 col-md-4 col-sm-6" style="float:left;">
													<div class="featured__item">
														<div class="featured__item__pic set-bg" data-setbg="/resources/img/featured/feature-1.jpg">
															<ul class="featured__item__pic__hover">
																<li><a href="#"><i class="fa fa-heart"></i></a></li>
																<li><a href="#"><i class="fa fa-retweet"></i></a></li>
																<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
															</ul>
														</div>
														<div class="featured__item__text">
															<h6><a href="#">제목</a></h6>
															<h5>작가</h5>
														</div>
													</div>
												</div>
												
												<div class="col-lg-3 col-md-4 col-sm-6" style="float:left;">
													<div class="featured__item">
														<div class="featured__item__pic set-bg" data-setbg="/resources/img/featured/feature-2.jpg">
															<ul class="featured__item__pic__hover">
																<li><a href="#"><i class="fa fa-heart"></i></a></li>
																<li><a href="#"><i class="fa fa-retweet"></i></a></li>
																<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
															</ul>
														</div>
														<div class="featured__item__text">
															<h6><a href="#">제목</a></h6>
															<h5>작가</h5>
														</div>
													</div>
												</div>
												
												<div class="col-lg-3 col-md-4 col-sm-6" style="float:left;">
													<div class="featured__item">
														<div class="featured__item__pic set-bg" data-setbg="/resources/img/featured/feature-3.jpg">
															<ul class="featured__item__pic__hover">
																<li><a href="#"><i class="fa fa-heart"></i></a></li>
																<li><a href="#"><i class="fa fa-retweet"></i></a></li>
																<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
															</ul>
														</div>
														<div class="featured__item__text">
															<h6><a href="#">제목</a></h6>
															<h5>작가</h5>
														</div>
													</div>
												</div>
												
												<div class="col-lg-3 col-md-4 col-sm-6" style="float:left;">
													<div class="featured__item">
														<div class="featured__item__pic set-bg" data-setbg="/resources/img/featured/feature-4.jpg">
															<ul class="featured__item__pic__hover">
																<li><a href="#"><i class="fa fa-heart"></i></a></li>
																<li><a href="#"><i class="fa fa-retweet"></i></a></li>
																<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
															</ul>
														</div>
														<div class="featured__item__text">
															<h6><a href="#">제목</a></h6>
															<h5>작가</h5>
														</div>
													</div>
												</div>
												
											</div>
							
									</td>
								</tr>
								
								<tr>
									<td>
										<div style="overflow:hidden;">
							<h4 id="item-2">작가</h4>

							<div class="col-lg-2 col-md-4 col-sm-6" style="float:left;">
								<div class="featured__item">

									<div class="featured__item__pic set-bg h-50" style="padding: 10px">
										<img src="/resources/img/featured/feature-2.jpg" class="rounded-circle" alt="..." />
										<ul class="featured__item__pic__hover">
											<li><a href="#"><i class="fa fa-heart"></i></a></li>
											<li><a href="#"><i class="fa fa-retweet"></i></a></li>
											<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
									<div class="featured__item__text">
										<h6><a href="#">작가2</a></h6>
										<h5>금손</h5>
									</div>
								</div>
							</div>
							
							<div class="col-lg-2 col-md-4 col-sm-6" style="float:left;">
								<div class="featured__item">

									<div class="featured__item__pic set-bg h-50" style="padding: 10px">
										<img src="/resources/img/featured/feature-2.jpg" class="rounded-circle" alt="..." />
										<ul class="featured__item__pic__hover">
											<li><a href="#"><i class="fa fa-heart"></i></a></li>
											<li><a href="#"><i class="fa fa-retweet"></i></a></li>
											<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
									<div class="featured__item__text">
										<h6><a href="#">작가2</a></h6>
										<h5>금손</h5>
									</div>
								</div>
							</div>
							
							<div class="col-lg-2 col-md-4 col-sm-6" style="float:left;">
								<div class="featured__item">

									<div class="featured__item__pic set-bg h-50" style="padding: 10px">
										<img src="/resources/img/featured/feature-2.jpg" class="rounded-circle" alt="..." />
										<ul class="featured__item__pic__hover">
											<li><a href="#"><i class="fa fa-heart"></i></a></li>
											<li><a href="#"><i class="fa fa-retweet"></i></a></li>
											<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
									<div class="featured__item__text">
										<h6><a href="#">작가2</a></h6>
										<h5>금손</h5>
									</div>
								</div>
							</div>
							
							<div class="col-lg-2 col-md-4 col-sm-6" style="float:left;">
								<div class="featured__item">

									<div class="featured__item__pic set-bg h-50" style="padding: 10px">
										<img src="/resources/img/featured/feature-2.jpg" class="rounded-circle" alt="..." />
										<ul class="featured__item__pic__hover">
											<li><a href="#"><i class="fa fa-heart"></i></a></li>
											<li><a href="#"><i class="fa fa-retweet"></i></a></li>
											<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
									<div class="featured__item__text">
										<h6><a href="#">작가2</a></h6>
										<h5>금손</h5>
									</div>
								</div>
							</div>
							
							</div>
									</td>
								</tr>
								
								<tr>
									<td>
										<div style="overflow:hidden;">
											<h4 id="item-3">Made by Me</h4>
												<div class="col-lg-3 col-md-4 col-sm-6" style="float:left;">
													<div class="featured__item">
														<div class="featured__item__pic set-bg" data-setbg="/resources/img/featured/feature-1.jpg">
															<ul class="featured__item__pic__hover">
																<li><a href="#"><i class="fa fa-heart"></i></a></li>
																<li><a href="#"><i class="fa fa-retweet"></i></a></li>
																<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
															</ul>
														</div>
														<div class="featured__item__text">
															<h6><a href="#">제목</a></h6>
															<h5>작가</h5>
														</div>
													</div>
												</div>
												
												<div class="col-lg-3 col-md-4 col-sm-6" style="float:left;">
													<div class="featured__item">
														<div class="featured__item__pic set-bg" data-setbg="/resources/img/featured/feature-2.jpg">
															<ul class="featured__item__pic__hover">
																<li><a href="#"><i class="fa fa-heart"></i></a></li>
																<li><a href="#"><i class="fa fa-retweet"></i></a></li>
																<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
															</ul>
														</div>
														<div class="featured__item__text">
															<h6><a href="#">제목</a></h6>
															<h5>작가</h5>
														</div>
													</div>
												</div>
												
												<div class="col-lg-3 col-md-4 col-sm-6" style="float:left;">
													<div class="featured__item">
														<div class="featured__item__pic set-bg" data-setbg="/resources/img/featured/feature-3.jpg">
															<ul class="featured__item__pic__hover">
																<li><a href="#"><i class="fa fa-heart"></i></a></li>
																<li><a href="#"><i class="fa fa-retweet"></i></a></li>
																<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
															</ul>
														</div>
														<div class="featured__item__text">
															<h6><a href="#">제목</a></h6>
															<h5>작가</h5>
														</div>
													</div>
												</div>
												
												<div class="col-lg-3 col-md-4 col-sm-6" style="float:left;">
													<div class="featured__item">
														<div class="featured__item__pic set-bg" data-setbg="/resources/img/featured/feature-4.jpg">
															<ul class="featured__item__pic__hover">
																<li><a href="#"><i class="fa fa-heart"></i></a></li>
																<li><a href="#"><i class="fa fa-retweet"></i></a></li>
																<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
															</ul>
														</div>
														<div class="featured__item__text">
															<h6><a href="#">제목</a></h6>
															<h5>작가</h5>
														</div>
													</div>
												</div>
												
											</div>
									</td>
								</tr>
								
							</tbody>
						</table>

							<h5 id="item-3-1">Item 3-1</h5>
							<p>...</p>
							<h5 id="item-3-2">Item 3-2</h5>
							<p>...</p>
						</div>
					</div>
				</div>
			</div>
			<!-- 검색 결과 끝 -->

			<div class="col-md-1 col-lg-2"></div>
		</div>
	</div>
</div>



<%@ include file="../include/footer.jsp" %>