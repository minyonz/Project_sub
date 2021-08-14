<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>
<style>
.tiledBackground {
  wiedth: 100%;
   height: 400px; 
}
.btn-more {
   padding: 3px 13px;
   font-size: 14px;
   padding-top: 7px;
   margin: 0 4px;
   border: 1px solid #1F5E43;
}
</style>
<!-- 배너 -->
<div class="row">
	<div class="col-md-12" style="padding-bottom: 20px">
	
	<div class="tiledBackground green_background row" style="position: relative;"></div>
	
		<div class="row"  style="position: relative; top: -400px;">
			<div class="col-md-2"></div>
			<div class="col-md-8">
			
							
				<div class="carousel slide" id="carousel-313760">
					<ol class="carousel-indicators" style="bottom: 6rem;">
					<c:forEach var="v" begin="${pagingDto.startPage}" end="${pagingDto.count}">
						<li data-slide-to="${v}" data-target="#carousel-313760"
							<c:if test="${v == pagingDto.page}">
								class="active"
						 	</c:if>
							></li>
					</c:forEach>
					</ol>
					
					<div class="carousel-inner">
					
					<c:forEach var="event" items="${mainEvent}">
						<div 
						<c:choose>
							<c:when test="${pagingDto.page == event.rnum}">
								class="carousel-item active"
						 	</c:when>
						 	<c:otherwise>
						 		class="carousel-item"
							</c:otherwise>
						</c:choose>
						>
							<a href="/main/mainEventContent?e_no=${event.e_no}">
							<img class="d-block w-100" alt="Event Banner"
								src="/eventImg/displayImage?filePath=${event.e_img}" height="500"/></a>
							<div class="carousel-caption">
							<div style="display: flex;" >
								<h4><a href="/main/mainEventContent?e_no=${event.e_no}">${event.e_title}</a></h4>
								<p style="margin-left: auto;">${event.start_date} ~ ${event.end_date}</p>
							</div>
								
							</div>
						</div>
					</c:forEach>
						
						
					</div>
					<a class="carousel-control-prev" href="#carousel-313760"
						data-slide="prev" style="height: 500px"><span class="carousel-control-prev-icon"></span>
						<span class="sr-only">Previous</span></a> <a  style="height: 500px"
						class="carousel-control-next" href="#carousel-313760"
						data-slide="next"><span class="carousel-control-next-icon"></span>
						<span class="sr-only">Next</span></a>
				</div>
				
				
				<c:if test="${user_id != null}">
				<!-- 추천취미 -->
				<div class="row" style="margin-top: 50px">
					<div class="col-md-2">
						<div style="margin-right: 40px">
						<h5>추천취미</h5>
						<p>
						
						<c:if test="${cateStrVo.cate_no1 != '선택안함'}">
							${cateStrVo.cate_no1} <br/>
						</c:if>
						<c:if test="${cateStrVo.cate_no2 != '선택안함'}">
							${cateStrVo.cate_no2} <br/>
						</c:if>
						<c:if test="${cateStrVo.cate_no3 != '선택안함'}">
							${cateStrVo.cate_no3} <br/>
						</c:if>
						</p>
						
						</div>
						
					</div>
					<div class="col-md-10">
						<!-- Categories Section Begin -->
				<section class="categories">

					<div class="container">
						<div class="row">
							<div class="categories__slider owl-carousel">

								<c:forEach var="suggestHobby" items="${suggestHobby}">
								<div class="featured__item">
									<div class="featured__item__pic set-bg hobbyImg" data-setbg="/displayImage?filePath=${suggestHobby.main_img}"
										style="margin-left: 10px; margin-right: 10px">
									</div>
										<div class="featured__item__text">
										<h6><a class="short_title col-8" href="/hobby/content/${suggestHobby.hobby_no}">${suggestHobby.hobby_title}</a></h6>
										<h5><a class="short" href="/workroom/main/${suggestHobby.user_id}">${suggestHobby.user_nick}</a></h5>
									</div>
								</div>
								</c:forEach>

							</div>
						</div>
					</div>
				</section>
				<!-- Categories Section End -->
					</div>
				</div>
				<!-- 추천취미 끝 -->
				</c:if>
				
				<!-- 인기취미 -->
				<!-- Categories Section Begin -->
				<section class="section-title" style="margin-top: 50px">

				<div style="display: flex;">
						<h5>인기 취미</h5>
						<a href="/main/mainHobby?qCheck=0" type="button" class="btn-more"
						style="margin-left: auto; margin-bottom: 20px">더보기</a>
				</div>
					<div class="container">
						<div class="row">
							<div class="categories__slider owl-carousel">

								<c:forEach var="popular" items="${popularHobby}">
								<div class="featured__item">
									<div class="featured__item__pic set-bg" data-setbg="/displayImage?filePath=${popular.main_img}"
										style="margin-left: 10px; margin-right: 10px">
									</div>
										<div class="featured__item__text">
										<h6><a class="short_title col-8" href="/hobby/content/${popular.hobby_no}">${popular.hobby_title}</a></h6>
										<h5><a class="short" href="/workroom/main/${popular.user_id}">${popular.user_nick}</a></h5>
									</div>
								</div>
								</c:forEach>
								

								
						</div>
					</div>
					</div>
				</section>
				<!-- Categories Section End -->
				<!-- 인기취미 끝 -->
				
				<!-- 작가어워드 -->
				<!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>작가 어워드</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">전체</li>
                            <li data-filter=".grade4">금손</li>
                            <li data-filter=".grade3">은손</li>
                            <li data-filter=".grade2">곰손</li>
                            <li data-filter=".grade1">맨손</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
            
            <c:forEach var="member1" items="${popularMember1}">
                <div class="col-lg-2 col-md-4 col-sm-6 mix grade${member1.user_grade}">
                    <div class="featured__item">
                    
                        <div class="featured__item__pic set-bg h-50" style="padding: 30px">
                        <a href="/workroom/main/${member1.user_id}">
                        <c:choose>
                        <c:when test="${member1.user_img != null}">
                        	<img src="/displayImage?filePath=${member1.user_img}" class="rounded-circle" alt="profileImage"/>
                        </c:when>
                        <c:otherwise>
                        	<img src="/resources/img/noprofile.png" class="rounded-circle" alt="profileImage"/>
                        </c:otherwise>
                        </c:choose>
                        
                        
                        </a>
                        </div>
                        <div class="featured__item__text">
                            <h6><a class="short" href="/workroom/main/${member1.user_id}">${member1.user_nick}</a></h6>
                            <h5>${member1.name}</h5>
                        </div>
                    </div>
                </div>
                </c:forEach>
            <c:forEach var="member2" items="${popularMember2}">
                <div class="col-lg-2 col-md-4 col-sm-6 mix grade${member2.user_grade}">
                    <div class="featured__item">
                    
                        <div class="featured__item__pic set-bg h-50" style="padding: 30px">
                        <a href="/workroom/main/${member2.user_id}">
                        <c:choose>
                        <c:when test="${member2.user_img != null}">
                        	<img src="/displayImage?filePath=${member2.user_img}" class="rounded-circle" alt="profileImage"/>
                        </c:when>
                        <c:otherwise>
                        	<img src="/resources/img/noprofile.png" class="rounded-circle" alt="profileImage"/>
                        </c:otherwise>
                        </c:choose>
                        </a>
                        </div>
                        <div class="featured__item__text">
                            <h6><a class="short" href="/workroom/main/${member2.user_id}">${member2.user_nick}</a></h6>
                            <h5>${member2.name}</h5>
                        </div>
                    </div>
                </div>
                </c:forEach>
            <c:forEach var="member3" items="${popularMember3}">
                <div class="col-lg-2 col-md-4 col-sm-6 mix grade${member3.user_grade}">
                    <div class="featured__item">
                    
                        <div class="featured__item__pic set-bg h-50" style="padding: 30px">
                        <a href="/workroom/main/${member3.user_id}">
                        <c:choose>
                        <c:when test="${member3.user_img != null}">
                        	<img src="/displayImage?filePath=${member3.user_img}" class="rounded-circle" alt="profileImage"/>
                        </c:when>
                        <c:otherwise>
                        	<img src="/resources/img/noprofile.png" class="rounded-circle" alt="profileImage"/>
                        </c:otherwise>
                        </c:choose>
                        </a>
                        </div>
                        <div class="featured__item__text">
                            <h6><a class="short" href="/workroom/main/${member3.user_id}">${member3.user_nick}</a></h6>
                            <h5>${member3.name}</h5>
                        </div>
                    </div>
                </div>
                </c:forEach>
            <c:forEach var="member4" items="${popularMember4}">
                <div class="col-lg-2 col-md-4 col-sm-6 mix grade${member4.user_grade}">
                    <div class="featured__item">
                    
                        <div class="featured__item__pic set-bg h-50" style="padding: 30px">
                        <a href="/workroom/main/${member4.user_id}">
                        <c:choose>
                        <c:when test="${member4.user_img != null}">
                        	<img src="/displayImage?filePath=${member4.user_img}" class="rounded-circle" alt="profileImage"/>
                        </c:when>
                        <c:otherwise>
                        	<img src="/resources/img/noprofile.png" class="rounded-circle" alt="profileImage"/>
                        </c:otherwise>
                        </c:choose>
                        </a>
                        </div>
                        <div class="featured__item__text">
                            <h6><a class="short" href="/workroom/main/${member4.user_id}">${member4.user_nick}</a></h6>
                            <h5>${member4.name}</h5>
                        </div>
                    </div>
                </div>
                </c:forEach>
                
               
                
            </div>
        </div>
    </section>
    <!-- Featured Section End -->
				<!-- 작가어워드 끝-->
				
			</div>
			
			<div class="col-md-2"></div>
		</div>
	</div>
</div>
<!-- 배너 끝 -->


<!-- 인기 키워드 -->

<div class="row" style="position: relative; top: -400px;">
<!-- 		<div class="col-md-12"> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-md-2"> </div> -->
<!-- 				<div class="col-md-8"> -->
<!-- 				<div style="display: flex;"> -->
<!-- 						<h5>인기 키워드</h5> -->
<!-- 						<a href="/main/mainHobby?qCheck=0" type="button" class="btn-more" -->
<!-- 						style="margin-left: auto; margin-bottom: 20px">더보기</a> -->
<!-- 				</div> -->
					
					
<!-- 				</div> -->
<!-- 				<div class="col-md-2"></div> -->
<!-- 			</div> -->
<!-- 			<div class="row green_background"> -->
<!-- 				<div class="col-md-12"> -->
<!-- 					<div class="row" style="padding: 20px"> -->
<!-- 						<div class="col-md-2"></div> -->
<!-- 						<div class="col-md-8"> -->
						
<!-- 						<div> -->
<!-- 							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1키워드1</button> -->
<!-- 							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1</button> -->
<!-- 							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1</button> -->
<!-- 							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1키워드1</button> -->
<!-- 							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1키워드1</button> -->
<!-- 							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1</button> -->
<!-- 							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1키워드1</button> -->
<!-- 							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1</button> -->
							
<!-- 							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1</button> -->
<!-- 							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1</button> -->
<!-- 							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1키워드1</button> -->
<!-- 							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1키워드1</button> -->
<!-- 							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1</button> -->
<!-- 							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1키워드1</button> -->
<!-- 							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1</button> -->
<!-- 							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1키워드1</button> -->
<!-- 							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1</button> -->
<!-- 							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1</button> -->
<!-- 						</div> -->
						
<!-- 						</div> -->
<!-- 						<div class="col-md-2"> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</div>

<!-- 인기 키워드 끝 -->

<!-- 이달의 취미 -->
<div class="row"  style="position: relative; top: -400px;">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">


				<!-- Categories Section Begin -->
				<section class="categories" style="margin-top: 50px">

					<div style="display: flex;">
						<h5>이달의 취미</h5>
						<a href="/main/mainHobby?qCheck=2" type="button" class="btn-more"
						style="margin-left: auto; margin-bottom: 20px">더보기</a>
					</div>
					<div class="container">
						<div class="row">
							

							<div class="categories__slider owl-carousel">

								<c:forEach var="month" items="${monthHobby}">
								<div class="featured__item">
									<div class="featured__item__pic set-bg" data-setbg="/displayImage?filePath=${month.main_img}"
										style="margin-left: 10px; margin-right: 10px">
									</div>
										<div class="featured__item__text">
										<h6><a class="short_title col-8" href="/hobby/content/${month.hobby_no}">${month.hobby_title}</a></h6>
										<h5><a class="short" href="/workroom/main/${month.user_id}">${month.user_nick}</a></h5>
									</div>
								</div>
								</c:forEach>

								
							</div>
						</div>
					</div>
				</section>
				<!-- Categories Section End -->
				<!-- 베스트메이드 -->
				<!-- Categories Section Begin -->
				<section class="categories" style="margin-top: 50px">

					<div style="display: flex;">
						<h5>베스트 메이드</h5>
						<a href="/main/mainHobby?qCheck=2" type="button" class="btn-more"
						style="margin-left: auto; margin-bottom: 20px">더보기</a>
					</div>
					<div class="container">
						<div class="row">

							<div class="categories__slider owl-carousel">

								<c:forEach var="made" items="${bestMade}">
								<div class="featured__item">
									<div class="featured__item__pic set-bg" data-setbg="/displayImage?filePath=${made.mbm_img}"
										style="margin-left: 10px; margin-right: 10px">
									</div>
										<div class="featured__item__text">
										<h6><a class="short_title col-8" href="/mbm/detail/user_id=${made.user_id}?hobby_no=${made.hobby_no}&mbm_no=${made.mbm_no}">${made.mbm_content}</a></h6>
										<h5><a class="short" href="/workroom/main/${made.user_id}">${made.user_nick}</a></h5>
									</div>
								</div>
								</c:forEach>

								
							</div>
						</div>
					</div>
				</section>
				<!-- Categories Section End -->
				<!-- 베스트메이드 끝 -->
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</div>
<!-- 이달의 취미 끝 -->


</div>			
	<!-- Bootstrap core JS-->
<!-- 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script> -->
	<!-- Core theme JS-->
	<script src="/resources/js/scripts.js"></script>
	    <!-- Footer Section Begin -->
    <footer class="footer spad bg-dark" style="position: relative; top: -350px;">
        <div class="container" >
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="/main/mainHome"><img src="/resources/img/logo_h_w.png" alt="logo"></a>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="">
                        <h6 class="text-white font-weight-bold">About Us</h6><br/>
                        <ul style="list-style:none;">
                            <li class="text-white">Team Name: 개발자국</li>
                            <li class="text-white">Project Name: 꼼지락</li>
                        </ul>
                       
                    </div>
                </div>
                <div class="col-lg-5 col-md-12">
                    <div class="" >
                        <h6 class="text-white font-weight-bold">Team Member</h6><br/>
                        <ul style="list-style:none; margin-bottom: 20px">
                            <li class="text-white">김태연 : kty1788@nate.com</li>
                            <li class="text-white">서지효 : wlgyjam@gmail.com</li>
                            <li class="text-white">김민영 : als543413@gmail.com</li>
                            <li class="text-white">하윤지 : ijnooyah@gmail.com</li>
                        </ul>
                        
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text text-white"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;2021 Created By Dogprint
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                        
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>								
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" ></script>
    <script src="/resources/js/jquery-3.3.1.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery.nice-select.min.js"></script>
    <script src="/resources/js/jquery-ui.min.js"></script>
    <script src="/resources/js/jquery.slicknav.js"></script>
    <script src="/resources/js/mixitup.min.js"></script>
    <script src="/resources/js/owl.carousel.min.js"></script>
    <script src="/resources/js/main.js"></script>


	

</body>
</html>