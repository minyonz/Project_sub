<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta property="og:title" content="${hobbyVo.hobby_title }" />
<meta property="og:url" content="${url}" />
<meta property="og:image" content="/displayImage?filePath=${hobbyVo.main_img}" />
<meta property="og:description" content="${hobbyVo.hobby_intro}">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="${contextPath}/resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/sweetalert2.min.css">
<script>
$(document).ready(function() {
	selectCommentList();
	
	$('#stepSlide').carousel({
		interval: 500
	}).carousel('pause');
	
	var isStart = false;
	$("#carousel_cycle").on("click", function() {
		if(isStart == false) {
			console.log("시작");
			$('#stepSlide').carousel('cycle');
			$(this).find("span").removeClass("fa-play").addClass("fa-pause");
			isStart = true;
		} else {
			console.log("정지");
			$('#stepSlide').carousel('pause');
			$(this).find("span").removeClass("fa-pause").addClass("fa-play");
			isStart = false;
		}
		
		
	});
	
	$("#carousel_prev").on("click", function() {
		$('#stepSlide').carousel('prev');
	});
	
	$("#carousel_next").on("click", function() {
		$('#stepSlide').carousel('next');
	});


		// 이미지 슬라이드 이동
		$("#carousel_move").on("click", function() {
		var num = Number($("#carousel_number").val()) - 1;
		$('#stepSlide').carousel(num);
		});
		
		$('#stepSlide').on('slide.bs.carousel', function () {
			console.log("호출");
		});
		$('#stepSlide').on('slid.bs.carousel', function () {
			console.log("완료");

		});
});

</script>
<title>상세보기</title>

<style>
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
 background: url(/resources/images/reply.png) no-repeat 3px 0px;
 background-size: 45px;
 padding-left: 40px;
 padding-top: 10px;
 padding-bottom: 10px;
 border-bottom: 2px solid #c1c1c1;
}
/* #reply_div{ */
/*  background: url(/resources/images/reply.png) no-repeat 3px 0px; */
/*  background-size: 45px; */
/*  padding-left: 40px; */
/*  padding-top: 10px; */
/*  padding-bottom: 10px; */
/* } */
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
.divCnt{
color: #1f5e43;
float: right;
font-weight: 550;
}
.mainImg_cont{
	overflow: hidden;
/*     display: flex; */
/*     align-items: center; */
/*     justify-content: center; */
    width: 550px;
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

.carousel-indicators li {
    width: 20px;
    height: 3px;
    margin-right: 0px; 
    margin-left: 0px;
    background: url(/resources/images/circle-border.png) no-repeat center;
    background-size: 10px;
    opacity: 1;
}

/* carousel 슬라이드 */
.stepCarousel {
	margin: 0 auto;
	width: 30rem;
/* 	height:1100px; */
}

.stepSlideImgCont{
	width: 100%;
    height: 18rem;
}
.craftCarousel {
	margin: 0 auto;
	width: 550px;
/* 	height:1100px; */
}
.craftCarousel-inner {
    position: relative;
    justify-content: center;
    align-items: center;
    overflow: hidden;
    border: hidden;
    width: 550px;
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


/* 화면 width 1300px부터 이렇게 하겠다.라는 뜻*/
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
 
 /* 화면 width 1300px까지 이렇게 하겠다.라는 뜻*/
 @media screen and (max-width: 1300px) {
.body { padding: 0 80px; }
 }
  	
</style>
<!-- 가져온 스타일 -->
<style>
.divViewOption a{
    display: inline-block;
    float: left;
    margin: 0;
    padding: 0;
}

.divViewOption a img{
    height: 40px;
}
/* 1. 만들기 css */
.view_step {padding:0 0 10px;}
.view_step_cont {padding:6px 0 60px 50px; width:850px; font-size:22px;}
.view_step_cont.step1 {background:url(${contextPath}/resources/images/1.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step2 {background:url(${contextPath}/resources/images/2.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step3 {background:url(${contextPath}/resources/images/3.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step4 {background:url(${contextPath}/resources/images/4.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step5 {background:url(${contextPath}/resources/images/5.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step6 {background:url(${contextPath}/resources/images/6.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step7 {background:url(${contextPath}/resources/images/7.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step8 {background:url(${contextPath}/resources/images/8.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step9 {background:url(${contextPath}/resources/images/9.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step10 {background:url(${contextPath}/resources/images/10.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step11 {background:url(${contextPath}/resources/images/11.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step12 {background:url(${contextPath}/resources/images/12.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step13 {background:url(${contextPath}/resources/images/13.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step14 {background:url(${contextPath}/resources/images/14.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step15 {background:url(${contextPath}/resources/images/15.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step16 {background:url(${contextPath}/resources/images/16.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step17 {background:url(${contextPath}/resources/images/17.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step18 {background:url(${contextPath}/resources/images/18.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step19 {background:url(${contextPath}/resources/images/19.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step20 {background:url(${contextPath}/resources/images/20.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step21 {background:url(${contextPath}/resources/images/21.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step22 {background:url(${contextPath}/resources/images/22.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step23 {background:url(${contextPath}/resources/images/23.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step24 {background:url(${contextPath}/resources/images/24.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step25 {background:url(${contextPath}/resources/images/25.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step26 {background:url(${contextPath}/resources/images/26.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step27 {background:url(${contextPath}/resources/images/27.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step28 {background:url(${contextPath}/resources/images/28.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step29 {background:url(${contextPath}/resources/images/29.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step30 {background:url(${contextPath}/resources/images/30.jpg) no-repeat 4px 6px; background-size:36px;}
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
.view_step_cont .media-left {width:300px;}

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
/* color: black !important; */
font-weight: 600;
padding-left: 28px;
padding-right: 28px;
}
.nav-item .active{
color: #1f5e43 !important;
border:none !important;
border-bottom: 3px solid #1f5e43 !important;
font-weight: 600;
}
.nav-item .active:hover{
border:none !important;
border-bottom: 3px solid #1f5e43 !important;
}
.nav-tabs{
border-bottom: none !important;
}
.tab-pane h5{
border-left: 4px solid #1f5e43;
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
    background: #1f5e43;
    color: #fff;
    border: 1px solid #1f5e43
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
    color: #1f5e43;
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
    width: 8.3rem;
    height: 8.3rem;
    background-size: cover;
    background-position: center;
}
figure[data-ke-type='opengraph'] div {
    position: relative;
}
figure[data-ke-type='opengraph'] div.og-text {
    flex-grow: 1;
    height: 8rem;
    padding-left: 1.5rem;
    padding-top: 1rem;
}
figure[data-ke-type='opengraph'] p.og-title {
color: #000000;
padding-bottom: 0.2rem;
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
/*     font-family: 'Noto Sans', 'Noto Sans KR'; */
    font-size: 14px;
    font-weight: 300;
/*     font-style: normal; */
/*     font-stretch: normal; */
    line-height: unset;
/*     letter-spacing: normal; */
    color: #909090;
    min-height: 2.8rem;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    display: -webkit-box;
}

/*임시 */
a {
 color:black;
}
</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<c:if test="${swalIcon == 'success' }">
	<script>
		Swal.fire({
			icon : "${swalIcon}",
			title : "${swalTitle}",
		}).then(function(){close()});
	</script>
</c:if>
<c:if test="${swalIcon == 'error' }">
	<script>
		Swal.fire({
			icon : "${swalIcon}",
			title : "${swalTitle}",
		});
	</script>
</c:if>
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
				<c:if test="${not empty loginVo }">
					<c:if test="${loginVo.user_id == hobbyVo.user_id}">
						<div class="dropdown" style="float:right">
							<button class="btnMenu" type="button" id="dropdownMenuButton" data-toggle="dropdown">
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton" 
								style="min-width: 4rem;font-size: 13px;">
								 <a class="dropdown-item mydr" href="/hobby/update/${hobbyVo.hobby_no}">수정</a>
								  <div class="dropdown-divider"></div> 
								 <a class="dropdown-item mydr" href="javascript:doDelete();">삭제</a>
							</div>
						</div>
					</c:if>
				</c:if>
				<!--//  수정/ 삭제 버튼을 위한 메뉴 -->
				<div id="hobby_title">${hobbyVo.hobby_title}</div>
				<div id="hobby_intro">${hobbyVo.hobby_intro}</div>
				<div>
				<span id="reg_date">작성일  : <fmt:formatDate value="${hobbyVo.reg_date}" pattern="yyyy-MM-dd KK:mm:ss"/></span>
				<div class="divCnt">
					<span class="fa fa-eye"></span>
					<span id="view_cnt">${hobbyVo.view_cnt}</span>
					<span>|</span>
					<span class="fa fa-heart-o"></span>
					<span id="like_cnt">${hobbyVo.like_cnt}</span>
					<span>|</span>
					<span class="fa fa-comment-o"></span>
					<span class="cmt_cnt">${hobbyVo.cmt_cnt}</span>
				</div>
				</div>
				<div class="row">
					<div class="col-md-7">
						<div class="mainImg_cont">
							<img id="main_img" src="/displayImage?filePath=${hobbyVo.main_img}"/>
						</div>
					</div>
					<div class="col-md-5">
						<div class="user_row">
							<div class="row sm_tit">
								작가
							</div>
							<a href="/workroom/main/${hobbyVo.user_id}">
							<img class="rounded-circle circle-image" 
								src="/displayImage?filePath=${hobbyVo.user_img}"
								style="width:2.2rem;"/> 
								<span>${hobbyVo.user_nick} ></span>
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
							<button type="button" class="loginNeed btn green_background" id="like">
								<span style="color:white;" class="fa fa-heart-o"></span>
								<span style="color:white;">좋아요</span>
							</button>
							<button type="button" class="loginNeed btn green_background" id="bookmark">
								<span style="color:white;" class="fa fa-bookmark-o"></span>
								<span style="color:white;">북마크</span>
							</button>
							<button type="button" class="loginNeed btn green_background">
								<span style="color:white;" class="fa fa-envelope-o"> 쪽지</span>
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
							<table class="table table-hover table-sm" style="cursor: pointer;">
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
					<b>만들기 순서</b><span>Steps</span>
					<div class="divViewOption" style="float: right;">
	                    <a href="javascript:void(0);" onclick="chgViewStep(1)"><img id="tabStepView1" src="${contextPath}/resources/images/tab_view1_on.png" alt="슬라이드보기"></a>
	                    <a href="javascript:void(0);" onclick="chgViewStep(2)"><img id="tabStepView2" src="${contextPath}/resources/images/tab_view2.png" alt="이미지크게보기"></a>
	                    <a href="javascript:void(0);" onclick="chgViewStep(3)"><img id="tabStepView3" src="${contextPath}/resources/images/tab_view3.png" alt="이미지작게보기"></a>
	                    <a href="javascript:void(0);" onclick="chgViewStep(4)"><img id="tabStepView4" src="${contextPath}/resources/images/tab_view4.png" alt="텍스트만보기"></a>
               		 </div>
				</div>
	            <!-- 슬라이드 이미지 -->
	            <div>
	            	<div class="divSlideView" style="margin-top: 60px;">
<!-- 	            		<span>슬라이드 조작하기</span> -->
	            		<div style="text-align:center; margin-bottom: 1rem;">
	            			<button id="carousel_prev" class="btn btn-sm btn-outline-light green_background"><span class="fa fa-backward"></span></button>
							<button id="carousel_cycle" style="margin: 0 3rem;" class="btn btn-sm btn-outline-light green_background"><span class="fa fa-play"></span></button>
							<button id="carousel_next" class="btn btn-sm btn-outline-light green_background"><span class="fa fa-forward"></span></button>
								<!-- 슬라이드 이동 -->
<!-- 							<input type="number" id="carousel_number" min=1 max=5 value="1" > -->
<!-- 							<button id="carousel_move" class="btn btn-sm btn-outline-light green_background">이동</button><br /> -->
	            		</div>

	            		<!-- 이미지 슬라이드 -->
	            		<!-- data-interval=false -> 자동 슬라이드 취소 -->
            			<div class="carousel stepCarousel slide" id="stepSlide">
							<ol class="carousel-indicators" style="top: 16.3rem; height: 30px;">
								<c:forEach var="makeStepVo" items="${hobbyVo.makeSteps }">
									<li data-slide-to="${makeStepVo.make_step_num - 1 }" 
										data-target="#stepSlide"
										class="${makeStepVo.make_step_num==1  ? 'active' : ''}">
									</li>
								</c:forEach>
							</ol>
							<div class="carousel-inner stepCarousel-inner">
								<c:forEach var="makeStepVo" items="${hobbyVo.makeSteps }">
									<div data-num="${makeStepVo.make_step_num}" class="carousel-item ${makeStepVo.make_step_num==1  ? 'active' : ''}">
										<div class="stepSlideImgCont">
											<c:choose>
												<c:when test="${not empty makeStepVo.make_step_img}">
													<img class="slideImg" src="/displayImage?filePath=${makeStepVo.make_step_img }" />
												</c:when>
												<c:otherwise>
													<img class="slideImg" src="${contextPath}/resources/images/no-img.png" />
												</c:otherwise>
											</c:choose>
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
<!-- 							<a class="carousel-control-prev" href="#stepSlide"  -->
<!-- 								data-slide="prev" style="height: 18rem;"> -->
<!-- 								<span class="carousel-control-prev-icon"></span>  -->
<!-- 								<span class="sr-only">Previous</span> -->
<!-- 							</a>  -->
<!-- 							<a class="carousel-control-next" href="#stepSlide"  -->
<!-- 								data-slide="next"  style="height:18rem"> -->
<!-- 								<span class="carousel-control-next-icon"></span>  -->
<!-- 								<span class="sr-only">Next</span> -->
<!-- 							</a> -->
						</div>
						<!-- //이미지 슬라이드 -->
	            </div>
	            </div>
	            <!-- //슬라이드 이미지 -->
	            <!-- 만들기 컨테이너 -->
	            
	            <div class="divStepView" style="display:none; padding-top:50px;">
	            <c:forEach var="makeStepVo" items="${hobbyVo.makeSteps}">
					<div id="stepDiv${makeStepVo.make_step_num}" class="view_step_cont step${makeStepVo.make_step_num}">
						<div id="stepimg${makeStepVo.make_step_num}" class="media-left">
							<c:if test="${not empty makeStepVo.make_step_img}">
							<img class="make_step_img" style="margin-top: 0px;"
								src="/displayImage?filePath=${makeStepVo.make_step_img }">
							</c:if>
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
			<div style="margin-top: 100px;">
				<div class="carousel craftCarousel slide" id="craftSlide" style="box-shadow: 0 2px 4px 0 rgb(0 0 0 / 50%);">
				<ol class="carousel-indicators">
					<c:forEach var="completeImgVo" items="${hobbyVo.completeImgs}" varStatus="vs">
						<li data-slide-to="${vs.index}" 
							data-target="#craftSlide"
							class="${vs.index==0  ? 'active' : ''}">
						</li>
					</c:forEach>
				</ol>
				<div class="carousel-inner craftCarousel-inner">
					<c:forEach var="completeImgVo" items="${hobbyVo.completeImgs}" varStatus="vs">
						<div data-num="${vs.count}" class="carousel-item ${vs.count==1  ? 'active' : ''}">
							<div style="width:550px; height:300px">
								<img class="slideImg" src="/displayImage?filePath=${completeImgVo.img_name}" />
							</div>
						</div>
					</c:forEach>
				</div> 
				<a class="carousel-control-prev" href="#craftSlide" 
					data-slide="prev" style="height:300px">
					<span class="carousel-control-prev-icon"></span> 
					<span class="sr-only">Previous</span>
				</a> 
				<a class="carousel-control-next" href="#craftSlide" 
					data-slide="next"  style="height:300px">
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
				<div style="text-align: center;">
					<iframe width="560" height="315" 
					src="https://www.youtube.com/embed/${hobbyVo.hobby_video}" 
					title="YouTube video player"></iframe>
				</div>
			</div>
			<div class="side side-right"></div>
		</div>						
	</c:if>
	<!-- //동영상 부분 -->
	<!-- 댓글, 후기 부분 -->
	<div class="container_south">
		<div class="side side-left"></div>
		<div class="body">
			<!-- 후기, 댓글 컨테이너 -->
			<!-- style="padding-left: 18%;" 없앰 노트북으로 보니깐 이상해짐 스크린클때만 여백넣는작업 들어가야할듯 -->
		  <ul class="nav nav-tabs" >
		    <li class="nav-item">
		      <a class="nav-link active" data-toggle="tab" href="#madeByMe">made by me</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" data-toggle="tab" href="#comment">comment</a>
		    </li>
		  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="madeByMe" class="container tab-pane active"><br>
<!--       <h5 class="pl-2">made by me</h5> -->
		<a class="loginNeed" style="float:right" href="#"><span class="fa fa-pencil-square"></span>후기작성</a>
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
		<div class="pagination-container" style="text-align: center;">
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
	 <!-- comment 시작 -->
    <div id="comment" class="container tab-pane fade"><br>
<!--     		<h5 class="pl-2">comment</h5> -->
			<div class="sm_tit">댓글 <span class="cmt_cnt">3</span></div>
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
							<span class="c_user_nick"> 하윤지</span>
							<a class="cancel" href="javascript:cancelUpdate();" style="float:right">취소</a>
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
									<span class="c_user_nick"> 하윤지</span>
								</a>
								<span class="is_hobby_writer badge badge-pill badge-success" 
									style="display:none; background: #1f5e43; padding-top: 5px;"> 글주인</span>
								<!-- 댓글, 수정 삭제 -->
								<div class="dropdown" style="float:right">
									<button class="btnMenu_cmt" type="button" id="dropdownMenuButton" data-toggle="dropdown">
									</button>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton"
										style="min-width: 4rem;font-size: 13px;">
										 <a class="dropdown-item doUpdateComment" 
										 	href="javascript:void(0);" >수정</a> 
										 <a class="dropdown-item deleteComment" 
										 	href="javascript:void(0);">삭제</a>
									</div>
								</div>
								<!-- //댓글, 수정 삭제 -->
							</div>
							<div class="c_content_area">
								<span class="c_parent_user_nick" style="display:none">@하윤지 </span> 
								<span class="c_content">댓글내용 댓글댓글내용 댓글댓글내용 11</span>
							</div>
							<div class="c_etc_area">
								<span class="c_reg_date"></span>
<!-- 									<a href="javascript:void(0);" class="report" style="display:none;" -->
<!-- 										 onclick="신고()"><span>|</span>신고</a> -->
							</div>
							<div class="c_btn_area">
								<button class="loginNeed doRecomment btn btn-sm btn-outline-light green_background"
										 onclick="doRecomment()">답글</button>
							</div>
					</div>
					<div class="row replyCommentDiv" style="padding: 10px 0 10px 35px;">
					
					</div>
				</div>
				<!-- //comment-row -->
			</div>
			<!--//  댓글 리스트 컨테이너 -->
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
<!-- 					<input type="text" id="user_id" name="user_id" placeholder="댓글작성자 id(테스트를 위한)"/> -->
					<textarea id="c_content" name="c_content" class="form-control" placeholder="댓글을 남겨주세요."
						 style="height:100px; width:100%; resize:none;"></textarea>
					<!-- 로그인 기능 생기면 insertComment함수 인자안에 세션으로 얻은${user_id}넣기 -->
					<button class="loginNeed btn btn-outline-light green_background" type="button" 
						onclick="insertComment(this)" style="height:100px; width:100px;">등록</button>
				</div>
			</div>
			<!--// commentWrite-container -->
				<!-- 답댓작성 -->
				<div id="reply_div" style="display:none">
					<div class="input-group" style="width:640px;">
<!-- 						<input type="text" id="re_user_id" name="user_id" placeholder="댓글작성자 id(테스트를 위한)"/> -->
						<input type="hidden" id="parent_c_no" value=""/>
						<textarea id="re_c_content" class="form-control"
							 style="height:100px; width:100%; resize:none;"></textarea>
						<button class="loginNeed btn btn-outline-light green_background insertRecomment" type="button" 
							onclick="insertRecomment(this)" style="height:100px; width:100px;">등록</button>
					</div>
				</div>
				<!--// 답댓작성 -->
				<!-- moreviewdiv -->
					<div id="moreViewDiv" style="display:none"></div>
				<!-- //moreviewdiv -->
	  		  </div>
	    	<!-- comment 끝 -->
		  </div>
		  <!-- // Tab panes -->
		<div class="side side-right"></div>
		</div>
	</div>
	<!--// 댓글, 후기 부분 -->
</div>
<%@ include file="../include/footer.jsp" %>
<script>
var loginVo = "${loginVo}";
if (loginVo == "") {
	console.log("loginVo 없음:", loginVo);
	$(".loginNeed").on("click", function() {
		alert("로그인 해주세요");
		return false;
	});
	$("#comment").on("click", ".loginNeed", function() {
		alert("로그인 해주세요");
		return false;
	}).on("click", ".form-control", function() {
		alert("로그인 해주세요");
		return false;
	});
}

//좋아요
$("#like").click(function() {
	if(loginVo == "") {
		return false;
	}
	var url = "/hobby/like/${hobbyVo.hobby_no}";
	$.get(url, function(rData) {
		console.log(rData);
		if (rData == "like") {
			console.log("좋아용");
			$("#like > span:first-child").attr({
				"class" : "fa fa-heart",
				style : "color:#C32424"
			})
			$("#like_cnt").text(Number($("#like_cnt").text()) + 1);
		} else {
			$("#like > span:first-child").attr({
				"class" : "fa fa-heart-o",
				style : "color:white"
			});
			$("#like_cnt").text(Number($("#like_cnt").text()) - 1);
		}
	});
});

if ("${likeCheck}" == 1) {
    $("#like > span:first-child").attr({
       "class" : "fa fa-heart",
       style : "color:#C32424"
    })
 }
 
//북마크
$("#bookmark").click(function() {
	if(loginVo == "") {
		return false;
	}
	var url = "/hobby/bookmark/${hobbyVo.hobby_no}";
	$.get(url, function(rData) {
		console.log(rData);
		if (rData == "bookmark") {
			$("#bookmark > span:first-child").attr({
				class : "fa fa-bookmark",
				style : "color:#FFC300"
			})
		} else {
			$("#bookmark > span:first-child").attr({
				class : "fa fa-bookmark-o",
				style : "color:white"
			})
		}
	});
});

if ("${bookmarkCheck}" == 1) {
    $("#bookmark > span:first-child").attr({
       class : "fa fa-bookmark",
       style : "color:#FFC300"
    })
 }
 
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
			location.href = "${contextPath}/hobby/delete/${hobbyVo.hobby_no}";
		} 
	});
}

//* 댓글 부분
// 일반 댓글 작성
function insertComment() {
	var c_content = $("#c_content").val();
	if (c_content.length < 1 || c_content.trim() == "") {
		alert("댓글 내용을 입력하지 않았습니다.")
		return false;
	}
	var h_no = parseInt("${hobbyVo.hobby_no}");
// 	var user_id = $("#user_id").val();
	var url = "/comment/insertComment";
	var sendData = {
			"c_content" : c_content,
			"h_no" 	    : h_no,
// 			"user_id"	: user_id
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
				$("#c_content").val("");
			}
		}
	});
	
}	
//답댓글 작성
function insertRecomment(el) {
	var re_group = $(el).parent().parent().parent().parent().find(".re_group").val()
	var parent_c_no = $("#parent_c_no").val();
// 	var user_id = $("#re_user_id").val()
	var c_content = $("#re_c_content").val();
	if (c_content.length < 1 || c_content.trim() == "") {
		alert("댓글 내용을 입력하지 않았습니다.")
		return false;
	}
	var h_no = parseInt("${hobbyVo.hobby_no}");
	var url = "/comment/insertRecomment";
	var sendData = {
			"c_content" : c_content,
			"h_no" 	    : h_no,
// 			"user_id"	: user_id,
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
				var reply = '<div id="reply_div" style="display:none;">'+$('#reply_div').html()+'</div>';
	            $('#comment').append(reply);
				selectCommentList();
			}
		}
	});
}

// 답글 버튼 누를때 
function doRecomment(c_no) {
	var reply = '<div id="reply_div">'+$('#reply_div').html()+'</div>';
	if ($("#reply_div").css("display") == "block") {
 		console.log($("#replyCommentDiv_"+ c_no).find("#reply_div"));
 		if($("#replyCommentDiv_"+ c_no).find("#reply_div").length == 0) {
  			$('#reply_div').remove();
     		$("#replyCommentDiv_"+ c_no).html(reply);
		 } else {
  			$("#replyCommentDiv_"+ c_no).find("#reply_div").hide();
 		}
	} else {
		$('#reply_div').remove();
		$("#replyCommentDiv_"+ c_no).html(reply);
	}
    
    $("#parent_c_no").val(c_no);
}	

var hobby_writer = "${hobbyVo.user_id}"; // 글작성자 id

if (loginVo != null) {
	var login_id = "${loginVo.user_id}"; // 로그인한사람 id
}
// 댓글 리스트 조회
function selectCommentList() {
	
	$("#commentContainer > .comment-row:gt(0)").remove();
	$("#moreViewDiv").empty();
	var url = "/comment/selectCommentList/${hobbyVo.hobby_no}";
	$.get(url, function(rData) {
		if (rData.length < 4) {
			$("#btnMoreComments").hide();
		} else {
			$("#btnMoreComments").show();
		}
// 		$("#comment_cnt").text(rData.length);
		$(".cmt_cnt").text(rData.length);
		$.each(rData, function(i) {
			var cloneDiv = $("#commentContainer > .comment-row:eq(0)").clone();
			if (this.c_depth == 1) {
				cloneDiv.addClass("recomment-row");
				cloneDiv.find(".c_parent_user_nick").show();
			}
			cloneDiv.show();
			
			//자기 댓글이 아닐경우 수정삭제 안보이게하기, 신고버튼은 보이게 하기(신고 기능 없음)
			if(this.user_id != login_id) {
				cloneDiv.find(".dropdown").hide();
// 				cloneDiv.find(".report").show();
			}
			
			//
			cloneDiv.find(".view_comment").attr("id", "view_comment_" + this.c_no );
			cloneDiv.find(".c_no").val(this.c_no);
			cloneDiv.find(".re_group").val(this.re_group);
			cloneDiv.find(".user_link").attr("href", "/workroom/main/" + this.user_id);
			cloneDiv.find(".user_img").attr("src", "/displayImage?filePath=" + this.user_img);
			cloneDiv.find(".c_user_nick").text(this.user_nick);
			if (this.user_id == hobby_writer) {
				cloneDiv.find(".is_hobby_writer").show();
			}
			cloneDiv.find(".doUpdateComment").attr("onclick", "doUpdateComment(" + this.c_no + ")");
			cloneDiv.find(".updateCommentDiv").attr("id", "updateCommentDiv_" + this.c_no);
			// 댓글 수정 취소
			cloneDiv.find(".cancel").attr("href", "javascript:cancelUpdate(" + this.c_no + ")");
			cloneDiv.find(".updateBtn").attr("onclick", "updateComment(" + this.c_no + ")");
			cloneDiv.find(".deleteComment").attr("onclick", "deleteComment(" + this.c_no + ")");
			cloneDiv.find(".doRecomment").attr("onclick", "doRecomment(" + this.c_no + ")");
			cloneDiv.find(".c_parent_user_nick").text("@" + this.parent_user_nick);
			cloneDiv.find(".c_content").text(this.c_content);
			var reg_date = changeDateString(this.reg_date);
			cloneDiv.find(".c_reg_date").text(reg_date);
			cloneDiv.find(".replyCommentDiv").attr("id", "replyCommentDiv_" + this.c_no);
			
			// 댓글 3개까지는 전체보기 줄여보기 x, 4개부터 보일때 3개까지만 보이고 전체보기 버튼 눌러야 전체보임
			if(i > 2) {
				$("#moreViewDiv").append(cloneDiv);
// 				console.log(i + "," + "moreview" +  cloneDiv.html());
				$("#moreViewDiv").insertAfter("#commentContainer > .comment-row:last"); 
			} else {
				$("#commentContainer").append(cloneDiv);
// 				console.log(i + "," + "일반" + cloneDiv.html());
			}
// 			console.log("댓글들", $("#commentContainer > .comment-row:gt(3)"));
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

//수정 취소 누를때
function cancelUpdate(c_no) {
	 $("#updateCommentDiv_" + c_no).hide();
	 $("#view_comment_" + c_no).show();
}

function updateComment(c_no) {
	var c_content = $("#updateCommentDiv_" + c_no).find(".c_content").val();
	if (c_content.length < 1 || c_content.trim() == "") {
		alert("1자 이상 입력해야 글을 등록할 수 있습니다.");
		return false;
	}
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
	var url = "/comment/deleteComment";
	if(confirm("삭제 하시겠습니까?")) {
		var sendData = {
				"h_no" : "${hobbyVo.hobby_no}",
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
				if(rData == 0) {
					alert("답댓이 있는 댓글은 삭제할 수 없습니다.");
				} else {
					selectCommentList();
				}
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

function make2digits(num) {
	if (num < 10) {
		num = "0" +  num;
	}
	return num;
}

function changeDateString(timestamp) {
	var d = new Date(timestamp);
	var year = d.getFullYear();
	var month = d.getMonth() + 1;
	var date = d.getDate();
	var hour = make2digits(d.getHours());
	var minute = make2digits(d.getMinutes());
	return year + "." + month + "." + date + ". " + hour + ":" + minute;
}
</script>
</body>
</html>