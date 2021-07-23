<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../manager_include/manager_header.jsp" %>


<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">이벤트</h1>
	
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div
			class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			<h6 class="m-0 font-weight-bold green_color">이벤트 게시글</h6>
			<div class="dropdown no-arrow">
				<a class="dropdown-toggle" href="#" role="button"
					id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i
					class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
				</a>
				<div
					class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
					aria-labelledby="dropdownMenuLink">
					<div class="dropdown-header">Dropdown Header:</div>
					<a class="dropdown-item" href="/manager/managerEventModify?e_no=${eventVo.e_no}">이벤트 수정</a>
					<a class="dropdown-item" href="/manager/managerEventDeleteRun?e_no=${eventVo.e_no}">이벤트 삭제</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div>
			</div>
		</div>

		<div class="card-body">
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
						<td colspan="2"><img class="card-img-top rounded"
							alt="EventImage" src="/resources/img/eximage.png" /></td>
					</tr>
					<tr>
						<td colspan="2">${eventVo.e_content}</td>
					</tr>
				</tbody>
			</table>


		</div>
	</div>
	<div class="card shadow mb-4">
		<div class="card-body">

			<a href="/manager/managerEvent" type="button" class="btn btn-success green_background">목록</a>

		</div>
	</div>
</div>
<!-- /.container-fluid -->



<%@ include file="../manager_include/manager_footer.jsp" %>