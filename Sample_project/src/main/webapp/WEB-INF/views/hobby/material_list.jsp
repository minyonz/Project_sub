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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="${contextPath}/resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/sweetalert2.min.css">
<script>
$(document).ready(function() {
});

</script>
<title>준비물 조회</title>

<style>

/* 화면 width 1300px부터 이렇게 하겠다.라는 뜻*/
@media screen and (min-width: 1300px) {
.myContainer {
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
  	

/*임시 */
a {
 color:black;
}

.category {
	text-decoration: none;
	color: black;
}
.category:hover {
	text-decoration: none;
	color: #1f5e43;
}

.active {
 	background: #1f5e43; 
     border-color: #1f5e43; 
     color: #fff; 
}

.myPagination a:hover {
	background: #1f5e43;
	border-color: #1f5e43;
     color: #fff;
}

.myPagination a {
	display: inline-block;
    width: 30px;
    height: 30px;
    border: 1px solid #b2b2b2;
    font-size: 14px;
/*     color: #b2b2b2; */
    font-weight: 700;
    line-height: 28px;
    text-align: center;
    margin-right: 16px;
    -webkit-transition: all, 0.3s;
    -moz-transition: all, 0.3s;
    -ms-transition: all, 0.3s;
    -o-transition: all, 0.3s;
    transition: all, 0.3s;
}


.info_cate_area table .cate_title {
    text-align: center; 
    /* vertical-align: top; */
    border-right: 1px solid #e6e7e8;
    border-bottom: 1px solid #e6e7e8;
    color: #1f5e43;
    display: block;
    font-weight: 800;
    margin: 0 5px 0 0;
    text-align: center;
    vertical-align: middle;
    font-size: 16px;
    /* width: 100%; */
    padding: 10px;
}

.info_cate_area table td {
    border-bottom: 1px solid #e6e7e8;
    height:50px;
}

.info_cate.row3 {
    background: #fff;
    padding: 13px 10px 8px 12px;
    vertical-align: top;
    margin-top: 0;
    border-right: none;
    border-left: none;
    border-top: none;
}

.info_cate .cate_list {
    font-size: 15px;
    padding: 8px 0;
    line-height: 1;
}
.cate_list a {
    padding: 3px 8px 4px;
    color: #666;
    vertical-align: middle;
    font-size: 14px;
    line-height: 1;
    font-weight: 550;
}
.cate_list a.active {
    color: #fff;
    background: #1f5e43;
    margin: 0;
    border-radius: 16px;
}

.cate_list a:hover {
    color: #1f5e43;
    text-decoration: none;
}

.m_name {
    font-size: 30px;
    font-weight: 800;
}
</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

	<c:set var="m_no" value="m_no=${ms.m_no}" />
	<c:if test="${not empty ms.time }">
		<c:set var="time" value="&time=${ms.time}" />
	</c:if>
	<c:if test="${not empty ms.level }">
		<c:set var="level" value="&level=${ms.level}" />
	</c:if>
	<c:if test="${not empty ms.cost }">
		<c:set var="cost" value="&cost=${ms.cost}" />
	</c:if>
	
	<c:if test="${not empty ms.sort }">
		<c:set var="sort" value="&sort=${ms.sort}" />
	</c:if>

			

<div class="container-fluid">
	<div class="myContainer">
		<div class="side side-left">
		</div>
		<div class="body">
		<div class="col-lg-12">
           <div class="filter__item">
           		<div class="row">
					<div class="col-lg-12">
                    	 <div id="divCate" style="display: block;" class="info_cate_area">
	   						 <table>
	      						  <tbody>
	      						  	<tr>
	      						  		<td class="cate_title" style="padding-top: 10px;">
							                <span>시간</span>
	      							     </td>
	      						  		<td>
	      						  			<div class="cate_list">
	               								<a href="search?${m_no}&time=0${cost}${level}${sort}" 
	               									class="${ms.time == 0 ? 'active' : '' }">전체</a>
	               								<c:forEach items="${times}" var="timeVo">
	               									<a href="search?${m_no}&time=${timeVo.time_no}${cost}${level}${sort}" 
	               										class="${timeVo.time_no == ms.time ? 'active' : '' }">${timeVo.time_name}</a>
	               								</c:forEach>
	                						</div>
	      						  		</td>
	      						  	</tr>
	      						  	<tr>
	      						  		<td class="cate_title" style="padding-top: 10px;">
							                <span>비용</span>
	      							     </td>
	      						  		<td>
	      						  			<div class="cate_list">
	               								<a href="search?${m_no}${time}&cost=0${level}${sort}" 
	               									class="${ms.cost == 0 ? 'active' : '' }">전체</a>
	               								<c:forEach items="${costs}" var="costVo">
	               									<a href="search?${m_no}${time}&cost=${costVo.cost_no}${level}${sort}" 
	               										class="${costVo.cost_no == ms.cost ? 'active' : '' }">${costVo.cost_name}</a>
	               								</c:forEach>
	               							</div>
	      						  		</td>
	      						  	</tr>
	      						  	<tr>
	      						  		<td class="cate_title" style="padding-top: 10px;">
							                <span>난이도</span>
	      							     </td>
	      						  		<td>
	      						  			<div class="cate_list">
	               								<a href="search?${m_no}${time}${cost}&level=0${sort}" 
	               									class="${ms.level == 0 ? 'active' : '' }">전체</a>
	               								<c:forEach items="${levels}" var="levelVo">
	               									<a href="search?${m_no}${time}${cost}&level=${levelVo.level_no}${sort}" 
	               										class="${levelVo.level_no == ms.level ? 'active' : '' }">${levelVo.level_name}</a>
	               								</c:forEach>
	               							</div>
	      						  		</td>
	      						  	</tr>
	       						 </tbody>
	   						 </table>
							</div>
						</div>
					</div>
           		 </div>
            	<div class="row" style="margin-bottom: 20px;">	
<%-- 					${ms } --%>
					  <div class="search_found" style="float:left;">
                          <span class="m_name">${ms.m_name}</span> <span>을 쓰는</span> <span class="m_cnt">${ms.count}</span> <span>개의 취미가 있습니다.</span>
                      </div>
						<div style="margin-left:auto;">
							<a class="category sort" id="allSort" ${ms.sort == 'all' ? 'style="color: #1f5e43;"' : '' }
								href="search?${m_no}${time}${cost}${level}&sort=all">전체</a> <span> |</span> 
							<a class="category sort" id="newSort" ${ms.sort == 'new' ? 'style="color: #1f5e43;"' : '' }
								 href="search?${m_no}${time}${cost}${level}&sort=new">최신순</a> <span> |</span> 
							<a class="category sort" id="likeSort" ${ms.sort == 'like' ? 'style="color: #1f5e43;"' : '' }
								href="search?${m_no}${time}${cost}${level}&sort=like">좋아요순</a> <span> |</span> 
							<a class="category sort" id="viewSort" ${ms.sort == 'view' ? 'style="color: #1f5e43;"' : '' }
								href="search?${m_no}${time}${cost}${level}&sort=view">조회수순</a> <span> |</span> 
							<a class="category sort" id="cmtSort" ${ms.sort == 'cmt' ? 'style="color: #1f5e43;"' : '' }
								href="search?${m_no}${time}${cost}${level}&sort=cmt">댓글순</a> 
						</div>
					</div>
            <div class="row">
            	<c:forEach items="${hmList}" var="hobbyVo">
	                <div class="col-lg-4 col-md-6 col-sm-6">
	                    <div class="product__item">
	                        <div class="product__item__pic set-bg" data-setbg="/displayImage?filePath=${hobbyVo.main_img}" 
	                       	 style="background-image: url(&quot;/displayImage?filePath=${hobbyVo.main_img}&quot;);">
	                            <ul class="product__item__pic__hover">
	                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
	                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
	                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
	                            </ul>
	                        </div>
	                        <div class="product__item__text">
	                        	${hobbyVo }
	                            <h6><a href="/hobby/content/${hobbyVo.hobby_no}">${hobbyVo.hobby_title}</a></h6>
	                            <h5>${hobbyVo.user_nick}</h5>
	                        </div>
	                    </div>
	                </div>
            	</c:forEach>
            </div>
            <div class="myPagination" style="text-align: center;">
            <c:set var="prev" value="${ms.endPage - ms.PAGE_BLOCK}"/>
            <c:set var="next" value="${ms.startPage + ms.PAGE_BLOCK}"/>
            
            	<c:if test="${prev > 0}">
               		 <a href="search?m_no=${ms.m_no}&sort=${ms.sort}&page=${prev}"><i class="fa fa-long-arrow-left"></i></a>
                </c:if>
            	<c:forEach var="v" begin="${ms.startPage}" end="${ms.endPage}">
	                <a class="${v == ms.page ? 'active' : '' }" 
	                	href="search?m_no=${ms.m_no}&sort=${ms.sort}&page=${v}">${v}</a>
				</c:forEach>
				<c:if test="${next <= ms.totalPage}">
               		 <a href="search?m_no=${ms.m_no}&sort=${ms.sort}&page=${next}"><i class="fa fa-long-arrow-right"></i></a>
                </c:if>
            </div>
        </div>
		</div>
		<div class="side side-right">
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>
<script>
// var loginVo = "${loginVo}";
// if (loginVo == "") {
// 	console.log("loginVo 없음:", loginVo);
// }
</script>
</body>
</html>