<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta property="og:title" content="${hobbyVo.hobby_title }" />
<meta property="og:url" content="${url}" />
<meta property="og:image" content="/displayImage?filePath=${rootPath}${hobbyVo.main_img}" />
<meta property="og:description" content="${hobbyVo.hobby_intro}">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
$(document).ready(function() {
	selectCommentList();
});
</script>
<title>상세보기</title>
<!-- 내가 설정한 style -->
<style>
/* <내가 한 style> */
/* 1. 전체 큰 영역 */

/* 2. 후기 */
.review-row{
 padding-top: 10px;
 border-bottom: 2px solid #c1c1c1;
}

.review-content p{
/* 	max-height: 4.8em; */
	overflow: hidden;
	display: -webkit-box;
	-webkit-line-clamp: 6;
	-webkit-box-orient: vertical;
}

.comment-row{
 padding-top: 10px;
 padding-bottom: 10px;
 border-bottom: 2px solid #c1c1c1;
}

.comment-row.recomment-row{
 padding-left: 60px;
 padding-top: 10px;
 padding-bottom: 10px;
 border-bottom: 2px solid #c1c1c1;
}



.btnMenu {
	background: url("${contextPath}/resources/images/menu.png") no-repeat center; 
	outline : none;
	border: none;
	width: 25px;
	height: 25px;
}

.btnMenu_cmt {
	background: url("${contextPath}/resources/images/menu.png") no-repeat center; 
	background-size: 15px;
	outline : none;
	border: none;
	width: 15px;
	height: 15px;
}

.container_north {
	border-bottom : 3px solid #1f5e43;
}

.body {
    margin-bottom: 40px;
    margin-top: 40px;
}

.green {
 color: #1f5e43;
}

.displayNone {
display:none;
}
#hobby_title{
text-align: center;
color: #1f5e43;
font-size: 27px;
font-weight: 700;
}

#hobby_intro{
text-align: center;
color: #1f5e43;
font-weight: 550;
}

#reg_date{
color: #1f5e43;
font-weight: 550;
}

#view_cnt{
color: #1f5e43;
float: right;
font-weight: 550;
}

.mainImg_cont{
	overflow: hidden;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 500px;
    height: 400px;
}

#main_img{
object-fit: cover;
height: 100%;
width: 100%;
}


.user_row, .time_row, .cost_row, 
.level_row {
height: 90px;
}

.sm_tit{
font-weight:550;
color: #1f5e43;
}


/* carousel 슬라이드 */
.carousel {
	margin: 0 auto;
	width: 900px;
/* 	height:1100px; */
}

.carousel-inner {
    position: relative;
    justify-content: center;
    align-items: center;
    overflow: hidden;
    border: hidden;
    width: 900px;
    height: auto;
}
.carousel-item{
/* 	height: 1100px; */
    overflow: hidden;
}

.slideImg{
	width: 100%;
    height: 100%;
    object-fit: cover;
}

.extra_tip {
    background: url(/resources/images/lamp.png) left -2px no-repeat;
/*     background-size: 26px 26px; */
}
.extra_note {
    background: url(/resources/images/note.png) left -2px no-repeat;
/*     background-size: 26px 26px; */
}
.extra_link {
    background: url(/resources/images/link.png) left -2px no-repeat;
/*     background-size: 26px 26px; */
}
.step_extra {
    font-size: 16px!important;
    color: #888;
    padding: 0 0 0 32px!important;
    line-height: 1.6;
    margin: 14px 0 14px 0;
}

@media screen and (min-width: 1300px) {
.container_north, .cotainer_south {
  display: grid; 
  grid-auto-flow: column dense; 
  grid-template-columns: 1fr 2.5fr 1fr; 
  grid-template-rows: 1fr; 
  gap: 0px 0px; 
  grid-template-areas: 
    "side-left body side-right"; 
  justify-content: end; 
  width: 100%; 
  height: 100%; 
}
.side-left { grid-area: side-left; }
.body { grid-area: body; }
.side-right { grid-area: side-right; }
 }

</style>
<!-- 가져온 스타일 -->
<style>
/* 1. 만들기 css */
.view_step {padding:0 0 10px;}
.view_step_cont {padding:6px 0 60px 50px; width:850px; font-size:22px;}
.view_step_cont.step1 {background:url(//recipe1.ezmember.co.kr/img/icon_step_1.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step2 {background:url(//recipe1.ezmember.co.kr/img/icon_step_2.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step3 {background:url(//recipe1.ezmember.co.kr/img/icon_step_3.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step4 {background:url(//recipe1.ezmember.co.kr/img/icon_step_4.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step5 {background:url(//recipe1.ezmember.co.kr/img/icon_step_5.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step6 {background:url(//recipe1.ezmember.co.kr/img/icon_step_6.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step7 {background:url(//recipe1.ezmember.co.kr/img/icon_step_7.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step8 {background:url(//recipe1.ezmember.co.kr/img/icon_step_8.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step9 {background:url(//recipe1.ezmember.co.kr/img/icon_step_9.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step10 {background:url(//recipe1.ezmember.co.kr/img/icon_step_10.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step11 {background:url(//recipe1.ezmember.co.kr/img/icon_step_11.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step12 {background:url(//recipe1.ezmember.co.kr/img/icon_step_12.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step13 {background:url(//recipe1.ezmember.co.kr/img/icon_step_13.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step14 {background:url(//recipe1.ezmember.co.kr/img/icon_step_14.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step15 {background:url(//recipe1.ezmember.co.kr/img/icon_step_15.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step16 {background:url(//recipe1.ezmember.co.kr/img/icon_step_16.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step17 {background:url(//recipe1.ezmember.co.kr/img/icon_step_17.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step18 {background:url(//recipe1.ezmember.co.kr/img/icon_step_18.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step19 {background:url(//recipe1.ezmember.co.kr/img/icon_step_19.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step20 {background:url(//recipe1.ezmember.co.kr/img/icon_step_20.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step21 {background:url(//recipe1.ezmember.co.kr/img/icon_step_21.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step22 {background:url(//recipe1.ezmember.co.kr/img/icon_step_22.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step23 {background:url(//recipe1.ezmember.co.kr/img/icon_step_23.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step24 {background:url(//recipe1.ezmember.co.kr/img/icon_step_24.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step25 {background:url(//recipe1.ezmember.co.kr/img/icon_step_25.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step26 {background:url(//recipe1.ezmember.co.kr/img/icon_step_26.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step27 {background:url(//recipe1.ezmember.co.kr/img/icon_step_27.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step28 {background:url(//recipe1.ezmember.co.kr/img/icon_step_28.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step29 {background:url(//recipe1.ezmember.co.kr/img/icon_step_29.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step30 {background:url(//recipe1.ezmember.co.kr/img/icon_step_30.gif) no-repeat 4px 6px; background-size:36px;}
.view_step_cont img {border-radius:3px; max-width:100%; height:auto; margin:20px 0 10px;}
.view_step_cont .media-left {padding-right:20px;}
.view_step_cont .media-left img {margin:0;}
.media-body, .media-left, .media-right {
    display: table-cell;
    vertical-align: top;
}
.media-body {
    width: 10000px;
    word-break: break-all;
}
.view_step .view_step_cont .media-left img {max-width:300px;}
/* .view_step_tip {padding-bottom:40px;} */
/* .view_step_tip dd {font-size:20px; padding:20px 32px 0;} */
/* .view_step_tip.st2 {padding:30px 0 40px 0; clear:both; margin-left:-21px;} */
/* .view_step_tip.st2 dd {padding:14px 28px 0; font-size:16px; line-height:1.6;} */
.view_step .carousel .carouItem img {max-width:100%;}
.view_step_cont .none {display:none;}
/* .view_step_cont .carousel.slide {border:none; box-shadow:none; margin:0; padding:0;} */
/* .view_step_cont .media-left .carousel.slide {width:300px;} */
.view_step_cont .media-left {width:300px;}
/* .view_step_cont .carousel-control {padding:0;} */
/* .view_step_cont .carousel-indicators {bottom:-36px;} */
/* .view_step_cont .carousel-indicators li {width:10px; height:10px;} */




/* 2. 탭 css (후기, 댓글) */
.tab-head{
padding-left: 0px !important;
padding-right: 0px !important;
}
.nav-item a:focus{
outline: unset;
}
.nav-item a:hover{
border: 1px solid #fff !important;
}
.nav-item a{
color: black !important;
font-weight: 600;
padding-left: 28px;
padding-right: 28px;
}
.nav-item .active{
color: #5741A3 !important;
border:none !important;
border-bottom: 3px solid #5741A3 !important;
font-weight: 600;
}
.nav-item .active:hover{
border:none !important;
border-bottom: 3px solid #5741A3 !important;
}
.nav-tabs{
border-bottom: none !important;
}
.tab-pane h5{
border-left: 4px solid #5741A3;
}
.tab-pane p{
/* border-top: 1px solid #c1c1c1; */
}


/* 3. pagination */
.pagination_rounded,
.pagination_square {
    display: inline-block;
    padding-top: 20px;
}

.pagination_rounded ul {
    margin: 0;
    padding: 0;
    list-style: none
}

.pagination_rounded li:first-child {
    margin-left: 0px
}

.pagination_rounded ul li {
    float: left;
    margin-left: 10px
}

.pagination_rounded ul li a:hover {
    background: #4285f4;
    color: #fff;
    border: 1px solid #4285f4
}

a:link {
    text-decoration: none;
}

.pagination_rounded .prev {
    margin-left: 0px;
    border-radius: 35px;
    width: 90px;
    height: 34px;
    line-height: 34px
}

.pagination_rounded ul li a {
    float: left;
    color: #4285f4;
    border-radius: 50%;
    line-height: 30px;
    height: 30px;
    width: 30px;
    text-align: center;
    margin-bottom: 40px;
    border: 1px solid #e0e0e0
}

.pagination_rounded .prev i {
    margin-right: 10px
}

.pagination_rounded .next {
    border-radius: 35px;
    width: 90px;
    height: 34px;
    line-height: 34px
}

.visible-xs {
    display: none !important;
}

/* URL*/
figure[data-ke-type='opengraph'] a {
    box-sizing: border-box;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    box-shadow: 0 2px 4px 0 rgb(0 0 0 / 4%);
    border: solid 1px rgba(0, 0, 0, 0.06);
    text-decoration: none;
    color: #000;
}
figure[data-ke-type='opengraph'] div.og-image {
   border-right: solid 1px rgba(0, 0, 0, 0.06);
    width: 100px;
    height: 100px;
    background-size: cover;
    background-position: center;
}
figure[data-ke-type='opengraph'] div {
    position: relative;
}
figure[data-ke-type='opengraph'] div.og-text {
    flex-grow: 1;
/* height: 130px; */
padding-left: 40px;
}
figure[data-ke-type='opengraph'] p.og-title {
color: #000000;
padding-bottom: 10px;
max-width: 467px;
text-overflow: ellipsis;
white-space: nowrap;
margin: 0px;
    overflow: hidden;
}
figure[data-ke-type='opengraph'] .og-desc {
    margin: 0px;
    max-width: 467px;
    text-overflow: ellipsis;
    overflow: hidden;
    font-family: 'Noto Sans', 'Noto Sans KR';
    font-size: 14px;
    font-weight: 300;
    font-style: normal;
    font-stretch: normal;
    line-height: normal;
    letter-spacing: normal;
    color: #909090;
    max-height: 42px;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    display: -webkit-box;
}
</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<!-- id4로 로그인 한상태라고 가정 -->
<input type="hidden" name="user_id" value="ID4"/>
<div class="container-fluid">
	<!-- 취미글 메인부분 -->
	<div class="container_north">
		<div class="side side-left"></div>
		<div class="body">
		<!-- 카테고리 -->
			<div style="text-align: center;">
				<span class="btn btn-outline-light btn-sm green_background">
					${hobbyVo.l_cate_name}
				</span>
				<span class="btn btn-outline-light btn-sm green_background">
					${hobbyVo.m_cate_name}
				</span>
			</div>
			<!-- 핵심 부분 컨테이너 -->
				<!-- 수정/ 삭제 버튼을 위한 메뉴 -->
				<div class="dropdown" style="float:right">
					<button class="btnMenu" type="button" id="dropdownMenuButton" data-toggle="dropdown">
					</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						 <a class="dropdown-item" href="#">수정</a> 
						 <a class="dropdown-item" href="#">삭제</a>
					</div>
				</div>
				<!--//  수정/ 삭제 버튼을 위한 메뉴 -->
				<div id="hobby_title">${hobbyVo.hobby_title}</div>
				<div id="hobby_intro">${hobbyVo.hobby_intro}</div>
				<div><span id="reg_date">작성일  : ${hobbyVo.reg_date }</span><span id="view_cnt">조회수 : ${hobbyVo.view_cnt }</span></div>
				<div class="row">
					<div class="col-md-7">
						<div class="mainImg_cont">
							<img id="main_img" src="/displayImage?filePath=${rootPath}${hobbyVo.main_img}"/>
						</div>
					</div>
					<div class="col-md-5">
						<div class="user_row">
							<div class="row sm_tit">
								작가
							</div>
							<a href="#프로필링크">
							<img class="rounded-circle circle-image" 
								src="/displayImage?filePath=${rootPath}${hobbyVo.user_img}"
								style="width:2.2rem;"/> 
								${hobbyVo.user_name} >
							</a>
						</div>
						<div class="time_row">
							<div class="row sm_tit">
								소요시간
							</div>
							<span class="fa fa-clock-o"></span>${hobbyVo.time_name}
						</div>
						<div class="cost_row">
							<div class="row sm_tit">
								비용
							</div>
							<span class="fa fa-krw"></span>${hobbyVo.cost_name}
						</div>
						<div class="level_row">
							<div class="row sm_tit">
								난이도
							</div>
							<span class="fa fa-hand-paper-o"></span>${hobbyVo.level_name}
						</div>
						<div class="respon_row">
							<button type="button" class="btn green_background">
								<span class="fa fa-heart-o"></span>
							</button>
							<button type="button" class="btn green_background">
								<span class="fa fa-bookmark-o"></span>
							</button>
							<button type="button" class="btn green_background">
								<span class="fa fa-share-alt"></span>
							</button>
						</div>
					</div>
				</div>
		</div>
		<div class="side side-right"></div>
	</div>
	<!-- // 취미글 메인부분 -->
	<!-- 준비물 부분 -->
	<div class="container_north">
		<div class="side side-left"></div>
		<div class="body">
			<div><b>준비물</b><span>Material</span></div>
							<table class="table table-hover table-sm">
								<tbody>
									<c:forEach var="hobbyMaterialVo" items="${hobbyVo.hobbyMaterials}">
										<tr>
											<td>${hobbyMaterialVo.materialName}</td>
											<td>
												${hobbyMaterialVo.material_detail}
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
		</div>
		<div class="side side-right"></div>
	</div>
	<!-- //준비물 부분 -->
	<!-- 만들기 부분 -->
	<div class="container_north">
		<div class="side side-left"></div>
		<div class="body">
			<div class="view_step">
						            <div>
										<div><b>만들기 순서</b><span>Steps</span></div>
						                <div >
						                    <a href="javascript:void(0);" onclick="chgViewStep(1)"><img id="tabStepView1" src="/resources/images/slide_on.png" alt="슬라이드보기"></a>
						                    <a href="javascript:void(0);" onclick="chgViewStep(2)"><img id="tabStepView2" src="https://recipe1.ezmember.co.kr/img/mobile/tab_view1.png" alt="이미지크게보기"></a>
						                    <a href="javascript:void(0);" onclick="chgViewStep(3)"><img id="tabStepView3" src="https://recipe1.ezmember.co.kr/img/mobile/tab_view3.png" alt="이미지작게보기"></a>
						                    <a href="javascript:void(0);" onclick="chgViewStep(4)"><img id="tabStepView4" src="https://recipe1.ezmember.co.kr/img/mobile/tab_view2.png" alt="텍스트만보기"></a>
						                </div>
						            </div>
						            <!-- 슬라이드 이미지 -->
						            <div>
						            	<div class="divSlideView" style="margin-top: 60px;">
						            		<!-- data-interval=false -> 자동 슬라이드 취소 -->
						            		<!-- 이미지 슬라이드 -->
					            			<div class="carousel slide" id="stepSlide" data-interval="false">
												<ol class="carousel-indicators" style="top: 460px; height: 30px;">
													<c:forEach var="makeStepVo" items="${hobbyVo.makeSteps }">
														<li data-slide-to="${makeStepVo.make_step_num - 1 }" 
															data-target="#stepSlide"
															class="${makeStepVo.make_step_num==1  ? 'active' : ''}">
														</li>
													</c:forEach>
												</ol>
												<div class="carousel-inner">
													<c:forEach var="makeStepVo" items="${hobbyVo.makeSteps }">
														<div data-num="${makeStepVo.make_step_num}" class="carousel-item ${makeStepVo.make_step_num==1  ? 'active' : ''}">
															<div style="width:900px; height:500px">
																<img class="slideImg" 
																src="/displayImage?filePath=${rootPath}${makeStepVo.make_step_img }" />
															</div>
															<div class="carousel-caption">
																	<div id="stepDiv${makeStepVo.make_step_num}" 
																	class="view_step_cont step${makeStepVo.make_step_num}"
																	style="margin: 0 auto;" >
																	<div id="stepdescr${makeStepVo.make_step_num}" class="media-body">
																	${makeStepVo.make_step_text }
																	</div>
																	<div class="stepExtra">
																		<c:if test="${not empty makeStepVo.tip}">
																			<p class="step_extra extra_tip">
																				${makeStepVo.tip}
																			</p>
																		</c:if>
																		<c:if test="${not empty makeStepVo.note}">
																			<p class="step_extra extra_note">
																				${makeStepVo.note}
																			</p>
																		</c:if>
																		<c:if test="${not empty makeStepVo.urlOgTag}">
																			<c:choose>
																				<c:when test="${makeStepVo.urlOgTag.status == 0}">
																					<a href="${makeStepVo.urlOgTag.url }">${makeStepVo.urlOgTag.url}</a>
																				</c:when>
																				<c:otherwise>
																					<figure data-ke-type="opengraph" data-og-title="${makeStepVo.urlOgTag.title}" 
																					data-og-description="${makeStepVo.urlOgTag.desc}"  data-og-url="${makeStepVo.urlOgTag.url }" 
																					data-og-image="${makeStepVo.urlOgTag.image}"> 
																				      <a href="${makeStepVo.urlOgTag.url }">
																			   			<c:set var = "image" value = "${makeStepVo.urlOgTag.image }"/>
																			   				<c:choose>
																			   					<c:when test="${fn:contains(image, 'blogthumb')}">
																			   						<div class="og-image" 
																				        			style="background-image:url(${contextPath}/resources/images/sad.png)"></div>
																			   					</c:when>
																			   					<c:otherwise>
																			   						 <div class="og-image" 
																				        				style="background-image:url(${makeStepVo.urlOgTag.image })"></div>
																			   					</c:otherwise>
																			   				</c:choose>
																				        <div class="og-text">
																				          <p class="og-title">${makeStepVo.urlOgTag.title}</p>
																				          <p class="og-desc">${makeStepVo.urlOgTag.desc}</p>
																				          <p class="og-host">${makeStepVo.urlOgTag.url }</p>
																				        </div>
																				      </a>
																				   	 </figure>
																				</c:otherwise>
																			</c:choose>
																			    <p class="step_extra extra_link">
																					${makeStepVo.link_desc}
																		</c:if>
																	</div>
																</div>
															</div>
														</div>
													</c:forEach>
												</div> 
												<a class="carousel-control-prev" href="#stepSlide" 
													data-slide="prev" style="height:500px">
													<span class="carousel-control-prev-icon"></span> 
													<span class="sr-only">Previous</span>
												</a> 
												<a class="carousel-control-next" href="#stepSlide" 
													data-slide="next"  style="height:500px">
													<span class="carousel-control-next-icon"></span> 
													<span class="sr-only">Next</span>
												</a>
											</div>
											<!-- //이미지 슬라이드 -->
						            </div>
						            </div>
						            <!-- //슬라이드 이미지 -->
						            <!-- 만들기 컨테이너 -->
						            <style>
						            	
						            </style>
						            
						            <div class="divStepView" style="display:none">
						            <c:forEach var="makeStepVo" items="${hobbyVo.makeSteps}">
										<div id="stepDiv${makeStepVo.make_step_num}" class="view_step_cont step${makeStepVo.make_step_num}">
											<div id="stepimg${makeStepVo.make_step_num}" class="media-left">
												<img class="make_step_img" style="margin-top: 0px;"
													src="/displayImage?filePath=${rootPath}${makeStepVo.make_step_img }">
											</div>
											<div id="stepdescr${makeStepVo.make_step_num}" class="media-body">
												${makeStepVo.make_step_text }
											</div>
											<div class="stepExtra">
												<c:if test="${not empty makeStepVo.tip}">
													<p class="step_extra extra_tip">
														${makeStepVo.tip}
													</p>
												</c:if>
												<c:if test="${not empty makeStepVo.note}">
													<p class="step_extra extra_note">
														${makeStepVo.note}
													</p>
												</c:if>
												<c:if test="${not empty makeStepVo.urlOgTag}">
														<figure data-ke-type="opengraph" data-og-title="${makeStepVo.urlOgTag.title}" 
															data-og-description="${makeStepVo.urlOgTag.desc}"  data-og-url="${makeStepVo.urlOgTag.url }" 
															data-og-image="${makeStepVo.urlOgTag.image}"> 
													      <a href="${makeStepVo.urlOgTag.url }">
													        <c:set var = "image" value = "${makeStepVo.urlOgTag.image }"/>
												   				<c:choose>
												   					<c:when test="${fn:contains(image, 'blogthumb')}">
												   						<div class="og-image" 
													        			style="background-image:url(${contextPath}/resources/images/sad.png)"></div>
												   					</c:when>
												   					<c:otherwise>
												   						 <div class="og-image" 
													        				style="background-image:url(${makeStepVo.urlOgTag.image })"></div>
												   					</c:otherwise>
												   				</c:choose>
													        <div class="og-text">
													          <p class="og-title">${makeStepVo.urlOgTag.title}</p>
													          <p class="og-desc">${makeStepVo.urlOgTag.desc}</p>
													          <p class="og-host">${makeStepVo.urlOgTag.url }</p>
													        </div>
													      </a>
													    </figure>
													     <p class="step_extra extra_link"> 
													     	${makeStepVo.link_desc}
												</c:if>
											</div>
										</div>
									</c:forEach>
									</div>
								</div>
								<!-- 완성사진 영역 -->
<!-- 								<div><b>완성사진</b><span>craft</span></div> -->
								<div style="margin-top: 100px;">
									<div class="carousel slide" id="craftSlide" style="width:700px">
										<ol class="carousel-indicators">
												<c:forEach var="completeImgVo" items="${hobbyVo.completeImgs}" varStatus="vs">
														<li data-slide-to="${vs.index}" 
															data-target="#craftSlide"
															class="${vs.index==0  ? 'active' : ''}">
														</li>
													</c:forEach>
										</ol>
										<div class="carousel-inner">
											<c:forEach var="completeImgVo" items="${hobbyVo.completeImgs}">
											<div data-num="${vs.count}" class="carousel-item ${vs.index==0  ? 'active' : ''}">
												<img class="d-block w-100" 
													src="/displayImage?filePath=${rootPath}${completeImgVo.img_name}" />
											</div>
											</c:forEach>
										</div> 
										<a class="carousel-control-prev" 
											href="#craftSlide" data-slide="prev">
											<span class="carousel-control-prev-icon"></span> 
											<span class="sr-only">Previous</span></a> 
										<a class="carousel-control-next" href="#craftSlide"
										 data-slide="next">
										 	<span class="carousel-control-next-icon"></span> 
										 	<span class="sr-only">Next</span>
										 	</a>
									</div>
								</div>
							</div>
		<div class="side side-right"></div>
	</div>
	<!-- //만들기 부분 -->
	<!-- 동영상 부분 -->
	<c:if test="${not empty hobbyVo.hobby_video}">
		<div class="container_north">
			<div class="side side-left"></div>
			<div class="body">
				<div><b>동영상</b><span>Video</span></div>
				<div>
					<iframe width="560" height="315" 
					src="https://www.youtube.com/embed/${hobbyVo.hobby_video}" 
					title="YouTube video player"></iframe>
				</div>
			</div>
			<div class="side side-right"></div>
		</div>						
	</c:if>
	<!-- //동영상 부분 -->
	<!-- 태그 부분 -->
	<div class="container_north">
		<div class="side side-left"></div>
		<div class="body">
			<div><b>태그</b><span>Tag</span></div>
			보류부분
		</div>
		<div class="side side-right"></div>
	</div>
	<!--// 태그 부분 -->
	<!-- 댓글, 후기 부분 -->
	<div class="container_south">
		<div class="side side-left"></div>
		<div class="body">
			<!-- 후기, 댓글 컨테이너 -->
				<div class="col-lg-4 offset-lg-2 col-12 bg-white rounded-top tab-head">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item">
							<a class="nav-link active" id="home-tab" data-toggle="tab" 
								href="#madeByMe" role="tab" 
								aria-controls="madeByMe" aria-selected="true">made by me</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="profile-tab" data-toggle="tab"
							 href="#comment" role="tab" 
							 aria-controls="comment" aria-selected="false">comment</a>
						</li>
					</ul>
				</div>
				<div class="col-lg-8 offset-lg-2 bg-white p-3">
					<div class="tab-content mt-4" id="myTabContent">
						<!-- made by me -->
						<div class="tab-pane fade show active" id="madeByMe" role="tabpanel" aria-labelledby="home-tab">
							<h5 class="pl-2">made by me</h5>
							<a href="#"><span class="fa fa-pencil-square"></span>후기작성</a>
							<p>여기는 후기 부분~</p>
							<!-- review-container -->
							<div class="review-container">
							<c:forEach begin="1" end="4">
							<!-- review-row -->
							<div class="review-row">
								<div class="row">
									<div class="col-md-1">
										<img class="rounded-circle circle-image" 
										src="https://recipe1.ezmember.co.kr/img/df/pf_100_100.png"
										style="width:2.2rem;"/> 
									</div>
									<div class="col-md-11">
										<div class="row">
											홍길동
										</div>
										<div class="row">
											2021.07.20
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<img src="/resources/images/madeByMeThum.jpg"/> 
									</div>
									<div class="col-md-8">
										<div>
											<div class="row">체감 난이도: 최상</div>
											<div class="row">소요시간: 1시간</div>
											<div class="row">비용: 3만원</div>
										</div>
										<div class="row review-content">
											<p>후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용
											</p>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
							<!-- // review-row -->
							</div>
							<!-- //review-container -->
							<!-- pagination-container -->
							<div class="pagination-container">
								<div class="pagination_rounded">
								    <ul>
								        <li> <a href="#" class="prev"> <i class="fa fa-angle-left" aria-hidden="true"></i> Prev </a> </li>
								        <li><a href="#">1</a> </li>
								        <li class="hidden-xs"><a href="#">2</a> </li>
								        <li class="hidden-xs"><a href="#">3</a> </li>
								        <li class="hidden-xs"><a href="#">4</a> </li>
								        <li class="hidden-xs"><a href="#">5</a> </li>
								        <li class="visible-xs"><a href="#">...</a> </li>
								        <li><a href="#">6</a> </li>
								        <li><a href="#" class="next"> Next <i class="fa fa-angle-right" aria-hidden="true"></i></a> </li>
								    </ul>
								</div>
							</div>
							<!--// pagination-container -->
						</div>
						<!-- // made by me -->
						<!-- // comment -->
						<div class="tab-pane fade" id="comment" role="tabpanel" aria-labelledby="profile-tab">
							<h5 class="pl-2">comment</h5>
							<p>여기는 댓글 부분 ~</p>
							<div class="sm_tit">댓글 <span id="comment_cnt">3</span></div>
							<!--commentList-container -->
							<div class="commentList-container" id="commentContainer">
							<!-- comment-row-->
								<div class="comment-row" style="display:none">
									<input type="hidden" class="c_no" value=""/>
									<input type="hidden" class="re_group" value=""/>
									<div class="updateCommentDiv" style="display:none">
										<div class="c_info_area">
											<img class="rounded-circle circle-image user_img" 
												src="/resources/images/profile.png" style="width:35px; height:35px;"/>
											<span class="c_user_name"> 하윤지</span>
											<a class="cancel" href="#" style="float:right">취소</a>
										</div>
										<div class="input-group" style="width:680px;">
										<!-- 아이디부분 로그인기능 생기면 삭제 -->
											<textarea name="c_content" class="form-control c_content"
													 style="height:100px; width:100%; resize:none;"></textarea>
											<!-- 로그인 기능 생기면 insertComment함수 인자안에 세션으로 얻은${user_id}넣기 -->
											<button class="btn btn-outline-light green_background updateBtn" type="button" 
													onclick="updateComment()" style="height:100px; width:100px;">등록</button>
										</div>
									</div>
									<div class="view_comment">
										<div class="c_info_area">
												<a class="user_link" href="#프로필링크">
													<img class="rounded-circle circle-image user_img" 
													src="/resources/images/profile.png" style="width:35px; height:35px;"
													/>
												</a>
												<span class="c_user_name"> 하윤지</span>
												<span class="is_hobby_writer badge badge-pill badge-success" 
													style="display:none; background: #1f5e43; padding-top: 5px;"> 글주인</span>
												<div class="dropdown" style="float:right">
													<button class="btnMenu_cmt" type="button" id="dropdownMenuButton" data-toggle="dropdown">
													</button>
													<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
														 <a class="dropdown-item doUpdateComment" 
														 	href="javascript:void(0);" >수정</a> 
														 <a class="dropdown-item deleteComment" 
														 	href="javascript:void(0);">삭제</a>
													</div>
												</div>
											</div>
											<div class="c_content_area">
												<span class="c_parent_user_name" style="display:none">@하윤지 </span> 
												<span class="c_content">댓글내용 댓글댓글내용 댓글댓글내용 11</span>
											</div>
											<div class="c_etc_area">
												<span class="c_reg_date">2021-07-20 11:43</span>
													<span>|</span>
													<a href="javascript:void(0);" class="신고"
														 onclick="신고()">신고</a>
											</div>
											<div class="c_btn_area">
												<button class="doRecomment btn btn-sm btn-outline-light green_background"
														 onclick="doRecomment()">답글</button>
											</div>
									</div>
									<div class="row replyCommentDiv" style="padding-left:50px;">
									</div>
								</div>
								<!-- //comment-row -->
								<div id="moreViewDiv" style="display:none"></div>
							</div>
							<!--//  댓글 리스트 컨테이너 -->
								
									<!-- 답댓작성 -->
									<div id="reply_div" style="display:none">
										<div class="input-group" style="width:640px;">
											<input type="text" id="re_user_id" name="user_id" placeholder="댓글작성자 id(테스트를 위한)"/>
											<input type="hidden" id="parent_c_no" value=""/>
											<textarea id="re_c_content" class="form-control"
												 style="height:100px; width:100%; resize:none;"></textarea>
											<button class="btn btn-outline-light green_background insertRecomment" type="button" 
												onclick="insertRecomment(this)" style="height:100px; width:100px;">등록</button>
										</div>
									</div>
									<!--// 답댓작성 -->
										
								<div style="text-align:center; margin: 20px 0 20px 0;">
									<button type="button" id="btnMoreComments"
										onclick="moreViewToggle(this);"
										class="btn btn-sm btn-outline-light green_background">댓글 더보기</button>
								</div>
							
							<!--//commentList-container -->
							<!--commentWrite-container -->
							<div class="commentWrite-container">
								<div class="input-group" style="width:680px;">
									<!-- 아이디부분 로그인기능 생기면 삭제 -->
									<input type="text" id="user_id" name="user_id" placeholder="댓글작성자 id(테스트를 위한)"/>
									<textarea id="c_content" name="c_content" class="form-control" placeholder="댓글을 남겨주세요."
										 style="height:100px; width:100%; resize:none;"></textarea>
									<!-- 로그인 기능 생기면 insertComment함수 인자안에 세션으로 얻은${user_id}넣기 -->
									<button class="btn btn-outline-light green_background" type="button" 
										onclick="insertComment(this)" style="height:100px; width:100px;">등록</button>
								</div>
							</div>
							<!--// commentWrite-container -->
					</div>
					<!-- // comment -->
				</div>																		
			</div>
		<div class="side side-right"></div>
		</div>
	</div>
	<!--// 댓글, 후기 부분 -->
</div>
<%@ include file="../include/footer.jsp" %>
<script>
function chgViewStep(step) {	
	if (step == 1) {
		$(".divStepView").hide();
		$(".divSlideView").show();
	} else {
		$(".divStepView").show();
		$(".divSlideView").hide();
	}
	
    $("[id^='tabStepView']").each(function(){
        $(this).attr("src",$(this).attr("src").replace("_on.png",".png"));
    });
    $("#tabStepView"+step).attr("src",$("#tabStepView"+step).attr("src").replace(".png","_on.png"));
    $("[id^='stepimg']").each(function(){
        $(this).removeClass('media-left');
        $(this).removeClass('none');
        if(step==3) $(this).addClass('media-left');
        else if(step==4) $(this).addClass('none');
    });
}


//* 댓글 부분

// 일반 댓글 작성
function insertComment() {
	var c_content = $("#c_content").val();
	var h_no = parseInt("${hobbyVo.hobby_no}");
	var user_id = $("#user_id").val();
	var url = "/comment/insertComment";
	var sendData = {
			"c_content" : c_content,
			"h_no" 	    : h_no,
			"user_id"	: user_id
	}
	$.ajax({
		"url" : url,
		"headers" : {
			"Content-Type" : "application/json"
		},
		"method" : "post",
		"dataType" : "text",
		"data" : JSON.stringify(sendData),
		"success" : function(rData) {
			console.log(rData);
			if(rData == "success") {
				selectCommentList();
			}
		}
	});
	
}	

//답댓글 작성
function insertRecomment(el) {
	var re_group = $(el).parent().parent().parent().parent().find(".re_group").val()
	var parent_c_no = $("#parent_c_no").val();
	var user_id = $("#re_user_id").val()
	var c_content = $("#re_c_content").val();
	var h_no = parseInt("${hobbyVo.hobby_no}");
	var url = "/comment/insertRecomment";
	var sendData = {
			"c_content" : c_content,
			"h_no" 	    : h_no,
			"user_id"	: user_id,
			"parent_c_no" : parent_c_no,
			"re_group" : re_group,
	}
	console.log(sendData);
	$.ajax({
		"url" : url,
		"headers" : {
			"Content-Type" : "application/json"
		},
		"method" : "post", 
		"dataType" : "text",
		"data" : JSON.stringify(sendData),
		"success" : function(rData) {
			console.log(rData);
			if(rData == "success") {
				selectCommentList();
			}
		}
	});
}

// 답글 버튼 누를때 
function doRecomment(c_no) {
	var reply = '<div id="reply_div">'+$('#reply_div').html()+'</div>';
    $('#reply_div').remove();
    $("#replyCommentDiv_"+ c_no).html(reply);
    $('#reply_div').show();
    $("#parent_c_no").val(c_no);
}	

var hobby_writer = "${hobbyVo.hobby_writer}";

// 댓글 리스트 조회
function selectCommentList() {
	$("#commentContainer > .comment-row:gt(0)").remove();
// 	$("#moreViewDiv > .comment-row").remove();
	var url = "/comment/selectCommentList/${hobbyVo.hobby_no}";
	$.get(url, function(rData) {
		if (rData == 0) {
			$("#btnMoreComments").hide();
		} else {
			$("#btnMoreComments").show();
		}
		$("#comment_cnt").text(rData.length);
		
		$.each(rData, function(i) {
			var cloneDiv = $("#commentContainer > .comment-row:eq(0)").clone();
			if (this.c_depth == 1) {
				cloneDiv.addClass("recomment-row");
				cloneDiv.find(".c_parent_user_name").show();
			}
			cloneDiv.show();
			cloneDiv.find(".view_comment").attr("id", "view_comment_" + this.c_no );
			cloneDiv.find(".c_no").val(this.c_no);
			cloneDiv.find(".re_group").val(this.re_group);
			cloneDiv.find(".user_link").attr("href", "프로필링크/개인작업실코드(조인하기)");
			cloneDiv.find(".user_img").attr("src", "/displayImage?filePath=${rootPath}" + this.user_img);
			cloneDiv.find(".c_user_name").text(this.user_name);
			if (this.user_id == hobby_writer) {
				cloneDiv.find(".is_hobby_writer").show();
			}
			cloneDiv.find(".doUpdateComment").attr("onclick", "doUpdateComment(" + this.c_no + ")");
			cloneDiv.find(".updateCommentDiv").attr("id", "updateCommentDiv_" + this.c_no);
			cloneDiv.find(".updateBtn").attr("onclick", "updateComment(" + this.c_no + ")");
			cloneDiv.find(".deleteComment").attr("onclick", "deleteComment(" + this.c_no + ")");
			cloneDiv.find(".doRecomment").attr("onclick", "doRecomment(" + this.c_no + ")");
			cloneDiv.find(".c_parent_user_name").text("@" + this.parent_user_name);
			cloneDiv.find(".c_content").text(this.c_content);
			cloneDiv.find(".c_reg_date").text(this.reg_date);
			
			cloneDiv.find(".replyCommentDiv").attr("id", "replyCommentDiv_" + this.c_no);
			
			if (i < 6) {
				$("#commentContainer").append(cloneDiv);
			} else {
				$("#moreViewDiv").append(cloneDiv);
			}
			$("#moreViewDiv").insertAfter("#commentContainer > .comment-row:last");
		});
	});
}

// 댓글 수정 버튼 누를때
function doUpdateComment(c_no) {
	console.log(c_no);
	var c_content = $("#view_comment_" + c_no).find(".c_content").text();
    $("#updateCommentDiv_" + c_no).show();
    $("#updateCommentDiv_" + c_no).find(".c_content").val(c_content);
	$("#view_comment_" + c_no).hide();
}

function updateComment(c_no) {
	var c_content = $("#updateCommentDiv_" + c_no).find(".c_content").val();
	var url = "/comment/updateComment";
	var sendData = {
			"c_content" : c_content,
			"c_no"	: c_no
	}
	
	$.ajax({
		"url" : url,
		"headers" : {
			"Content-Type" : "application/json"
		},
		"method" : "post",
		"dataType" : "text",
		"data" : JSON.stringify(sendData),
		"success" : function(rData) {
			console.log(rData);
			if(rData == "success") {
				selectCommentList();
			}
		}
	});
}


// 댓글 삭제  
function deleteComment(c_no) {
	var url = "/comment/deleteComment/" + c_no;
	if(confirm("삭제 하시겠습니까?")) {
	$.get(url, function(rData) {
			console.log(rData);
			if(rData == 0) {
				alert("답댓이 있는 댓글은 삭제할 수 없습니다.");
			} else {
				selectCommentList();
			}
		});
	}
}

var commentOpens = 0;
function moreViewToggle() {
	if(commentOpens == 0) {
		$("#moreViewDiv").show();
        $("#btnMoreComments").html('줄여보기');
        commentOpens = 1;
    }
    else {
        $("#moreViewDiv").hide();
        $("#btnMoreComments").html('전체보기');
        commentOpens = 0;
    }
}
</script>
</body>
</html>