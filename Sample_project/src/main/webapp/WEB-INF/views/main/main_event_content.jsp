<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!-- 이벤트 -->
<div class="row">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
			
				<table class="table table-borderless">
				  <thead>
				    <tr>
				      <th scope="col" colspan="2"><h3>${eventVo.e_title}</h3></th>
				      
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">이벤트 진행 기간 : ${eventVo.start_date} ~ ${eventVo.end_date}</th>
				      <td class="text-right">작성일 : ${eventVo.reg_date}</td>
				    </tr>
				    <tr>
				      <td colspan="2">
				      	<img src="/resources/img/logo.png" class="rounded mx-auto d-block" alt="..."
							width="1200px" height="400px">
				      </td>
				    </tr>
				    <tr>
				    	<td colspan="2">
				    		${eventVo.e_content}
				    	</td>
				    </tr>
				  </tbody>
				</table>
				<div class="row justify-content-center">
					<a href="/main/mainEvent" type="button" class="btn btn-success green_background center">목록</a>
				</div>			
			</div>
			
			<div class="col-md-2"></div>
		</div>
	</div>
</div>

<!-- 이벤트 끝 -->

<%@ include file="../include/footer.jsp" %>