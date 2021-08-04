<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- 순서이동 -->
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>

<!-- 모달  -->
<script src="${contextPath}/resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/sweetalert2.min.css">

<script defer>
	$(document).ready(function() {
		//* 카테고리 부분
		var jsonData = JSON.parse('${cates}');
		var cate1Arr = new Array();
		var cate1Obj = new Object();
		// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
		for(var i = 0; i < jsonData.length; i++) {
		 
		 if(jsonData[i].cate_level == "1") {
		  cate1Obj = new Object();  //초기화
		  cate1Obj.cate_no = jsonData[i].cate_no;
		  cate1Obj.cate_name = jsonData[i].cate_name;
		  cate1Arr.push(cate1Obj);
		 }
		}
		// 1차 분류 셀렉트 박스에 데이터 삽입
		var cate1Select = $("select.cate1")
		var selectedCate1 = "${hobbyVo.l_cate_no}"
		console.log(selectedCate1);
		for(var i = 0; i < cate1Arr.length; i++) {
			if(cate1Arr[i].cate_no == selectedCate1) {
				cate1Select.append("<option value='" + cate1Arr[i].cate_no + "' selected>"
				      + cate1Arr[i].cate_name + "</option>");
			} else {
			 cate1Select.append("<option value='" + cate1Arr[i].cate_no + "'>"
		      + cate1Arr[i].cate_name + "</option>"); 
			}
		}
	

		 var cate2Arr = new Array();
		 var cate2Obj = new Object();
		 
		 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
		 for(var i = 0; i < jsonData.length; i++) {
		  if(jsonData[i].cate_level == "2") {
		   cate2Obj = new Object();  //초기화
		   cate2Obj.cate_no = jsonData[i].cate_no;
		   cate2Obj.cate_name = jsonData[i].cate_name;
		   cate2Obj.parent_cate_no = jsonData[i].parent_cate_no;
		   cate2Arr.push(cate2Obj);
		  }
		 }
		 //수정용 임시로 보여줄 2차분류
		 var selectedCate2 = "${hobbyVo.m_cate_no}"
		 var cate2Select = $("select.cate2");
		  for(var i = 0; i < cate2Arr.length; i++) {
		   if(selectedCate1 == cate2Arr[i].parent_cate_no) {
			   if(cate2Arr[i].cate_no == selectedCate2) {
				   cate2Select.append("<option value='" + cate2Arr[i].cate_no + "' selected>"
					      + cate2Arr[i].cate_name + "</option>");
				} else {
				 	cate2Select.append("<option value='" + cate2Arr[i].cate_no + "'>"
			      + cate2Arr[i].cate_name + "</option>"); 
				}
		   } 
		  }
		
		  //1차분류에따라 보여줄 2차분류들
		$(document).on("change", "select.cate1", function(){
		
			 cate2Select.children().remove();
	
			 $("option:selected", this).each(function(){
			  
			  var selectVal = $(this).val();  
			  cate2Select.append("<option value=''>중분류</option>");
			  
			  for(var i = 0; i < cate2Arr.length; i++) {
			   if(selectVal == cate2Arr[i].parent_cate_no) {
			    cate2Select.append("<option value='" + cate2Arr[i].cate_no + "'>"
			         + cate2Arr[i].cate_name + "</option>");
			   }
			  }
			 });
		});
		
		//* 시간 카테고리
		var times = JSON.parse('${times}');
		var timeArr = new Array();
		var timeObj = new Object();
 		// 셀렉트 박스에 삽입할 데이터 준비
		for(var i = 0; i < times.length; i++) {
			timeObj = new Object();  //초기화
			timeObj.time_no = times[i].time_no;
			timeObj.time_name = times[i].time_name;
			timeArr.push(timeObj);
		}
		// 셀렉트 박스에 데이터 삽입
		var timeSelect = $("select.time-cate")
		var selectedTime = "${hobbyVo.time_no}"
		for(var i = 0; i < timeArr.length; i++) {
			if(timeArr[i].time_no == selectedTime) {
				timeSelect.append("<option value='" + timeArr[i].time_no + "' selected>"
				      + timeArr[i].time_name + "</option>");
			} else {
				timeSelect.append("<option value='" + timeArr[i].time_no + "'>"
		      + timeArr[i].time_name + "</option>"); 
			}
		}
		//* 난이도 카테고리
		var levels = JSON.parse('${levels}');
		var levelArr = new Array();
		var levelObj = new Object();
 		// 셀렉트 박스에 삽입할 데이터 준비
		for(var i = 0; i < levels.length; i++) {
			levelObj = new Object();  //초기화
			levelObj.level_no = levels[i].level_no;
			levelObj.level_name = levels[i].level_name;
			levelArr.push(levelObj);
		}
		// 셀렉트 박스에 데이터 삽입
		var levelSelect = $("select.level-cate")
		var selectedLevel = "${hobbyVo.level_no}"
		for(var i = 0; i < levelArr.length; i++) {
			if(levelArr[i].level_no == selectedLevel) {
				levelSelect.append("<option value='" + levelArr[i].level_no + "' selected>"
				      + levelArr[i].level_name + "</option>");
			} else {
				levelSelect.append("<option value='" + levelArr[i].level_no + "'>"
		      + levelArr[i].level_name + "</option>"); 
			}
		}
		
		
		//* 비용 카테고리
		var costs = JSON.parse('${costs}');
		var costArr = new Array();
		var costObj = new Object();
 		// 셀렉트 박스에 삽입할 데이터 준비
		for(var i = 0; i < costs.length; i++) {
			costObj = new Object();  //초기화
			costObj.cost_no = costs[i].cost_no;
			costObj.cost_name = costs[i].cost_name;
			costArr.push(costObj);
		}
		// 셀렉트 박스에 데이터 삽입
		var costSelect = $("select.cost-cate")
		var selectedCost = "${hobbyVo.cost_no}"
		for(var i = 0; i < costArr.length; i++) {
			if(costArr[i].cost_no == selectedCost) {
				costSelect.append("<option value='" + costArr[i].cost_no + "' selected>"
				      + costArr[i].cost_name + "</option>");
			} else {
				costSelect.append("<option value='" + costArr[i].cost_no + "'>"
		      + costArr[i].cost_name + "</option>"); 
			}
		}
		
		// * 만들기 부분
		$("#stepBoxWrap").sortable({
// 			placeholder : "placeholder",
// 			start : function(event, ui) {
// 				ui.item.data('start_pos', ui.item.index());
// 			},
			stop : function(event, ui) {
				reorder();
			}
		});
		
		$(".existStepBox").hover(
			function() {
				$(this).find('.divStepBtn').show();
			},
			function() {
				$(this).find('.divStepBtn').hide();
			}
		);
		
	});
	
	function showNote(seq) {
		$("#divStepNote_" + seq).toggle();
		reorder();
	}
	
	function showTip(seq) {
		$("#divStepTip_" + seq).toggle();
		reorder();
	}
	
	function showLink(seq) {
		$("#divStepLink_" + seq).toggle();
		reorder();
	}
	
	function showAll(seq) {
		// 셋중하나라도 안보이는 상태에 전체보기 누르면 -> 다보여주기
		if($("#divStepNote_" + seq).css("display") == "none" || $("#divStepTip_" + seq).css("display") == "none" || $("#divStepLink_" + seq).css("display") == "none") {
			$("#divStepNote_" + seq).show();
			$("#divStepTip_" + seq).show();
			$("#divStepLink_" + seq).show();
		} else {
			// 셋중하나라도 보이는 상태에 전체보기 누르면 -> 전부다 숨기기
			$("#divStepNote_" + seq).hide();
			$("#divStepTip_" + seq).hide();
			$("#divStepLink_" + seq).hide();
		}
		
		reorder();
	}
	
	function openStepGuide() {
		 $('#stepExtraGuideModal').modal('show');
	}
	
	function getMakeSteplength() {
		var length = $(".existStepBox").length;
		// 삭제하기전 남아있는 요소 개수 리턴
		return length;
	}
	function moveUp(seq) {
		$("#stepBox_" + seq).insertBefore($("#stepBox_" + (seq - 1)));
		reorder();
	}
	function moveDown(seq) {
		$("#stepBox_" + seq).insertAfter($("#stepBox_" + (seq + 1)));
		reorder();
	}
	function addStepBox(seq) {
		$(createBox()).insertAfter($("#stepBox_" + seq));;
		reorder();
	}
	
	function delStepBox(seq) {
		var length = getMakeSteplength();
		if (length < 4) {
			Swal.fire({
				text: '만들기 순서는 최소 3개 이상이어야 합니다.', 
				allowOutsideClick: false,
				iconColor: "#1f5e43",
				icon: 'warning', 
				confirmButtonText: "확인",
				confirmButtonColor: "#1f5e43",
			});
			return false;
		}
		
		var thisStepBox = $("#stepBox_" + seq);
		
		if (thisStepBox.find(".stepText").val() != "") {
			Swal.fire({
				text: '입력하신 내용이 있습니다 삭제하시겠습니까?', 
				allowOutsideClick: false,
				iconColor: "#1f5e43",
				icon: 'question', 
				confirmButtonText: "확인",
				confirmButtonColor: "#1f5e43",
				cancelButtonText: "취소",
				showCancelButton: true,
			}).then(function(result) {
				if(result.isConfirmed) {
					thisStepBox.fadeOut(200,function() {
				        var step_no = thisStepBox.find(".step_no").val();
				        var step_text = thisStepBox.find(".stepText").val();
						if (step_no > 0) { // 원래 있던 박스이면 (db에있던거면)
							var deletedBox = 
								'<div class="stepBox" >'
									+'<input type="hidden" class="step_no" name="makeSteps['+ (seq - 1) +'].step_no" value="'+ step_no +'"/>'
									+'<input type="hidden" class="is_del" name="makeSteps['+ (seq - 1) +'].is_del" value="Y"/>'
								+'</div>'
								$("#stepBoxWrap").append(deletedBox);
								console.log(deletedBox);
						}
						thisStepBox.remove();
				    	reorder();
				    });
				} else {
					
				}
			});
			return false;
		} else {
			thisStepBox.fadeOut(200,function() {
		        $(this).remove();
		    	reorder();
		    });
		}
	    
	}
	
	function reorder() {
	    $(".stepBox").each(function(i, box) {
	    	//step_no
	    	$(box).find(".step_no").attr({
				"data-index" : i,
				name : "makeSteps[" + i + "].step_no"
       	    });
	    	//is_del
	    	$(box).find(".is_del").attr("name", "makeSteps[" + i + "].is_del");
	    	
	    });
	    
	    $(".existStepBox").each(function(i, box) {
	    	$(box).attr("id", "stepBox_" + (i + 1));
			var index = $(box).find(".step_no").attr("data-index");
	    	
	    	// divStpNum 부분
	        $(box).find(".stepNum_span").html(i + 1);
	        $(box).find(".stepNum_hidden").attr("name", "makeSteps[" + index + "].make_step_num").val(i + 1);
	        
	        //divStepUpload부분
	        $(box).find(".stepImg_label").attr("for", "stepImg_file_" + (i + 1));
	        $(box).find(".previewImg_step").attr("id", "previewImg_step_" + (i + 1));
	        $(box).find(".stepImg_file").attr({
	        	id : "stepImg_file_" + (i + 1),
	        	onchange : "previewMakeStepImg(this," + (i + 1) + ")"
	        });
// 	        $(box).find(".stepImg_file").attr("id", "stepImg_file_" + (i+1));
// 	        $(box).find(".stepImg_file").attr("onchange", "previewMakeStepImg(this," + (i + 1) + ")");
 			$(box).find(".stepImg_hidden").attr({
 				id : "makeSteps[" + index + "].make_step_img",
 				name : "makeSteps[" + index + "].make_step_img"
	        });
// 	        $(box).find(".stepImg_hidden").attr("name", "makeSteps[" + i + "].make_step_img");
// 	        $(box).find(".stepImg_hidden").attr("id", "makeSteps[" + i + "].make_step_img");
 			$(box).find(".btn_delStepImg").attr({
 				id : "btnDelStepImg_" + (i + 1),
 				href : "javascript:delStepImg("+ (i + 1) + ")"
	        });
// 	        $(box).find(".btn_delStepImg").attr("id", "btnDelStepImg_" + (i + 1));
// 	        $(box).find(".btn_delStepImg").attr("href", "javascript:delStepImg("+ (i + 1) + ")");
	       
	       	//divStepText부분
			$(box).find(".stepText").attr("name", "makeSteps[" + index + "].make_step_text");
	       	
	       	//divStepBtn 부분
	        $(box).find(".moveUp").attr("href", "javascript:moveUp("+ (i + 1) + ")");
	        $(box).find(".moveDown").attr("href", "javascript:moveDown("+ (i + 1) + ")");
	        $(box).find(".addStepBox").attr("href", "javascript:addStepBox("+ (i + 1) + ")");
	        $(box).find(".delStepBox").attr("href", "javascript:delStepBox("+ (i + 1) + ")");
	        
	        //노트,팁,링크 부분
	        $(box).find(".showNote").attr("href", "javascript:showNote("+ (i + 1) + ")");
	        $(box).find(".divStepNote").attr("id", "divStepNote_" + (i + 1));
	        $(box).find(".stepNoteText").attr("name", "makeSteps[" + index + "].note");
	       
	        $(box).find(".showTip").attr("href", "javascript:showTip("+ (i + 1) + ")");
	        $(box).find(".divStepTip").attr("id", "divStepTip_" + (i + 1));
	        $(box).find(".stepTipText").attr("name", "makeSteps[" + index + "].tip");
	       
	        $(box).find(".showLink").attr("href", "javascript:showLink("+ (i + 1) + ")");
	        $(box).find(".divStepLink").attr("id", "divStepLink_" + (i + 1));
	        $(box).find(".stepLink_url").attr("name", "makeSteps[" + index + "].link_url");
	        $(box).find(".stepLink_desc").attr("name", "makeSteps[" + index + "].link_desc");
	        $(box).find(".showAll").attr("href", "javascript:showAll("+ (i + 1) + ")");
	    });
	}
	
	
	function createStepBox() {
		$(createBox())
		.appendTo("#stepBoxWrap")
		.hover(
			function() {
				$(this).find('.divStepBtn').show();
			},
			function() {
				$(this).find('.divStepBtn').hide();
			}		
		);
		reorder();
	}
	
	//stepBox반환
	function createBox() {
		var box = $(".stepBox:eq(0)").clone();
		$(box).addClass("none_img");
		$(box).find("textarea").val("");
		$(box).find("input[type=text]").val("");
		$(box).find("input[type=file]").val("");
		$(box).find("input[type=hidden]").val("");
		$(box).find(".btn_delStepImg").hide();
		$(box).find(".stepImg_hidden").val("");
		$(box).find(".previewImg_step").attr("src", "${contextPath}/resources/images/preview_img.jpg");
		$(box).find(".divStepNote").hide();
		$(box).find(".divStepTip").hide();
		$(box).find(".divStepLink").hide();
		
		//수정
		$(box).find(".step_no").val("0");
		console.log($(box).find(".step_no"));
		$(box).find(".is_del").val("N");
		return box;
	}
	
	
</script>

<!-- 스타일  -->
<style>
	input:focus, textarea:focus, select:focus {
		border: 3px solid rgba(31, 94, 67, .75);
	}
	
	.focus {
		border:3px solid rgba(31, 94, 67, .75);
	}
	.cont_box {
		padding:26px 30px; 
		margin-bottom: 10px; 
		border-radius:2px; 
		background-color:white
	}
	
	.stepBox {
		margin-top: 30px;
	}
	.divStepItem {
		display:inline-block;
		margin-left:50px;
	}
	
	.divStepNum {
		cursor:pointer;display: inline-block;overflow: hidden;height: 150px;
		width: 120px;
	    display: inline-block;
	    font-size: 30px;
	    font-weight: bold;
	    vertical-align: top;
	    color: rgb(31, 94, 67);
/* 	    margin-left: 70px; */
	}
	
	.divStepText {
		display:inline-block
	}
	
	.divStepUpload {
		display:inline-block; overflow: hidden;height: 160px;
		position: static;
	}
	
	.previewImg_step {
		width:160px; height:160px; cursor: pointer;
/* 		border: 4px solid rgb(31, 94, 67); */
		border: 1px solid #e1e1e1;
		object-fit: cover;
	}
	
	.container-fluid {
		background-color: #f2f2f3;
	}
	
	select {
    width: 100%;
    height: calc(1.5em + .75rem + 2px);
    padding: .375rem .75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    /* 	background:#fff;  */
/* 	border:1px solid #ced4da;  */
/* 	font-size:16px; */
/* 	padding:8px 2px;  */
/* 	margin:0 2px 0 0; */
/* 	border-radius:.25rem; */
/* 	display: block; */
	}
	
	.cont_box .cont_tit {
    display: inline-block;
    font-size: 17px;
    font-weight: 550;
    margin-right: 15px;
/*     vertical-align: top; */
	}
	
	.row_tit {
		margin-top :25px;
	}
	
	.displayNone {
	display : none;
	}
	
	.check_font {
	color: #1f5e43;
    font-weight: 600;
    font-size: 13px;
	}
	
	.star{
	color: #1f5e43;
    font-style: bold;
    font-weight: bold;
	}
	
	.btn_del {
    display: block;
    opacity: 0.5;
    background: url(${contextPath}/resources/images/del_square.gif) no-repeat center;
    width: 30px;
    height: 30px;
		
	}
	
	.extraBtn {
    padding: 4px 7px 5px;
    font-size: 12px;
    line-height: 1;
    border-radius: 3px;
    color: #333;
    background-color: #fff;
    border: 1px solid #ccc;
    display: inline-block;
    margin: 0 2px;
    font-weight: 400;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    cursor: pointer;
}
.lg_tit {
font-size: 20px; 
font-weight: bold;
margin-right: 15px;
}
.btnAdd {
	outline : none;
	border: none;
	background: url("${contextPath}/resources/images/plus_circle.png") no-repeat left;
	background-size: 18px;
	width:112px;
}
.btnDelMaterial {
	background: url(${contextPath}/resources/images/del_circle.png) no-repeat center;
    width: 15px;
    height: 15px;
    background-size: 15px;
    opacity: 0.75;
    margin-left:2px;
    display: inline-block;
}
	.divStepBtn {
	overflow: hidden;
    display: inline-block;
    padding-bottom: 7px;
    /* height: 160px; */
    /* width: 20px; */
    /* padding-top: 30px; */
    /* vertical-align: middle; */
}
.divStepBtn a {
	width: 30px;
    height: 30px;
    background: #eee;
    color: #999;
    display: block;
    font-size: 13px;
    text-align: center;
    margin: 5px;
    padding-top: 5px;
}
.divStepBtn a:hover, .step_btn a:active, .step_btn a.active {
	background:#1f5e43; 
	color:#fff;
	}
/* 	.btn_delMainImg { */
/*     right: 1rem; */
/*     top: 0; */
/* 	} */
	
/* 	.btn_delStepImg { */
/*     left: 8rem; */
/*     bottom: 10.5rem; */
/*     position: relative; */
/*     display: block; */
/* 	} */


@media screen and (min-width: 1300px) {
.myContainer {
  display: grid; 
  grid-auto-flow: column dense; 
  grid-template-columns: 1fr 4fr 1fr; 
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
</style>
<title>수정하기</title>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<div class="container-fluid">
	<div class="myContainer">
		<div class="side side-left">
	  
	  	</div>
  	    <div class="body">
  			<form id="modFrm" method="post" action="/hobby/updateRun">
  				<input type="hidden" name="hobby_no" value="${hobbyVo.hobby_no}"/>
<%-- 				<input type="hidden" name="user_id" value="${hobbyVo.user_id}"/> --%>
				<div style="background: #f8f8f8; border-bottom: 1px solid #e6e7e8; 
					padding: 14px 18px; position: relative;">
					<span class="lg_tit">취미 작성</span>
					<span class="star">*</span><span style="font-size:15px; font-weight:550;">필수입력</span>
				</div>
			<!-- 취미 메인 정보 박스 -->			
				<div class="cont_box" >
					<div class="row">
						<div class="col-md-1">
						</div>
						<!--취미 메인 정보 내용-->
						<div class="col-md-10">
							<!-- 덩어리1 -->
							<div>
								<div class="row">
									<div class="cont_tit">
										<label for="hobby_title">취미 제목<span class="star">*</span></label>
									</div>
									<div>
										<span class="check_font" id="msgTitle"></span>
									</div>
								</div>
								<div class="row">
									<input type="text" class="form-control main_input" 
										id="hobby_title" name="hobby_title" required 
										value="${hobbyVo.hobby_title}"
										maxlength="40" minlength="2" autocomplete="off"/>
								</div>
								<div class="row float-right" 
									 style="
										    padding-right: 10px;
										    padding-top: 5px;
										    font-size: 13px;
										    font-weight: 550;
										">
									<span id="titleCnt">0</span>
									<span id="titleMaxCnt">/40</span>
								</div>
							</div>
							<!--// 덩어리1 -->
							
							<!--덩어리2-->
							<div>
								<div class="row row_tit">
									<div class="cont_tit">
										<label for="hobby_intro">취미 소개<span class="star">*</span></label>
									</div>
									<div>
										<span class="check_font" id="msgIntro"></span>
									</div>
								</div>
								<div class="row">
									<textarea class="form-control main_input" style="height:80px; resize:none;" 
											 name="hobby_intro" id="hobby_intro" required maxlength="300" minlength="2" 
											 autocomplete="off">${hobbyVo.hobby_intro}</textarea>
								</div>
								<div class="row float-right" 
									 style="
										    padding-right: 10px;
										    padding-top: 5px;
										    font-size: 13px;
										    font-weight: 550;
										">
									<span id="introCnt">0</span>
									<span id="introMaxCnt">/300</span>
								</div>
							</div>
							<!--// 덩어리2-->
							
							<!-- 덩어리3 -->
							<div>
								<div class="row">
									<div class="col-md-5" >
										<div class="row row_tit">
											<div class="cont_tit">
												<label for="mainImg_file">대표 이미지<span class="star">*</span></label>
											</div>
											<div>
												<span class="check_font" id="msgMainImg"></span>
											</div>
										</div>
										<div class="divMainImg" style="width:350px; height:230px; position:relative;">
											<label for="mainImg_file" id="mainImg_label"
												style="width: 350px; height: 230px; overflow: hidden;">
												<img id="previewImg_main" 
													src="/displayImage?filePath=${hobbyVo.main_img}"
													style="width:100%; height:100%; object-fit:cover; cursor:pointer; border: 1px solid #e1e1e1;" >
											</label>
											<input type="file" class="mainImg_file" name="mainImg_file" 
												id="mainImg_file" accept=".gif, .jpg, .png" onchange="previewMainImg(this);"
												style="display:none;width:0px;height:0px;font-size:0px;"/>
											<input type="hidden" name="main_img" id="main_img" value="${hobbyVo.main_img}"/>
											<a id="btnDelMainImg" href="javascript:delMainImg()" class="btn_del"
												style="position:absolute; top:0; right: 0.1rem; "  ></a>
										</div>
									</div>
									<div class="col-md-7" style="padding-left: 20px;">
										<!-- 동영상줄 -->
										<div>
											<div class="row row_tit">
												<div class="cont_tit">
													<label for="hobby_video">동영상</label>
												</div>
												<div>
													<span class="check_font" id="msgVideo"></span>
												</div>
											</div>
											<div class="row">
												<input class="form-control main_input" 
													type="text" value="${hobbyVo.hobby_video}"
													 name="hobby_video" id="hobby_video" autocomplete="off"
													placeholder="유튜브 주소만 가능해요. ex)https://youtu.be/Ab6E2BsuLJ0" ></input>
											</div>
										</div>
										<!-- //동영상줄 -->
										<!-- 카테고리줄 -->
										<div >
											<div class="row row_tit">
												<div class="cont_tit">
													<label>카테고리<span class="star">*</span></label>
												</div>
												<div>
													<span class="check_font" id="msgCate"></span>
												</div>
											</div>
											<div class="row">
												<select name="l_cate_no" id="l_cate_no"
												class="cate cate1 main_select" style="width:49%; margin-right: auto;">
													<option value="">대분류</option>
												</select>
												<select name="m_cate_no" id="m_cate_no"
													class="cate cate2 main_select" style="width:49%">
													<option value="">중분류</option>
												</select>
											</div>
										</div>
										<!-- //카테고리줄 -->
										<!-- 취미정보줄 -->
										<div >
											<div class="row row_tit">
												<div class="cont_tit">
													<label>취미 정보<span class="star">*</span></label>
												</div>
												<div>
													<span class="check_font" id="msgHobbyInfo"></span>
												</div>
											</div>
											<div class="row">
												<select name="time_no" id="time_no"
													class="cate time-cate main_select" style="width:32%; margin-right: auto;">
													<option value="">시간</option>
												</select>
												<select name="level_no" id="level_no"
													class="cate level-cate main_select" style="width:32%; margin-right: auto;">
													<option value="">난이도</option>
												</select>
												<select name="cost_no" id="cost_no"
													class="cate cost-cate main_select" style="width:32%">
													<option value="">비용</option>
												</select>
											</div>
										</div>
										<!--// 취미정보줄 -->
									</div>
								</div>	
							</div>
							<!-- //덩어리3 -->												
						</div>
						<!--//취미 메인 정보 내용-->
						<div class="col-md-1">
						</div>
					</div>
				</div>
				 <!-- // 취미 메인 정보 박스 -->
				 
				 
				 <!-- 재료 부분 -->
				 <div class="cont_box">
					<div class="row">
						<div class="col-md-1">
						</div>
						<!-- 준비물 내용-->
						<div class="col-md-10">
							<div class="cont_tit" style="margin-bottom:30px">
								준비물<span class="star">*</span>
							</div>
							<div style="margin-bottom: 10px; font-size: 14px;  font-weight: 550;">
									<span style="margin: 0 130px 0 130px;">준비물명<span class="star">*</span></span>
									<span>준비물설명</span>
								</div>
							<div id="materialBoxWrap">
								<c:forEach var="hobbyMaterialVo" items="${hobbyVo.hobbyMaterials}" varStatus="vs">
									<div class="materialBox existMaterialBox" id="materialBox_${vs.count}" style="cursor:pointer; margin: 0 0 7px 50px;">
									<input type="hidden" class="hm_no" name="hobbyMaterials[${vs.count -1}].hm_no" value="${hobbyMaterialVo.hm_no}" data-index="${vs.index}" />
									<input type="hidden" class="is_del" name="hobbyMaterials[${vs.count -1}].is_del" value="${hobbyMaterialVo.is_del}"/>
										<img src = "${contextPath}/resources/images/double-arrow.png"
											style="width:15px; height:20px; opacity:0.75;"/>
										<div class="divMaterialItem" style="display:inline-block;">
											<input type="hidden" class="seq" name="hobbyMaterials[${vs.count -1}].seq" 
												value="${hobbyMaterialVo.seq}"/>
											<input type="text" value="${hobbyMaterialVo.materialName}"
												style="width:200px; display: inline-block;" 
												class="materialName form-control" 
												name="hobbyMaterials[${vs.count - 1}].materialName"
												autocomplete="off"/>
											<input type="text" value="${hobbyMaterialVo.material_detail}"
												style="width:200px; display: inline-block;" 
												class="material_detail form-control" 
												name="hobbyMaterials[${vs.count - 1}].material_detail"
												autocomplete="off"/>
											<a  href="javascript:delMaterial(${vs.count})"
												 class="btnDelMaterial" style="display:none;"></a>
												
										</div>
									</div>
								</c:forEach>
							</div>
							<div class="row">
									<button type="button" class="btnAdd" style="width:130px; margin: 20px 0 0 230px;"
										 id="addMaterialItem" onclick="createMaterialBox();" >
										 준비물추가
									</button>
							</div>
						</div>
						<!--// 준비물 내용-->
						<div class="col-md-1">
						</div>
					</div>
				 </div>
				 <!-- //재료 부분 -->
				 <!-- 만들기 부분 -->
				<div class="cont_box">
					<div class="row">
						<div class="col-md-1">
						</div>
						<!-- 만들기 내용-->
						<div class="col-md-10">
							<!-- 첫줄 -->
							<div class="row" style="margin-bottom:50px;">
								<div class="cont_tit">
									만들기 순서<span class="star">*</span>
								</div>
								<input type="file" id="multifile_step"  
									style="display:none;" accept=".gif, .jpg, .png" multiple>
								<button type="button" onclick="document.getElementById('multifile_step').click();"
									class="btn btn-outline-light btn-sm green_background" style="margin-left:10px; font-size:9px;">
									<span class="fa fa-plus"> 순서 사진 한번에 추가</span>
								</button>
							</div>
							<!-- //첫줄 -->
							<!-- 둘째줄 -->
							<div class="row">
								<div id="stepBoxWrap">
									<c:forEach var="makeStepVo" items="${hobbyVo.makeSteps}" varStatus="vs">
										<!-- stepBox -->
											<div class="stepBox ${empty makeStepVo.make_step_img ? 'none_img' : ''} existStepBox" id="stepBox_${vs.count}"> 
											<input type="hidden" class="step_no" name="makeSteps[${vs.count -1}].step_no" value="${makeStepVo.step_no}"  data-index="${vs.index}"/>
											<input type="hidden" class="is_del" name="makeSteps[${vs.count -1}].is_del" value="${makeStepVo.is_del}"/>
											<!-- divStepItem -->
											<!-- 이미지는 눌허용 -->
											<div class="divStepItem" style="width:800px;">
												<div class="divStepNum">
													<input class="stepNum_hidden" type="hidden" name="makeSteps[${vs.count - 1}].make_step_num" value="${vs.count}"/>
													Step<span class="stepNum_span">${vs.count}</span>
												</div>
												<div class="divStepUpload" id="divStepUpload_${vs.count}">
														<c:choose>
															<c:when test="${not empty makeStepVo.make_step_img}">
																<label class="stepImg_label" for="stepImg_file_${vs.count}">
																	<img id="previewImg_step_${vs.count}" class="previewImg_step" 
																		src="/displayImage?filePath=${makeStepVo.make_step_img}" >
																</label>
																 <input type="file" class="stepImg_file" 
																	 id="stepImg_file_${vs.count}" accept=".gif, .jpg, .png" 
																	onchange="previewMakeStepImg(this, ${vs.count});"
																	style="display:none;width:0px;height:0px;font-size:0px;">
																<input type="hidden" class="stepImg_hidden" 
																	value="${makeStepVo.make_step_img}"
																	id="makeSteps[${vs.count - 1}].make_step_img" 
																	name="makeSteps[${vs.count - 1}].make_step_img"/>
																<div style="position: relative; bottom: 10.4rem; right:0.1rem">
																	<a id="btnDelStepImg_${vs.count}" 
																		href="javascript:delStepImg(${vs.count})" 
																		class="btn_del btn_delStepImg" 
																		style="float:right"></a>
																</div>
															</c:when>
															<c:otherwise>
																<label class="stepImg_label" for="stepImg_file_${vs.count}">
																	<img id="previewImg_step_${vs.count}" class="previewImg_step" src="${contextPath}/resources/images/preview_img.jpg"/>
																</label>
																 <input type="file" class="stepImg_file" 
																	 id="stepImg_file_${vs.count}" accept=".gif, .jpg, .png" 
																	onchange="previewMakeStepImg(this, ${vs.count});"
																	style="display:none;width:0px;height:0px;font-size:0px;">
																<input type="hidden" class="stepImg_hidden" 
																	id="makeSteps[${vs.count - 1}].make_step_img" 
																	name="makeSteps[${vs.count - 1}].make_step_img"/>
																<div style="position: relative; bottom: 10.4rem; right:0.1rem">
																	<a id="btnDelStepImg_${vs.count}" 
																		href="javascript:delStepImg(${vs.count})" 
																		class="btn_del btn_delStepImg" 
																		style="display:none; float:right"></a>
																</div>
															</c:otherwise>
														</c:choose>
												</div>
												<div class="divStepText">
													<textarea 
														name="makeSteps[${vs.count - 1}].make_step_text"
														class="form-control stepText" 
														placeholder="순서에 맞는 설명을 입력해 주세요" 
														style="height:160px; width:430px; resize:none;" 
														autocomplete="off">${makeStepVo.make_step_text }</textarea>
												</div>
												<div class="divStepBtn" style="display:inline-block; display:none;">
													<a class="moveUp" href="javascript:moveUp(${vs.count})"><span class="fa fa-chevron-up"></span></a>
													<a class="moveDown" href="javascript:moveDown(${vs.count})"><span class="fa fa-chevron-down"></span></a>
													<a class="addStepBox" href="javascript:addStepBox(${vs.count})"><span class="fa fa-plus"></span></a>
													<a class="delStepBox" href="javascript:delStepBox(${vs.count})"><span class="fa fa-times"></span></a>
												</div>
												<!-- 노트, 팁 부분 -->
												<div style="width:594px;border:3px solid rgba(31, 94, 67, .75); margin-left: 123px">
													<div style="padding:5px; text-align:center">
														<!-- 노트보기 -->
														<a href="javascript:showNote(${vs.count});"
														class="extraBtn showNote" style="width:90px;height:26px;">
														<img src="${contextPath}/resources/images/note.png" 
														style="width:16px;height:16px;"/> 노트</a>
														<!-- //노트보기 -->
														<!-- 팁보기 -->
														<a href="javascript:showTip(${vs.count});" 
														class="extraBtn showTip" style="width:90px;height:26px;">
														<img src="${contextPath}/resources/images/lamp.png" 
														style="width:16px;height:16px;"/> 팁</a>
														<!-- //팁보기 -->
														<!-- 링크보기 -->
														<a href="javascript:showLink(${vs.count});" 
														class="extraBtn showLink" style="width:90px;height:26px;">
														<img src="${contextPath}/resources/images/link.png" 
														style="width:16px;height:16px;"/> 참조</a>
														<!-- //링크보기 -->
														<!-- 전체보기 -->
														<a href="javascript:showAll(${vs.count});"
														class="extraBtn showAll" style="width:90px;height:26px;"> 전 체 </a>
														<!-- //전체보기 -->
														<!-- 가이드보기 -->
														<a href="javascript:openStepGuide();" class="extraBtn" 
														style="width:160px;height:26px; border:none; 
														background:#1F5E43; color:#fff; padding:6px 7px 4px;">추가기능 가이드</a>
														<!-- //가이드보기 -->
														<!-- 노트영역 -->
													<div id="divStepNote_${vs.count}" class="divStepNote" 
														style="${empty makeStepVo.note  ? 'display:none;' : ''} 
															margin:5px 5px;">
														<img src="${contextPath}/resources/images/note.png"
														style="width:24px;height:24px; vertical-align:top;"/> 
														<textarea name="makeSteps[${vs.count - 1}].note" 
															class="form-control stepNoteText" autocomplete="off"
															style="width:500px;height:50px;
															resize:none; display: inline-block;">${makeStepVo.note}</textarea>
													</div>
													<!--// 노트영역 -->
													<!-- 팁영역 -->
													<div id="divStepTip_${vs.count}" class="divStepTip" 
														style="${empty makeStepVo.tip  ? 'display:none;' : ''}
															 margin:5px 5px;">
														<img src="${contextPath}/resources/images/lamp.png"
															style="width:24px;height:24px;vertical-align:top;"> 
														<textarea name="makeSteps[${vs.count - 1}].tip" 
															class="form-control stepTipText" autocomplete="off"
															 style="width:500px;height:50px;
																 resize:none; display: inline-block;">${makeStepVo.tip}</textarea>
													</div>
													<!-- //팁영역 -->
													<!-- 링크영역 -->
													<div id="divStepLink_${vs.count}" class="divStepLink" 
														style="${empty makeStepVo.link_url  ? 'display:none;' : ''}
														margin:5px 5px;">
														<img src="${contextPath}/resources/images/link.png"
															style="width:24px;height:24px;vertical-align:top;"> 
														<input type="text" value="${makeStepVo.link_url}"
															 name="makeSteps[${vs.count - 1}].link_url"
															 placeholder="사이트 주소를 입력해주세요."
															 class="form-control stepLink_url" autocomplete="off"
															 style="width:500px;resize:none; display: inline-block;">
														<textarea 
															name="makeSteps[${vs.count - 1}].link_desc" 
															placeholder="url에 대한 설명을 입력해 주세요"
															class="form-control stepLink_desc" autocomplete="off"
															style="width:500px;height:50px;
																resize:none; display: inline-block; 
																margin-left: 28px;">${makeStepVo.link_desc}</textarea>
													</div>
													<!-- //링크영역 -->
													</div>
												</div>						
											</div>
											<!-- //divStepItem -->
										</div>
										<!-- //stepBox -->
										</c:forEach>			
									</div>								
								</div>
								<!-- //stepBoxWrap -->
								<div style="padding:0 0 20px 180px; width:820px; text-align: center; margin: 27px 0 40px 0;"> <!-- stepBox추가 버튼 -->
									<button type="button" class="btnAdd"
									 onclick="createStepBox();">순서추가</button>
								</div>
								<!-- 셋째줄 -->
							<div class="row">
								<div class="cont_tit">
									<span>완성사진</span>
								</div>
							</div>
							<!-- //셋째줄 -->
							<!-- 넷째줄 -->
							<div class="row" style="margin-top:10px; justify-content: center;">
								<c:forEach var="completeImgVo" items="${hobbyVo.completeImgs}" varStatus="vs">
									<div class="divCompleteImg" style="margin-right:20px; height: 140px;">
									<label class="complImg_label" for="complImg_file_${vs.count}" style="border: 1px solid #e1e1e1;">
										<c:choose>
											<c:when test="${not empty completeImgVo.img_name}">
												<img id="previewImg_compl_${vs.count}" class="previewImg_compl" 
													src="/displayImage?filePath=${rootPath}${completeImgVo.img_name}" style="width:140px; height:140px; object-fit: cover; cursor: pointer;">
											</c:when>
											<c:otherwise>
												<img id="previewImg_compl_${vs.count}" class="previewImg_compl" 
													src="${contextPath}/resources/images/preview_img.jpg" style="width:140px; height:140px;  cursor: pointer;">
											</c:otherwise>
										</c:choose>
									</label>
									<input type="file" class="complImg_file" 
										 id="complImg_file_${vs.count}" accept=".gif, .jpg, .png" onchange="previewComplImg(this, ${vs.count});"
										style="display:none;width:0px;height:0px;font-size:0px;">
									<c:choose>
										<c:when test="${not empty completeImgVo.img_name}">
											<input type="hidden" class="complImg_hidden" 
												value="${completeImgVo.img_name}"
												id="completeImgs[${vs.count - 1}].img_name"
												name="completeImgs[${vs.count - 1}].img_name"/>
										</c:when>
										<c:otherwise>
											<input type="hidden" class="complImg_hidden" 
												id="completeImgs[${vs.count - 1}].img_name" name="completeImgs[${vs.count - 1}].img_name"/>
										</c:otherwise>
									</c:choose>
									<input type="hidden" class="complImg_num" name="completeImgs[${vs.count - 1}].num" value="${vs.count}"/>
									<div style="position: relative;bottom: 9.3rem;">
										<a id="btnDelComplImg_${vs.count}" href="javascript:delComplImg(${vs.count})" 
											class="btn_del btn_delComplImg" style="float:right; ${empty completeImgVo.img_name ? 'display:none' : ''}"></a>
									</div>
								</div>		
								</c:forEach>
							</div>
							<!--// 넷째줄 줄 -->
							</div>
							<!--// 만들기 , 완성사진 내용-->
							<div class="col-md-1">
							</div>
						</div>
					</div>
				 <!-- //만들기 부분 -->
				 <!-- 저장/완료/닫기 버튼 부분 -->
				 <div class="cont_box">
						<div style="text-align: center;">
							<button type="button" onclick="doSubmit();" class="btn btn-outline-light btn-lg green_background">완료</button>
							<button type="button" onclick="history.back();" class="btn btn-outline-light btn-lg green_background">닫기</button>
						</div>
				 </div>
				 <!-- //저장/완료/닫기 버튼 -->
			</form>		
  		</div>
  		<div class="side side-right">
  		</div>
	</div>
</div>

<!-- 스탭 추가 정보가이드 모달 -->
<div id="stepExtraGuideModal" class="modal fade in" aria-hidden="false">
    <div class="modal-dialog" style="width:1000px;">
        <div class="modal-content" style="padding:0;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><img src="https://recipe1.ezmember.co.kr/img/btn_close.gif" alt="닫기" width="18px" height="18px"></span></button>
                <h4 class="modal-title">단계별 추가 정보 입력</h4>
            </div>
            <div class="modal-body" style="padding:0;">
                <div class="guide_tit"><img src="https://recipe1.ezmember.co.kr/img/guide_tt3.gif"></div>
                <div class="modal_guide st2">
                    <img src="https://recipe1.ezmember.co.kr/img/guide5_01.jpg">
                    <img src="https://recipe1.ezmember.co.kr/img/guide5_02.jpg" border="0" usemap="#Map_tip">
                    <map name="Map_tip">
                      <area shape="rect" coords="175,581,489,604" href="http://www.10000recipe.com/recipe/6851475" target="_blank" alt="중국집 단골손님 짜장면">
                      <area shape="rect" coords="147,610,461,633" href="http://www.10000recipe.com/recipe/6851952" target="_blank" alt="대구 명물 납작만두">
                      <area shape="rect" coords="257,640,572,663" href="http://www.10000recipe.com/recipe/6852193" target="_blank" alt="든든하게 시작하는 아침식사! 참치죽">
                    </map>
                    <img src="https://recipe1.ezmember.co.kr/img/guide5_03.jpg">
                </div>
                <div class="talk_guide"><span></span>
                    <button class="btn btn-default" type="button" onClick="location.href='/customer/list.html?bid=3'">문의하기</button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
 </div>
<%@ include file="../include/footer.jsp" %>
<script>
// ----------수정폼------------












// -------------------입력폼------------------
$("#hobby_title").on("input", function(){
	var cnt = $(this).val();
	$("#titleCnt").text(cnt.length);
	$("#titleCnt").css("color", "black");
	if(cnt.length == 40){
		$("#titleCnt").css("color", "#1f5e43");
	}
});

$("#hobby_intro").on("input", function(){
	var cnt = $(this).val();
	$("#introCnt").text(cnt.length);
	$("#introCnt").css("color", "black");
	if(cnt.length == 300){
		$("#introCnt").css("color", "#1f5e43");
	}
});

//ajax (이미지들)
function previewMainImg(targetObj) {
	if (targetObj.files.length == 0){
		return false;
	}
	
	var file = targetObj.files[0];
	
	// 이미지파일체크, 파일 사이즈 체크
	var imgJ = /(.*?)\.(jpg|jpeg|png|gif)$/;
	var maxSize = 10 * 1024 * 1024;
    
	console.log(file.name);
	console.log(file.size);
    if(!file.name.match(imgJ)) {
    	Swal.fire({
			text: '이미지 파일만 업로드 가능합니다.', 
			allowOutsideClick: false,
			iconColor: "#1f5e43",
			icon: 'warning', 
			confirmButtonText: "확인",
			confirmButtonColor: "#1f5e43",
		});
        return;
    } else if(file.size > maxSize) {
    	Swal.fire({
			text: '파일 크기는 10MB까지 가능합니다.', 
			allowOutsideClick: false,
			iconColor: "#1f5e43",
			icon: 'warning', 
			confirmButtonText: "확인",
			confirmButtonColor: "#1f5e43",
		});
        return;
    }
 	// 이미지파일체크, 파일 사이즈 체크   end
 	
	var formData = new FormData();
	formData.append("file", file);
	formData.append("sort", "mainImg");
	
	var url = "/uploadImage";
	
	$.ajax({
		"processData" : false,
		"contentType" : false,
		"url" : url,
		"method" : "post",
		"data" : formData,
		"success" : function(filePath) {
			console.log("filePath:" + filePath);
			// 1. hidden에 값 넣기 
			$("#main_img").val(filePath);
			//2. 프리뷰이미지 보여주기 
			var reader = new FileReader();
			reader.readAsDataURL(file);
			reader.onload = function(e) {
				$("#previewImg_main").attr("src", e.target.result);
				console.log("$('#main_img').val()", $('#main_img').val());
				$("#btnDelMainImg").show();
			}
		},
		"error" : function() {
			alert("파일 업로드 실패!");
		},
		"beforeSend" : function() {
			$("#previewImg_main").attr("src", "${contextPath}/resources/images/loading.gif");
		},
		"complete" : function() {
			console.log("로딩끝")
		}
	});
}
	
function delMainImg() {
	console.log("삭제")
	var filePath = $("#main_img").val();
	console.log(filePath);
	$.get("/selectMainImg?hobby_no=${hobbyVo.hobby_no}", function(main_img) {
		console.log("메인사진", main_img)
		if(main_img == filePath) {
			$("#main_img").val("");
			$("#previewImg_main").attr("src", "${contextPath}/resources/images/main_img_btn.jpg");
			$("#btnDelMainImg").css("display", "none");
		} else {
			$.get("/deleteFile?filePath=" + filePath, function(rData) {
				if (rData == "success") {
					$("#main_img").val("");
					$("#previewImg_main").attr("src", "${contextPath}/resources/images/main_img_btn.jpg");
					$("#btnDelMainImg").css("display", "none");
				}
			})
		}
	});
	
}

function previewMakeStepImg(targetObj, seq) {
	var index = $("#stepBox_" + seq).find(".step_no").attr("data-index");
	var el = document.getElementById("makeSteps["+ index +"].make_step_img");
	if (targetObj.files.length == 0){
		return false;
	}
	var file = targetObj.files[0];
	
	// 이미지파일체크, 파일 사이즈 체크   
	var imgJ = /(.*?)\.(jpg|jpeg|png|gif)$/;
	var maxSize = 10 * 1024 * 1024;
    
	console.log(file.name);
	console.log(file.size);
    if(!file.name.match(imgJ)) {
    	Swal.fire({
			text: '이미지 파일만 업로드 가능합니다.', 
			allowOutsideClick: false,
			iconColor: "#1f5e43",
			icon: 'warning', 
			confirmButtonText: "확인",
			confirmButtonColor: "#1f5e43",
		});
        return;
    } else if(file.size > maxSize) {
    	Swal.fire({
			text: '파일 크기는 10MB까지 가능합니다.', 
			allowOutsideClick: false,
			iconColor: "#1f5e43",
			icon: 'warning', 
			confirmButtonText: "확인",
			confirmButtonColor: "#1f5e43",
		});
        return;
    }
 	// 이미지파일체크, 파일 사이즈 체크   end
 	
	console.log("파일존재");
	var formData = new FormData();
	formData.append("file", file);
	formData.append("sort", "stepImg");
	
	var url = "/uploadImage";
	
	$.ajax({
		"processData" : false,
		"contentType" : false,
		"url" : url,
		"method" : "post",
		"data" : formData,
		"success" : function(filePath) {
			// 1. hidden에 값 넣기 
			$(el).val(filePath);
			$("#stepBox_" + seq).removeClass("none_img");
			//2. 프리뷰이미지 보여주기 
			var reader = new FileReader();
			reader.readAsDataURL(file);
			reader.onload = function(e) {
				$("#previewImg_step_" + seq).attr("src", e.target.result);
				console.log("val", $(el).val());
				$("#btnDelStepImg_" + seq).show();
			}
			
		},
		"error" : function() {
			alert("파일 업로드 실패!");
		},
		"beforeSend" : function() {
			$("#previewImg_step_" + seq).attr("src", "${contextPath}/resources/images/loading.gif");
		}
	});
    
}

// 다중파일 업로드
var multifile_step = document.querySelector('#multifile_step');
multifile_step.onchange = function () {
	console.log("<------------시작-------------->")
	var files = multifile_step.files;
	if (files.length == 0) {
		return false;
	}
	
	// 이미지파일체크, 파일 사이즈 체크   
	var imgJ = /(.*?)\.(jpg|jpeg|png|gif)$/;
	var maxSize = 10 * 1024 * 1024;
    
	console.log(files);
	for (var v = 0; v < files.length; v++) {
		console.log("이름:", files[v].name);
		console.log("크기:", files[v].size);
	    if(!files[v].name.match(imgJ)) {
	    	Swal.fire({
				text: '이미지 파일만 업로드 가능합니다.', 
				allowOutsideClick: false,
				iconColor: "#1f5e43",
				icon: 'warning', 
				confirmButtonText: "확인",
				confirmButtonColor: "#1f5e43",
			});
	        return;
	    } else if(files[v].size > maxSize) {
	    	Swal.fire({
				text: '파일 크기는 10MB까지 가능합니다.', 
				allowOutsideClick: false,
				iconColor: "#1f5e43",
				icon: 'warning', 
				confirmButtonText: "확인",
				confirmButtonColor: "#1f5e43",
			});
	        return;
	    }
	}
 	// 이미지파일체크, 파일 사이즈 체크   end
	
	console.log("사용자가 올리려고 선택한 파일들", files);
	var emptys = $("#stepBoxWrap").find('.none_img');
	// 멀티파일개수 - 사진 안올라간거 > 0 때만 박스 생성
	console.log("파일개수", files.length);
	console.log("사진안올라가있는 스탭박스 개수", emptys.length);
	console.log("생성해야할 박스개수", files.length - emptys.length);
	if (files.length - emptys.length > 0) {
		for (var v = 1; v <= files.length - emptys.length; v++) {
			console.log("박스생성" + v)
			createStepBox();
		}
	}
	
		$(".none_img").each(function(i, box) {
			console.log("i: ", i);
			var seq = $(box).find(".stepNum_hidden").val();
			var index = $("#stepBox_" + seq).find(".step_no").attr("data-index");
			var el = document.getElementById("makeSteps["+ index +"].make_step_img");
			var formData = new FormData();
			if (typeof files[i] == "undefined") {
				return false;
			}
			formData.append("file", files[i]);
			formData.append("sort", "stepImg");
			
			var url = "/uploadImage";
			
			$.ajax({
				"processData" : false,
				"contentType" : false,
				"url" : url,
				"method" : "post",
				"data" : formData,
				"success" : function(filePath) {
					console.log(filePath);
					// 1. hidden에 값 넣기 
					$(el).val(filePath);
					$("#stepBox_" + seq).removeClass("none_img");
					//2. 프리뷰이미지 보여주기 
					var reader = new FileReader();
					reader.readAsDataURL(files[i]);
					reader.onload = function(e) {
						$("#previewImg_step_" + seq).attr("src", e.target.result);
						console.log("val", $(el).val());
						$("#btnDelStepImg_" + seq).show();
					}
				},
				"error" : function() {
					alert("파일 업로드 실패!");
				},
				"beforeSend" : function() {
					$("#previewImg_step_" + seq).attr("src", "${contextPath}/resources/images/loading.gif");
				}
			});
		});
	
}

function delStepImg(seq) {
	console.log("삭제")
	var index = $("#stepBox_" + seq).find(".step_no").attr("data-index");
	var step_no = $("#stepBox_" + seq).find(".step_no").val();
	var el = document.getElementById("makeSteps["+ index +"].make_step_img");
	var filePath = $(el).val();
	console.log(filePath);
	
	if (step_no > 0) { //db에 있는 것 -> 폼전송되기전까지 서버에서 사진 삭제하면안됨
		$(el).val("");
		$("#stepBox_" + seq).addClass("none_img");
		$("#previewImg_step_" + seq).attr("src", "${contextPath}/resources/images/preview_img.jpg");
		$("#btnDelStepImg_" + seq).hide();
	} else {
		$.get("/deleteFile?filePath=" + filePath, function(rData) {
			if (rData == "success") {
				$(el).val("");
				$("#stepBox_" + seq).addClass("none_img");
				$("#previewImg_step_" + seq).attr("src", "${contextPath}/resources/images/preview_img.jpg");
				$("#btnDelStepImg_" + seq).hide();
			}
		});
	}
	
}

function previewComplImg(targetObj, num) {
	
	var el = document.getElementById("completeImgs["+ (num - 1) +"].img_name");
	if (targetObj.files.length == 0){
		return false;
	}
	var file = targetObj.files[0];
	
	// 이미지파일체크, 파일 사이즈 체크   
	var imgJ = /(.*?)\.(jpg|jpeg|png|gif)$/;
	var maxSize = 10 * 1024 * 1024;
    
	console.log(file.name);
	console.log(file.size);
    if(!file.name.match(imgJ)) {
    	Swal.fire({
			text: '이미지 파일만 업로드 가능합니다.', 
			allowOutsideClick: false,
			iconColor: "#1f5e43",
			icon: 'warning', 
			confirmButtonText: "확인",
			confirmButtonColor: "#1f5e43",
		});
        return;
    } else if(file.size > maxSize) {
    	Swal.fire({
			text: '파일 크기는 10MB까지 가능합니다.', 
			allowOutsideClick: false,
			iconColor: "#1f5e43",
			icon: 'warning', 
			confirmButtonText: "확인",
			confirmButtonColor: "#1f5e43",
		});
        return;
    }
 	// 이미지파일체크, 파일 사이즈 체크   end
	
	console.log("파일존재");
	var formData = new FormData();
	formData.append("file", file);
	formData.append("sort", "complImg");
	
	var url = "/uploadImage";
	
	$.ajax({
		"processData" : false,
		"contentType" : false,
		"url" : url,
		"method" : "post",
		"data" : formData,
		"success" : function(filePath) {
			console.log(filePath);
			// 1. hidden에 값 넣기 
			$(el).val(filePath);
			//2. 프리뷰이미지 보여주기 
			var reader = new FileReader();
			reader.readAsDataURL(file);
			reader.onload = function(e) {
				$("#previewImg_compl_" + num).attr("src", e.target.result);
				console.log("val", $(el).val());
				$("#btnDelComplImg_" + num).show();
			}
		},
		"error" : function() {
			alert("파일 업로드 실패!");
		},
		"beforeSend" : function() {
			$("#previewImg_compl_" + num).attr("src", "${contextPath}/resources/images/loading.gif");
		}
	});
    
}

function delComplImg(num) {
	console.log("삭제")
	var el = document.getElementById("completeImgs["+ (num - 1) +"].img_name");
	var filePath = $(el).val();
	console.log(filePath);
	var completeImgVo = {
			"hobby_no" : "${hobbyVo.hobby_no}",
			"num" : num,
	}
	console.log(completeImgVo);
	$.ajax({
		"url" : "/selectCompleteImgName",
		"headers" : {
			"Content-Type" : "application/json"
		},
		"method" : "post",
		"dataType" : "text",
		"data" : JSON.stringify(completeImgVo),
		"success" : function(string) {
			console.log("완성사진 db", string);
			// 디비 저장된게 아니라면 서버에서 삭제
			if (string == "" || string == null) {
				$.get("/deleteFile?filePath=" + filePath, function(rData) {
					if (rData == "success") {
						$(el).val("");
						$("#previewImg_compl_" + num).attr("src", "${contextPath}/resources/images/preview_img.jpg");
						$("#btnDelComplImg_" + num).hide();
					}
				})
			} else {
				// 디비에 있다면
// 				서버에서 사진 삭제하지말고
// 				프리뷰이미지만 없애기
				$(el).val("");
				$("#previewImg_compl_" + num).attr("src", "${contextPath}/resources/images/preview_img.jpg");
				$("#btnDelComplImg_" + num).hide();
			} 
			
			
		}
	});
}

//* 준비물 부분
$("#materialBoxWrap").sortable({
	stop : function(event, ui) {
		reorderMaterial();
	}
});
function createMaterialBox() {
	var box = '<div class="materialBox existMaterialBox" id="materialBox_1" style="cursor:pointer; margin: 0 0 7px 50px;">'
		+	'<input type="hidden" class="hm_no" name="hobbyMaterials[0].hm_no" value="0"/>'
		+	'<input type="hidden" class="is_del" name="hobbyMaterials[0].is_del" value="N"/>'
	  +	'<img src = "${contextPath}/resources/images/double-arrow.png"'
		+	'style="width:15px; height:20px; opacity:0.75;"/>'
	  +	'<div class="divMaterialItem" style="display:inline-block;">'
		+	'<input type="hidden" class="seq" name="hobbyMaterials[0].seq" value="1"/>'
		+	'<input type="text" style="width:200px; display: inline-block; margin-left:3px; margin-right:4px;" class="materialName form-control"' 
		+		'name="hobbyMaterials[0].materialName" placeholder=""  autocomplete="off"/>'
		+	'<input type="text" style="width:200px; display: inline-block; margin-right: 4px;" class="material_detail form-control"' 
		+		'name="hobbyMaterials[0].material_detail"placeholder="" autocomplete="off"/>'
		+	'<a  href="javascript:delMaterial(1)"'
		+		 'class="btnDelMaterial" style="display:none;"></a>'
		+ '</div>'
	+ '</div>';
	console.log("클론박스", $(box));
	console.log(".hm_no", $(box).find(".hm_no").val());
	console.log(".is_del", $(box).find(".is_del").val());
	console.log(".materialName", $(box).find(".materialName").val());
	console.log(".material_detail", $(box).find(".material_detail").val());
	$(box)
	.appendTo("#materialBoxWrap")
	.hover(
		function() {
			$(this).find('.btnDelMaterial').show();
		},
		function() {
			$(this).find('.btnDelMaterial').hide();
		}		
	);
	//reorder부분
	reorderMaterial();
}
function reorderMaterial() {
	$(".materialBox").each(function(i, box) {
		$(box).find(".hm_no").attr({
				"data-index" : i,
				name : "hobbyMaterials[" + i + "].hm_no"
        });
	  	$(box).find(".is_del").attr("name", "hobbyMaterials[" + i + "].is_del");
   });
	$(".existMaterialBox").each(function(i, box) {
		$(box).attr("id", "materialBox_" + (i + 1));
		var index = $(box).find(".hm_no").attr("data-index");
        $(box).find(".seq").attr("name", "hobbyMaterials[" + index + "].seq").val(i + 1);
        $(box).find(".materialName").attr("name", "hobbyMaterials[" + index + "].materialName");
        $(box).find(".material_detail").attr("name", "hobbyMaterials[" + index + "].material_detail");
        $(box).find(".btnDelMaterial").attr("href", "javascript:delMaterial("+ (i + 1) + ")");
	});
	
}
function getMaterialLength() {
	var length = $(".materialBox").length;
	// 삭제하기전 남아있는 요소 개수 리턴
	return length;
}
function delMaterial(seq) {
	var length = getMaterialLength();
	if (length == 1) {
		Swal.fire({
			text: '준비물은 최소 1개 이상이어야 합니다.', 
			allowOutsideClick: false,
			iconColor: "#1f5e43",
			icon: 'warning', 
			confirmButtonText: "확인",
			confirmButtonColor: "#1f5e43",
		});
		return false;
	}
    $("#materialBox_" + seq).fadeOut(200,function() {
 	   	var hm_no = $(this).find(".hm_no").val();
		if (hm_no > 0) { // 원래 있던 박스이면 (db에있던거면)
			var deletedBox = 
				'<div class="materialBox" >'
					+'<input type="hidden" class="hm_no" name="hobbyMaterials['+ (seq - 1) +'].hm_no" value="'+ hm_no +'"/>'
					+'<input type="hidden" class="is_del" name="hobbyMaterials['+ (seq - 1) +'].is_del" value="Y"/>'
				+'</div>'
				$("#materialBoxWrap").append(deletedBox);
				console.log(hm_no);
		}
        $(this).remove();
    	reorderMaterial();
    });
}
	$(".materialBox").hover(
		function() {
			$(this).find('.btnDelMaterial').show();
		},
		function() {
			$(this).find('.btnDelMaterial').hide();
		}
	);
	
// 유효성 체크 메세지 사라지게 하는부분
$(".main_input").on("keydown", function() {
	console.log("change");
	$(".check_font").text("");
})

$(".main_select").on("click", function() {
	$(".check_font").text("");
})

// 폼전송
function validate() {
	
	//공백 정규식
	var empJ = /\s/g;
	
	// 1. 메인정보들 
	var hobby_title = $("#hobby_title").val();
	if (typeof hobby_title == "undefined" || hobby_title.trim() == "" || hobby_title ==  null) {
		$("#msgTitle").text("제목을 입력해주세요.");
		$("#hobby_title").focus();
		return false;
	}
	
	var hobby_intro = $("#hobby_intro").val();
	if (typeof hobby_intro == "undefined" || hobby_intro.trim() == "" || hobby_intro ==  null) {
		$("#msgIntro").text("소개를 입력해주세요.");
		$("#hobby_intro").focus();
		return false;
	} 
	
	var main_img = $("#main_img").val();
	if (typeof main_img == "undefined" || main_img.trim() == "" || main_img ==  null) {
		$('html, body').animate({ scrollTop: $("#msgMainImg").offset().top }, 500);
		$("#msgMainImg").text("대표이미지를 등록해주세요.");
		$("#mainImg_label").addClass("focus")
		setTimeout(function() { $("#mainImg_label").removeClass("focus") },2000);

		return false;
	} 
	
	
	var videoJ = /(?:https?:\/\/(?:[a-z]+.)?)(?:youtu\.?be(?:\.com)?\/)(?:embed\/)?(?:(?:(?:(?:watch\?)?(?:time_continue=(?:[0-9]+))?.+v=)?([a-zA-Z0-9_-]+))(?:\?t\=(?:[0-9a-zA-Z]+))?)/g;

	var hobby_video = $("#hobby_video").val();
	if (typeof hobby_video != "undefined" && hobby_video.trim() != "" && hobby_video !=  null) {
		if(!hobby_video.match(empJ)) {
			if(!hobby_video.match(videoJ)) {
				$("#msgVideo").text("올바른 주소가 아닙니다.");
				$("#hobby_video").focus();
				return false;
			} 
		} else {
			$("#msgVideo").text("url사이에 공백이 있어요.");
			$("#hobby_video").focus();
			return false;
		}
	} 
	
	var l_cate_no = $("#l_cate_no").val();
	var m_cate_no = $("#m_cate_no").val();
	if (l_cate_no.trim() == "") {
		$("#msgCate").text("대분류를 선택해주세요.");
		$("#l_cate_no").focus();
		return false;
	} 
	
	if (m_cate_no.trim() == "") {
		$("#msgCate").text("중분류를 선택해주세요.");
		$("#m_cate_no").focus();
		return false;
	} 
	
	var time_no = $("#time_no").val();
	var level_no = $("#level_no").val();
	var cost_no = $("#cost_no").val();
	if (time_no.trim() == "") {
		$("#msgHobbyInfo").text("시간을 선택해주세요.");
		$("#time_no").focus();
		return false;
	} 
	
	if (level_no.trim() == "") {
		$("#level_no").text("난이도를 선택해주세요.");
		$("#level_no").focus();
		return false;
	} 
	
	if (cost_no.trim() == "") {
		$("#msgHobbyInfo").text("비용을 선택해주세요.");
		$("#cost_no").focus();
		return false;
	} 

	// 2. 준비물 
	for (var v = 0; v < $(".existMaterialBox").length; v++) {
		var materialName = $("#materialBox_" + (v + 1)).find(".materialName").val();
		if (typeof materialName == "undefined" ||
				materialName.trim() == "" ||
				materialName ==  null) {
			// swal 시작
			Swal.fire({
				text: '준비물명을 입력해주세요.', 
				allowOutsideClick: false,
				iconColor: "#1f5e43",
				icon: 'warning', 
				confirmButtonText: "확인",
				confirmButtonColor: "#1f5e43",
				didClose: function() {
					$("#materialBox_" + (v + 1)).find(".materialName").focus();
				},
			});
			// swal 끝
			return false;
		} 
	}
	
	//3. 만들기 부분
	for (var v = 0; v < $(".existStepBox").length; v++) {
		// 3-1. 스탭내용
		var step_text = $("#stepBox_" + (v + 1)).find(".stepText").val();
		if (typeof step_text == "undefined" || step_text.trim() == "" || step_text ==  null) {
			// swal 시작
			console.log("만들기내용")
			Swal.fire({
				text: '만들기 내용을 입력해주세요.', 
				allowOutsideClick: false,
				iconColor: "#1f5e43",
				icon: 'warning', 
				confirmButtonText: "확인",
				confirmButtonColor: "#1f5e43",
				didClose: function() {
					$("#stepBox_" + (v + 1)).find(".stepText").focus();
				},
			});
			// swal 끝
			return false;
		} 
		
		// 3-2. 링크 주소 형식 검사
		var link_url = $("#stepBox_" + (v + 1)).find(".stepLink_url").val();
		
		var stepUrlJ = /(http(s)?:\/\/)([a-z0-9\w]+\.*)+[a-z0-9]{2,4}/g; //기본 url패턴인지 검사
		var httpJ = /^(https?:\/\/)(.*)/g;
// 		console.log(link_url);
		if (typeof link_url != "undefined" && link_url.trim() != "" && link_url !=  null) {
			if(!link_url.match(empJ)) {
				if(!link_url.match(stepUrlJ)) {
					if (!link_url.match(httpJ)) {
						// swal 시작
						Swal.fire({
							text: 'http:// 또는 https:// 로 시작하게 적어주세요.', 
							allowOutsideClick: false,
							iconColor: "#1f5e43",
							icon: 'warning', 
							confirmButtonText: "확인",
							confirmButtonColor: "#1f5e43",
							didClose: function() {
								$("#stepBox_" + (v + 1)).find(".stepLink_url").focus();
							},
						});
						// swal 끝
					} else {
						Swal.fire({
							text: '올바른 url형식이 아닙니다.', 
							allowOutsideClick: false,
							iconColor: "#1f5e43",
							icon: 'warning', 
							confirmButtonText: "확인",
							confirmButtonColor: "#1f5e43",
							didClose: function() {
								$("#stepBox_" + (v + 1)).find(".stepLink_url").focus();
							},
						});
					}
					
					
					return false;
				} 
			} else {
				// swal 시작
				Swal.fire({
					text: 'url에 공백입력못해요!', 
					allowOutsideClick: false,
					iconColor: "#1f5e43",
					icon: 'warning', 
					confirmButtonText: "확인",
					confirmButtonColor: "#1f5e43",
					didClose: function() {
						$("#stepBox_" + (v + 1)).find(".stepLink_url").focus();
					},
				});
				// swal 끝
				return false;
			}
		} 
	}// 만들기 for문 끝
	
	//3-3. 스탭박스 최소 3개
	var length = getMakeSteplength();
	if (length < 3) {
		Swal.fire({
			text: '만들기 순서는 최소 3개 이상이어야 합니다.', 
			allowOutsideClick: false,
			iconColor: "#1f5e43",
			icon: 'warning', 
			confirmButtonText: "확인",
			confirmButtonColor: "#1f5e43",
		});
		return false;
	}
	
	return true;
	
}
// validate끝

function doSubmit() {
	valResult = validate();
	console.log(valResult);
    if (!valResult) {
        return false;
    } 
    console.log("확인");
    
 	//수정하시겠습니까?
	Swal.fire({
		text: '수정하시겠습니까?', 
		allowOutsideClick: false,
		iconColor: "#1f5e43",
		icon: 'question', 
		confirmButtonText: "확인",
		confirmButtonColor: "#1f5e43",
		cancelButtonText: "취소",
		showCancelButton: true,
	}).then(function(result) {
		if(result.isConfirmed) {
			 $("#modFrm").submit();
		} else {
			return false;
		}
	});
    
}
</script>
</body>
</html>