<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../manager_include/manager_header.jsp" %>


<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">이벤트 글 수정</h1>
	<form action="/manager/managerEventModifyRun" method="post">
	<input type="text" id="e_no" name="e_no" value="${eventVo.e_no}">
	<input type="text" id="e_img" name="e_img" value="테스트 이미지1">

		<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div
			class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			<h6 class="m-0 font-weight-bold green_color">이벤트</h6>

		</div>

		<div class="card-body">
			<div class="mb-3">
			    <label for="e_title" class="form-label">제목</label>
			    <input type="text" class="form-control" id="e_title" name="e_title" value="${eventVo.e_title}"  required>
			  </div>
			  
			  <div class="form-group row">
			  <div class="col-lg-6 col-md-6 mb-3" style="float:left;">
			      <label for="start_date">이벤트 시작일</label>
			      <input type="date" class="form-control" id="start_date" name="start_date"
			      	value="${eventVo.start_date}">
			      
			    </div>
			    <div class="col-lg-6 col-md-6 mb-3">
			      <label for="end_date">이벤트 종료일</label>
			      <input type="date" class="form-control" id="end_date" name="end_date"
			      	value="${eventVo.end_date}">
			      </div>
			    </div>
			    
			    <div class="form-group">
			    <label for="exampleFormControlTextarea1">이미지</label>
			    <img class="card-img-top rounded" alt="EventImage" src="/resources/img/eximage.png" />
			    </div>
			    <div class="form-group">
			    <label for="e_content">내용</label>
			    <textarea class="form-control" id="e_content" name="e_content" rows="10">${eventVo.e_content}</textarea>
			  </div>
			

		</div>
	</div>
	



<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-body">
				
			<button type="submit" class="btn btn-success green_background">수정</button>	
			<a href="/manager/managerEventContent?e_no=${eventVo.e_no}"type="button" class="btn btn-danger orange_background">취소</a>	
		
		</div>
	</div>
	</form>
</div>
<!-- /.container-fluid -->

<%@ include file="../manager_include/manager_footer.jsp" %>