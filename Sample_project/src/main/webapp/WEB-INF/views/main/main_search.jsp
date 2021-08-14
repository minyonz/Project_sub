<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>
<script>
$(document).ready(function() {
	
	$(".pagination > a").click(function(e) {
		e.preventDefault(); // 페이지 이동 막기
		var page = $(this).attr("href");
		var frmPaging = $("#frmPaging");
		frmPaging.find("[name=page]").val(page); // page에 페이지 숫자 넣어줌
		console.log(page);
		frmPaging.submit();
		// -> 주소창에 : http://localhost/board/listAll?page=1&perPage=10&searchType=&keyword=
	});
	
});
</script>
<form id="frmPaging" action="/main/mainSearch" method="get">
<input type="hidden" name="page" value="${pagingDto.page}"/>
<input type="hidden" name="perPage" value="${pagingDto.perPage}"/>
<input type="hidden" name="keyword" value="${pagingDto.keyword}"/>
</form>
<div class="row m_top">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-1 col-lg-2"></div>
			<div class="col-md-10 col-lg-8">

				<!-- 검색 카테고리 메뉴 -->
				<div class="row">
					<div class="col-md-3 col-lg-2">
					
						<nav id="navbar-example3"  style="position: fixed;"
							class="navbar navbar-light flex-column align-items-stretch p-3 orange_color">
							<a class="navbar-brand border-bottom orange_color" href="#">검색</a>
							<nav class="nav nav-pills flex-column">
								<a class="nav-link text-gray" href="#hobby">취미</a>
								<a class="nav-link text-gray" href="#member">작가</a>
								<a class="nav-link text-gray" href="#made">Made by Me</a>
							</nav>
						</nav>
					</div>
					
					<!-- 검색 카테고리 메뉴 끝-->
					
					<!-- 검색 결과 -->
					<div class="col-md-9 col-lg-10">

						

						<div data-bs-spy="scroll" data-bs-target="#navbar-example3"
							data-bs-offset="0" tabindex="0">
							<h5>검색결과</h5>
							<table class="table">
							
							
							<tbody>
								<tr>
									<td>
										<div style="overflow:hidden;">
											<h4 id="hobby" class="m_top m_bottom">취미</h4>
											
											<c:forEach var="hobby" items="${searchHobbyList}">
												<div class="col-lg-3 col-md-4 col-sm-6" style="float:left;">
													<div class="featured__item">
														<div class="featured__item__pic set-bg" data-setbg="/displayImage?filePath=${hobby.main_img}" onclick="location.href='/hobby/content/${hobby.hobby_no}';" style="cursor: pointer;">
														</div>
														
														<div class="featured__item__text">
															<h6><a class="short_title" href="/hobby/content/${hobby.hobby_no}">${hobby.hobby_title}</a></h6>
															<h5><a class="short" href="/workroom/main/${hobby.user_id}">${hobby.user_nick}</a></h5>
														</div>
													</div>
												</div>
												</c:forEach>
											</div>
							
									</td>
								</tr>
								
								<tr>
									<td>
										<div style="overflow:hidden;">
							<h4 id="member" class="m_top m_bottom">작가</h4>

							<c:forEach var="member" items="${searchMemberList}">
							<div class="col-lg-2 col-md-4 col-sm-6" style="float:left;">
								<div class="featured__item">

									<div class="featured__item__pic set-bg h-50" style="padding: 10px">
										
										<a href="/workroom/main/${member.user_id}">
				                        <c:choose>
				                        <c:when test="${member.user_img != null}">
				                        	<img src="/displayImage?filePath=${member.user_img}" class="rounded-circle" alt="profile" />
				                        </c:when>
				                        <c:otherwise>
				                        	<img src="/resources/img/noprofile.png" class="rounded-circle" alt="profile" />
				                        </c:otherwise>
				                        </c:choose>
				                        </a>
									</div>
									<div class="featured__item__text">
										<h6><a class="short" href="/workroom/main/${member.user_id}">${member.user_nick}</a></h6>
										<h5>${member.name}</h5>
									</div>
								</div>
							</div>
							</c:forEach>
							
							</div>
									</td>
								</tr>
								
								<tr>
									<td>
										<div style="overflow:hidden;">
											<h4 id="made" class="m_top m_bottom">Made by Me</h4>
											<c:forEach var="made" items="${searchMadeList}">
											
												<div class="col-lg-3 col-md-4 col-sm-6" style="float:left;">
													<div class="featured__item">
														<div class="featured__item__pic set-bg" data-setbg="/displayImage?filePath=${made.mbm_img}" onclick="location.href='/mbm/detail/user_id=${made.user_id}?hobby_no=${made.hobby_no}&mbm_no=${made.mbm_no}';" style="cursor: pointer;">
														</div>
														<div class="featured__item__text">
															<h6><a class="short_title col-8" href="/mbm/detail/user_id=${made.user_id}?hobby_no=${made.hobby_no}&mbm_no=${made.mbm_no}">${made.mbm_content}</a></h6>
															<h5><a class="short" href="/workroom/main/${made.user_id}">${made.user_nick}</a></h5>
														</div>
													</div>
												</div>
												</c:forEach>
												
												
												
											</div>
									</td>
								</tr>
								
							</tbody>
						</table>

							
						</div>
						<!-- 페이징 -->
						<div class="product__pagination justify-content-center pagination" style="display: flex">
						<c:if test="${pagingDto.startPage != 1}">
		                        <a href="${pagingDto.startPage - 1}"><i class="fa fa-long-arrow-left"></i></a>
		                </c:if>
		                <c:forEach var="v" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
		                	<a
		                		<c:choose>
									<c:when test="${v == pagingDto.page}">
										class="green_background" style="color: white;"
								 	</c:when>
								 	<c:otherwise>
								 		class="page-item"
									</c:otherwise>
								</c:choose>
		                        href="${v}">${v}</a>
		                </c:forEach>
		                <c:if test="${pagingDto.endPage < pagingDto.totalPage}">
		                        <a href="${pagingDto.endPage + 1}"><i class="fa fa-long-arrow-right"></i></a>
		                </c:if>
		                </div>
		                <!-- 페이징 끝 -->
					</div>
				</div>
			</div>
			<!-- 검색 결과 끝 -->
			

			<div class="col-md-1 col-lg-2"></div>
		</div>
	</div>
	
</div>


<%@ include file="../include/footer.jsp" %>