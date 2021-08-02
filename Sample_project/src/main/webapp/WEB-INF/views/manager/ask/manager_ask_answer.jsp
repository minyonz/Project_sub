<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../manager_include/manager_header.jsp" %>

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<div style="display: flex;">
		<h1 class="h3 mb-2 text-gray-800">1:1문의 답변</h1>
		<a href="/manager/managerAsk" class="btn btn-success green_background" style="margin-left: auto; margin-bottom: 20px">목록</a>
	</div>


	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold green_color">문의</h6>
		</div>
		<div class="card-body">
		
			<table class="table">
			  <tbody>
			    <tr>
			      <th scope="row">번호</th>
			      <td>${qnaVo.qna_no}</td>
			      <th style="width: 15%; border-left: 1px solid lightgray">회원 아이디</th>
			      <td style="width: 20%">${qnaVo.user_id}</td>
			      <th style="width: 15%; border-left: 1px solid lightgray">작성일</th>
			      <td style="width: 20%">${qnaVo.save_time}</td>
			    </tr>
			    <tr>
			      <th scope="row">제목</th>
			      <td colspan=5 style="width: 90%">${qnaVo.title}</td>
			    </tr>
			    <tr>
			      <th scope="row">내용</th>
			      <td colspan=5 style="width: 90%">${qnaVo.content}</td>
			      
			    </tr>
			  </tbody>
			</table>
		
		</div>
	</div>
	
	
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold green_color">답변</h6>
		</div>
		<div class="card-body">
			<form>
				<table class="table">
				  <tbody>
				    <tr>
				      <th scope="row">관리자</th>
				      <td style="width: 90%">꼼지락</td>
				    </tr>
				    <tr>
				      <th scope="row">내용</th>
				      <td style="width: 90%">
				      		<textarea class="form-control" id="exampleFormControlTextarea1" rows="10"></textarea>
				      </td>
				    </tr>
				  </tbody>
				</table>
				<div style="display: flex;">
					<button type="submit" class="btn btn-success green_background" style="margin-left: auto">답변</button>
					<a href="/manager/managerAsk" type="button" class="btn btn-danger orange_background" style="margin-left: 10px">취소</a>
				</div>
				
			</form>
		
		</div>
	</div>

</div>
<!-- /.container-fluid -->


<%@ include file="../manager_include/manager_footer.jsp" %>