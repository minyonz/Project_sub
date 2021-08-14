<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<script>
$(document).ready(function() {
	$("#btnReplyOk").click(function() {
		// 쪽지 내용
		var msg_content = $("#msg_content").val();
		// 받는 사람
		var msg_receiver = "${messageVo.msg_sender}";
		var sendData = {
				"msg_content"  : msg_content,
				"msg_receiver" : msg_receiver
		};
		console.log(sendData);
		var url = "/message/sendMsg";
		$.ajax({
			"url" : url,
			"method" : "post",
			"dataType" : "text",
			"headers" : {
				"Content-Type" : "application/json"
			},
			"data" : JSON.stringify(sendData),
			"success" : function(receivedData) {
				console.log(receivedData);
				if (receiveData == "success") {
					alert("삭제했습니다.");
					location.href = "/message/messageListReceive";
				}
			}
		});
	}); 
});
</script>
<body>
<!-- 쪽지 답장 모달 -->
<div class="row">
	<div class="col-md-12">
		<div class="modal fade" id="modal-container-552199" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">답장하기</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="text" name="msg_content" id="msg_content"
							class="form-control"/>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="btnReplyOk">답장완료</button>
						<button type="button" class="btn btn-secondary"	data-dismiss="modal" id="btnClose">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- // 쪽지 답장 모달 -->
<div class="container-fluid" style="background: #F5F5F5">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
					<!-- 메인 페이지에서 왼쪽 부분  -->
				</div>
				<div class="col-md-8">
					<!-- 메인 페이지에서 가운데  부분 시작-->
					<div class="row">
					<div class="col-md-2"></div>
						<div class="col-md-8">
						<!-- 내부 패널 메인 -->
						<div class="checkout__order">
							<div class="workroom_box row" style="height: 39px; display:flex;">
							<h4>쪽지함</h4>
								<a href="" class="fa fa-pencil" style="margin-top: 5px; margin-left: 10px;"></a>
							</div>
							<!-- <hr> -->
							<div class="row">
								<div class="col-md-12">
									<table class="table">
										<tbody>
										<tr>
											<th>#</th>
											<td>${messageVo.msg_no}</td>
										</tr>
										<tr>
											<th>쪽지내용</th>
											<td>${messageVo.msg_content}</td>
										</tr>
										<tr>
											<th>보낸사람</th>
											<td>${messageVo.msg_sender}</td>
										</tr>
										<tr>
											<th>보낸날짜</th>
											<td>${messageVo.msg_senddate}</td>
										</tr>
										<tr>
											<th>읽은날짜</th>
											<td>${messageVo.msg_opendate}</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<a class="btn btn-primary" href="/message/messageListReceive">받은쪽지함</a>
									<a class="btn btn-danger"
										href="/message/deleteMessage?msg_no=${messageVo.msg_no}">삭제</a>
								</div>
							</div>
							</div>
							
						</div> <!-- </div class="col-md-6"> --> 
						<div class="col-md-2"></div>
					</div> <!-- </div class="row"> -->
					<!-- 메인 페이지에서 가운데 부분 끝 -->
				</div> 
				<div class="col-md-2">
					<!-- 메인 페이지 오른쪽 부분 -->
				</div>
			</div> 	<!-- </div class="row">  메인 페이지 끝 -->
		</div> <!-- </div class="col-md-12"> -->
	</div> <!-- </div class="row"> -->
</div> <!-- <div class="container-fluid"> -->
</body>

<%@ include file="../include/footer.jsp"%>