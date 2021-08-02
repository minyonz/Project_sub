<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<c:choose>
	<c:when test="${qnaVo.a_no != 0}">
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold green_color">답변</h6>
		</div>
		<div class="card-body">
		
			<table class="table">
			  <tbody>
			    <tr>
			      <th scope="row">번호</th>
			      <td>01</td>
			      <th style="width: 15%; border-left: 1px solid lightgray">관리자</th>
			      <td style="width: 20%">manager</td>
			      <th style="width: 15%; border-left: 1px solid lightgray">작성일</th>
			      <td style="width: 20%">2021/07/17 15:16:23</td>
			    </tr>
			    <tr>
			      <th scope="row">제목</th>
			      <td colspan=5 style="width: 90%">답변 : Jacob</td>
			    </tr>
			    <tr>
			      <th scope="row">내용</th>
			      <td colspan=5 style="width: 90%">내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
			      				내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
			      				내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</td>
			      
			    </tr>
			  </tbody>
			</table>
		
		</div>
	</div>
	</c:when>
	<c:otherwise>
	<a href="/manager/managerAskAnswer?qna_no=${qnaVo.qna_no}" type="button" class="btn btn-success green_background">답변하기</a>
	</c:otherwise>
	</c:choose>
	


</div>
<!-- /.container-fluid -->


<%@ include file="../manager_include/manager_footer.jsp" %>