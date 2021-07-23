<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../manager_include/manager_header.jsp" %>
<script>
$(document).ready(function() {
	
	$(".list").each(function() {
		$(this).click(function() {
			if ($(this).attr("id") == "listAll") {
				$(".list").removeClass("active");
				$(this).addClass("active");
				var url = "/manager/getEventListAll";
				
			} else if ($(this).attr("id") == "list") {
				$(".list").removeClass("active");
				$(this).addClass("active");
				var url = "/manager/getEventList";
				
			} else if ($(this).attr("id") == "listEnd") {
				$(".list").removeClass("active");
				$(this).addClass("active");
				var url = "/manager/getEventListEnd";
				
			} else if ($(this).attr("id") == "listDelete") {
				$(".list").removeClass("active");
				$(this).addClass("active");
				var url = "/manager/getEventListDelete";
			}
			
			$.get(url, function(receivedData) {
				var cloneTr;
				// -> 기존에 달려있던 댓글들 모두 삭제
				$("#eventTable > tbody > tr:gt(0)").remove();
				$.each(receivedData, function() {
					var cloneTr = $("#eventTable > tbody > tr:last").clone();
					var td = cloneTr.find("td");
					td.eq(0).text(this.e_no);
					td.eq(1).text(this.m_no);
					td.eq(2).html("<a href='/manager/managerEventContent?e_no=" + this.e_no + "'>" + this.e_title + "</a>");
					td.eq(3).text(this.start_date);
					td.eq(4).text(this.end_date);
					td.eq(5).text(this.reg_date);
					td.eq(6).text(this.mod_date);
					td.eq(7).text(this.e_img);
					td.eq(8).text(this.del_date);
					// 삭제버튼 만들때 data-cno = c_no 넣음
					
					$("#eventTable > tbody").append(cloneTr);
					cloneTr.show("slow");
				});
			});
		});
		
	});
	
});
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">이벤트</h1>
	<div class="card shadow mb-4">
		<div class="card-body">
		
			<!-- 검색 -->
			<div class="input-group">
				<div class="dropdown">

					<select name="category"
						class="btn btn-outline-light green_background dropdown-toggle"
						data-bs-toggle="dropdown" aria-expanded="false">
						<option class="dropdown-item" value="ca">검색 옵션</option>
						<option class="dropdown-item" value="1">1</option>
						<option class="dropdown-item" value="2">2</option>
						<option class="dropdown-item" value="3">3</option>
						<option class="dropdown-item" value="4">4</option>
					</select>


				</div>

				<input id="searchText" type="text" class="form-control"
					aria-label="Text input with dropdown button" placeholder="이벤트 검색">

				<button type="button" class="btn btn-outline-light green_background" id="button-addon2">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
						<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
					</svg>
					<span class="visually-hidden">검색</span>
				</button>
			</div>
			<!-- 검색 끝 -->
			
		</div>
	</div>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold green_color" style="float:left;">이벤트</h6>
			<select name="category"
				class="btn btn-outline-light green_background dropdown-toggle"
				data-bs-toggle="dropdown" aria-expanded="false">
				<option class="dropdown-item" value="ca">작성일 순</option>
				<option class="dropdown-item" value="1">이벤트 시작일 순</option>
				<option class="dropdown-item" value="2">이벤트 종료일 순</option>
			</select>
			<a href="/manager/managerEventWrite" type="button" class="btn btn-success green_background float-right">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
			  <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
			</svg>
			글쓰기</a>
					
		</div>
		
		<div class="card-body">
		
		<ul class="nav nav-tabs">
			<li class="nav-item"><button id="listAll" class="green_color nav-link list">전체 이벤트</button></li>
			<li class="nav-item"><button id="list" class="green_color nav-link list active">진행중인 이벤트</button></li>
			<li class="nav-item"><button id="listEnd" class="green_color nav-link list">종료된 이벤트</button></li>
			<li class="nav-item"><button id="listDelete" class="green_color nav-link list">삭제된 이벤트</button></li>
		</ul>
		
		<table class="table" id="eventTable">
		  <thead>
		    <tr>
		      <th scope="col">글 번호</th>
		      <th scope="col">작성자</th>
		      <th scope="col">제목</th>
		      <th scope="col">시작일</th>
		      <th scope="col">종료일</th>
		      <th scope="col">작성일</th>
		      <th scope="col">수정일</th>
		      <th scope="col">첨부파일</th>
		      <th scope="col">삭제일</th>
		    </tr>
		  </thead>
		  <tbody>
		 	<c:forEach var="event" items="${eventList}">
		    <tr id="tr">
		      <td scope="row">${event.e_no}</td>
		      <td>${event.m_no}</td>
		      <td><a href="/manager/managerEventContent?e_no=${event.e_no}">${event.e_title}</a></td>
		      <td>${event.start_date}</td>
		      <td>${event.end_date}</td>
		      <td>${event.reg_date}</td>
		      <td>${event.mod_date}</td>
		      <td>${event.e_img}</td>
		      <td>${event.del_date}</td>
		    </tr>
		    </c:forEach>
		  </tbody>
		</table>

		</div>
	</div>
	

</div>
<!-- /.container-fluid -->


<%@ include file="../manager_include/manager_footer.jsp" %>