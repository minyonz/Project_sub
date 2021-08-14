<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<script>
$(document).ready(function() {
	var msg_delete = "${msg_delete}";
	if (msg_delete == "true") {
		alert("쪽지를 삭제했습니다.");
	} else if (msg_delete == "false") {
		alert("쪽지 삭제에 실패했습니다.");
	}

	// 쪽지 보내기 링크
	$("#sendMessage").click(function(){
		var user_id =  $(this).attr("data-user_id");
		console.log("user_id: " + user_id);
		
		//$("#btnSendMessage").attr("data-msg_receiver", user_id);
		$("#btnSendMessage").attr("data-msg_receiver", "cat"); 
		
	});

	//쪽지 모달 보내기 버튼
	$("#btnSendMessage").click(function() {
		console.log("쪽지 모달 보내기 버튼 클릭");
		var that = $(this);
		//var msg_sender = ${memberVo.user_id}; // 세션에서 받은 아이디
		var msg_sender = "dog"; // 세션에서 받은 아이디
		// 데이터를 수집하는 부분
		var msg_content = $("#msg_content").val();
		var msg_receiver = $(this).attr("data-msg_receiver");
		// 각 데이터를 합치는 부분
		var sendData = {
		//		"msg_sender" : msg_sender, <- 세션에서 받아온 아이디
				"msg_receiver" : msg_receiver,
				"msg_content" : msg_content
		};
		console.log(sendData);
		
		// 데이터를  Controller에 보내는 주소  
		var url = "/message/sendMessage";
		$.ajax({
			"url" : url,
			"method" : "post",
			"dataType" : "text",
			"headers" : {
				"Content-Type" : "application/json"
			},
			"data" : JSON.stringify(sendData), // JSON형식의 sendData라는 명령어로 데이터들을 보낸다..
			"success" : function(receivedData) { // MessageController 에서 sendMessage의 return "success"; 값
				console.log(receivedData);
				if(receivedData == "success"){
					// 쪽지 내용 초기화 추가하기...
					// msg_content = "";
					that.next().trigger("click");
				}
			}
		});
	});
});
</script>
<%-- ${list} --%>
<body>
<!-- 쪽지 보내기 모달창 -->
<div class="row">
	<div class="col-md-12">
<!-- 		<a id="modal-915236" href="#modal-container-915236" role="button"
			class="btn" data-toggle="modal">Launch demo modal</a> -->
		<div class="modal fade" id="modal-container-915236" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">쪽지 보내기</h5>
						<button type="button" class="close" data-dismiss="modal" >
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="text" class="form-control" id="msg_content"/>
					</div>
					<div class="modal-footer">

						<button type="button" class="btn btn-primary" id="btnSendMessage">보내기</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- // 쪽지 보내기 모달창 -->
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
					<div class="col-md-3">
						<!-- 내부 패널 왼쪽 -->
						<%@ include file="../include/mypageSide.jsp"%>
					</div>
					<div class="col-md-9">
							<!-- 내부 패널 메인 -->
							<!-- <div class="container mt-3"> -->
								<!-- <h2>보낸 쪽지 목록</h2> -->
								<div class="checkout__order">
								<div class="workroom_box row" style="height: 39px; display:flex;">
									<h4>보낸 쪽지 목록</h4>
									<a href="" class="fa fa-pencil" style="margin-top: 5px; margin-left: 10px;"></a>
								</div>
								
								<!-- 테스트로 추가한 부분 -->
<!-- 								<a type ="button" href="#modal-container-915236" id="sendMessage" 
								   data-toggle = "modal" data-user_id="cat" class="btn green_background white_color">쪽지 보내기</a> 
								<a href="#modal-container-552199" class="btn btn-warning" data-toggle="modal">답장하기</a> -->
								
								<br>
								<!-- Nav tabs -->
<!-- 								<ul class="nav nav-tabs"> -->
<!-- 									<li class="nav-item"> -->
<!-- 										<a class="nav-link"	data-toggle="tab" href="/message/messageListSend">보낸 쪽지함</a></li> -->
<!-- 									<li class="nav-item"> -->
<!-- 										<a class="nav-link active" data-toggle="tab" href="/message/messageListReceive">받은 쪽지함</a></li> -->
<!-- 								</ul> -->
								<ul class="nav nav-tabs">
									<li class="nav-item"><a class="nav-link active" href="/message/messageListSend">보낸 쪽지함</a></li>
									<li class="nav-item"><a class="nav-link" href="/message/messageListReceive">받은 쪽지함</a></li>
								</ul>
								
								
								<div class="row">
									<div class="col-md-12">
										<table class="table">
											<thead>
												<tr>
													<th>#</th>
													<th>받은사람</th>
													<th>쪽지내용</th>
													<th>보낸날짜</th>
													<th>읽은날짜</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach var="messageVo" items="${list}">
											<tr>
												<td>${messageVo.msg_no}</td>
												<td>${messageVo.msg_receiver}</td>
												<td>
													<span <c:if test="${empty messageVo.msg_opendate}">
														style="font-weight:bold"
												          </c:if>
												     >
													<a href="/message/messageRead?msg_no=${messageVo.msg_no}">${messageVo.msg_content}</a>
													</span>
												</td>
												<td>${messageVo.msg_senddate}</td>
												<td>
													<c:choose>
													<c:when test="${empty messageVo.msg_opendate}">읽지 않음
													</c:when>
													<c:otherwise>
														${messageVo.msg_opendate}
													</c:otherwise>
													</c:choose>
												</td>
											</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div><!-- </div class="col-md-12"> -->
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