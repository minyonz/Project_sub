<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!-- 이벤트 -->

<div class="row">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
			
				<div class="container">
	
					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link active" href="/main/mainEvent">진행중인 이벤트</a></li>
						<li class="nav-item"><a class="nav-link" href="#">종료된 이벤트</a></li>
					</ul>
				</div>
				
				<table class="table table-borderless">
				  <thead>
				    <tr>
				      <th scope="col" colspan="2"><h3>제목입니다아아</h3></th>
				      
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">이벤트 진행 기간 : 2021/07/20 ~ 2021/07/21</th>
				      <td class="text-right">작성일 : 2021/07/20 10:20:15</td>
				    </tr>
				    <tr>
				      <td colspan="2">
				      	<img src="/resources/img/logo.png" class="rounded mx-auto d-block" alt="..."
							width="1200px" height="400px">
				      </td>
				    </tr>
				    <tr>
				    	<td colspan="2">
				    		내용
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