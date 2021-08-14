<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="manager_include/manager_header.jsp" %>
<script>
$(document).ready(function() {
	//* 카테고리 부분
	var jsonData = JSON.parse('${gradeList}');
	var gradeArr = new Array();
	var gradeObj = new Object();
	// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
		 gradeObj = new Object();  //초기화
		 gradeArr.push(gradeObj);
	}
	var ctx = document.getElementById("myPieChart2");
	var myPieChart = new Chart(ctx, {
	  type: 'doughnut',
	  data: {
	    labels: ["금손", "은손", "곰손", "맨손"],
	    datasets: [{
	      data: [jsonData[0], jsonData[1], jsonData[2], jsonData[3]],
	      backgroundColor: ['#f6c23e', '#858796', '#1cc88a', '#36b9cc'],
	      hoverBackgroundColor: ['#987B3B', '#5E6068', '#3A7C5F', '#3B7C82'],
	      hoverBorderColor: "rgba(234, 236, 244, 1)",
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      caretPadding: 10,
	    },
	    legend: {
	      display: false
	    },
	    cutoutPercentage: 80,
	  },
	});
	var jsonData = JSON.parse('${loginList}');
	var gradeArr = new Array();
	var gradeObj = new Object();
	// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
		 gradeObj = new Object();  //초기화
		 gradeArr.push(gradeObj);
	}
	
	var ctx = document.getElementById("myAreaChart2");
	var myLineChart = new Chart(ctx, {
	  type: 'line',
	  data: {
	    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
	    datasets: [{
	      label: "접속 회원 현황",
	      lineTension: 0.3,
	      backgroundColor: "rgba(32, 94, 67, 0.05)",
	      borderColor: "rgba(32, 94, 67, 1)",
	      pointRadius: 3,
	      pointBackgroundColor: "rgba(32, 94, 67, 1)",
	      pointBorderColor: "rgba(32, 94, 67, 1)",
	      pointHoverRadius: 3,
	      pointHoverBackgroundColor: "rgba(32, 94, 67, 1)",
	      pointHoverBorderColor: "rgba(32, 94, 67, 1)",
	      pointHitRadius: 10,
	      pointBorderWidth: 2,
	      data: [jsonData[0], jsonData[1], jsonData[2], jsonData[3], jsonData[4], jsonData[5]
	      , jsonData[6], jsonData[7], jsonData[8], jsonData[9], jsonData[10], jsonData[11]],
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    layout: {
	      padding: {
	        left: 10,
	        right: 25,
	        top: 25,
	        bottom: 0
	      }
	    },
	    scales: {
	      xAxes: [{
	        time: {
	          unit: 'date'
	        },
	        gridLines: {
	          display: false,
	          drawBorder: false
	        },
	        ticks: {
	          maxTicksLimit: 12
	        }
	      }],
	      yAxes: [{
	        ticks: {
	          maxTicksLimit: 5,
	          padding: 10,
	          // Include a dollar sign in the ticks
	          callback: function(value, index, values) {
	            return number_format(value) + '명';
	          }
	        },
	        gridLines: {
	          color: "rgb(234, 236, 244)",
	          zeroLineColor: "rgb(234, 236, 244)",
	          drawBorder: false,
	          borderDash: [2],
	          zeroLineBorderDash: [2]
	        }
	      }],
	    },
	    legend: {
	      display: false
	    },
	    tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      titleMarginBottom: 10,
	      titleFontColor: '#6e707e',
	      titleFontSize: 14,
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      intersect: false,
	      mode: 'index',
	      caretPadding: 10,
	      callbacks: {
	        label: function(tooltipItem, chart) {
	          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
	          return datasetLabel + number_format(tooltipItem.yLabel) + '명';
	        }
	      }
	    }
	  }
	});

	$(".a_id").click(function(e) {
		// 페이지 이동을 막아놓음
		e.preventDefault();
		
		var user_id = $(this).attr("data-id");
		var pCheck = $("#frmPaging").attr("action");
		$("#frmPaging > input[name=pCheck]").val(pCheck);
		$("#frmPaging > input[name=user_id]").val(user_id);
		$("#frmPaging").attr("action", "/manager/managerMemberContent");
		$("#frmPaging").submit();
	});
	
});
</script>
<form id="frmPaging" action="/manager/managerHome" method="get">
<input type="hidden" name="page" value="${pagingDto.page}"/>
<input type="hidden" name="perPage" value="${pagingDto.perPage}"/>
<input type="hidden" name="endRow" value="${pagingDto.endRow}"/>
<input type="hidden" name="searchType" value="${pagingDto.searchType}"/>
<input type="hidden" name="keyword" value="${pagingDto.keyword}"/>
<input type="hidden" name="user_id" value="${pagingDto.user_id}"/>
<input type="hidden" name="pCheck" value="${pagingDto.pCheck}"/>
</form>
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 green_color">꼼지락 관리 현황</h1>
        
    </div>

    <!-- Content Row -->
    <div class="row">

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body" onclick="location.href='/manager/managerMemberList';" style="cursor: pointer;">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">총 회원</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">${memberCount}명</div>
                        </div>
                        <div class="col-auto">
                        <i class="fas fa-2x text-gray-300">
                        	<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
							  <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
							  <path fill-rule="evenodd" d="M5.216 14A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216z"/>
							  <path d="M4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/>
						</i>
							</svg>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body" onclick="location.href='/ask/managerAsk?qCheck=1';" style="cursor: pointer;">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">답변 필요 문의</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">${askCount}개</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-2x text-gray-300">
                            <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-chat-left-text-fill" viewBox="0 0 16 16">
							  <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H4.414a1 1 0 0 0-.707.293L.854 15.146A.5.5 0 0 1 0 14.793V2zm3.5 1a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9zm0 2.5a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9zm0 2.5a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5z"/>
							</svg>
							</i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pending Requests Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body" onclick="location.href='/event/managerMainEvent?qCheck=1';" style="cursor: pointer;">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">진행중인 배너</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">${eventCount}개</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-2x text-gray-300">
                            <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-images" viewBox="0 0 16 16">
							  <path d="M4.502 9a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
							  <path d="M14.002 13a2 2 0 0 1-2 2h-10a2 2 0 0 1-2-2V5A2 2 0 0 1 2 3a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v8a2 2 0 0 1-1.998 2zM14 2H4a1 1 0 0 0-1 1h9.002a2 2 0 0 1 2 2v7A1 1 0 0 0 15 11V3a1 1 0 0 0-1-1zM2.002 4a1 1 0 0 0-1 1v8l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71a.5.5 0 0 1 .577-.094l1.777 1.947V5a1 1 0 0 0-1-1h-10z"/>
							</svg>
                            </i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body" onclick="location.href='/event/managerEvent?qCheck=1';" style="cursor: pointer;">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">진행중인 이벤트
                            </div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">${eventListCount}개</div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    
                                </div>
                                
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        
    </div>

    <!-- Content Row -->

    <div class="row">

        <!-- Area Chart -->
        <div class="col-xl-8 col-lg-7">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div
                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold green_color">회원 접속 현황</h6>
                    <div class="dropdown no-arrow">
                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                            aria-labelledby="dropdownMenuLink">
                            <div class="dropdown-header">Dropdown Header:</div>
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div class="chart-area">
                        <canvas id="myAreaChart2"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pie Chart -->
        <div class="col-xl-4 col-lg-5">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div
                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold green_color">회원 등급 비율</h6>
                    <div class="dropdown no-arrow">
                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                            aria-labelledby="dropdownMenuLink">
                            <div class="dropdown-header">Dropdown Header:</div>
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div class="chart-pie pt-4 pb-2">
                        <canvas id="myPieChart2"></canvas>
                    </div>
                    <div class="mt-4 text-center small">
                        <span class="mr-2">
                            <i class="fas fa-circle text-warning"></i> 금손
                        </span>
                        <span class="mr-2">
                            <i class="fas fa-circle text-secondary"></i> 은손
                        </span>
                        <span class="mr-2">
                            <i class="fas fa-circle text-success"></i> 곰손
                        </span>
                        <span class="mr-2">
                            <i class="fas fa-circle text-info"></i> 맨손
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Content Row -->
    <div class="row">

        <!-- Content Column -->
        <div class="col-lg-6 mb-4">

            <!-- Project Card Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold green_color">회원 순위</h6>
                </div>
                <div class="card-body">
                   
                   <table class="table">
					  <thead>
					    <tr>
					      <th scope="col">순위</th>
					      <th scope="col">아이디</th>
					      <th scope="col">닉네임</th>
					      <th scope="col">등급</th>
					      <th scope="col">팔로워 수</th>
					    </tr>
					  </thead>
					  <tbody>
					  <c:forEach var="member" items="${popularMemberList}">
					    <tr>
					      <td>${member.rnum}</td>
					      <td><a class="a_id" data-id="${member.user_id}" href="#">${member.user_id}</a></td>
					      <td>${member.user_nick}</td>
					      <td>${member.name}</td>
					      <td>${member.follower_cnt}</td>
					    </tr>
					    </c:forEach>
					  </tbody>
					</table>
					
                </div>
            </div>

            

        </div>

        <div class="col-lg-6 mb-4">

            <!-- Illustrations -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold green_color">인기글 순위</h6>
                </div>
                <div class="card-body">
                
                 <table class="table">
					  <thead>
					    <tr>
					      <th scope="col">순위</th>
					      <th scope="col" style="width: 40%;">글 제목</th>
					      <th scope="col">작성자</th>
					      <th scope="col">조회수</th>
					      <th scope="col">좋아요</th>
					    </tr>
					  </thead>
					  <tbody>
					  <c:forEach var="hobby" items="${popularHobby}">
					    <tr>
					      <th scope="row">${hobby.rnum}</th>
					      <td><a class="short" href="/hobby/content/${hobby.hobby_no}" target="_blank">${hobby.hobby_title}</a></td>
					      <td>${hobby.user_id}</td>
					      <td>${hobby.view_cnt}</td>
					      <td>${hobby.like_cnt}</td>
					    </tr>
					  </c:forEach>
					  </tbody>
					</table>
                    
                </div>
            </div>

           

        </div>
    </div>

</div>
<!-- /.container-fluid -->

<%@ include file="manager_include/manager_footer.jsp" %>        