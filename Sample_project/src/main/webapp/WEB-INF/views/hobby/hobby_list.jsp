<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.12/jquery-ui.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${contextPath}/resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/sweetalert2.min.css">
<!-- 태그 -->
<script src="${contextPath}/resources/js/tag-it.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/flick/jquery-ui.css">

<script>
$(document).ready(function() {
	$("#mySingleFieldTags").tagit({
		singleField: true,
        singleFieldNode: $('#mySingleFieldTags'),
        singleFieldDelimiter: ',',
        allowSpaces: true
	});
});
</script>

<title>글목록</title>
</head>
<body >
<c:if test="${msgDelte == 'success'}">
		<script>
		Swal.fire({
			icon : "success",
			title : "삭제 성공",
		}).then(function(){close()});
		</script>
</c:if>
<c:if test="${msgDelte == 'fail'}">
		<script>
		Swal.fire({
			icon : "error",
			title : "삭제 실패",
		}).then(function(){close()});
		</script>
</c:if>
<c:if test="${msgInsert == 'success'}">
		<script>
		Swal.fire({
			icon : "success",
			title : "등록 성공",
		}).then(function(){close()});
		</script>
</c:if>
<c:if test="${msgInsert == 'fail'}">
		<script>
		Swal.fire({
			icon : "error",
			title : "등록 실패",
		}).then(function(){close()});
		</script>
</c:if>
<style>
ul.tagit {
    width : 620px;
    vertical-align : middle;

}
ul.tagit input[type="text"] {
    width: 100%;
    height: 30px;
}


ul.tagit li {
    display: block;
    float: left;
    margin: 2px 5px 2px 0;
}
ul.tagit li.tagit-choice {    
    position: relative;
    line-height: inherit;
}
input.tagit-hidden-field {
    display: none;
}
ul.tagit li.tagit-choice-read-only { 
    padding: .2em .5em .2em .5em; 
} 

ul.tagit li.tagit-choice-editable { 
    padding: .2em 18px .2em .5em; 
} 

ul.tagit li.tagit-new {
    padding: .25em 4px .25em 0;
}

ul.tagit li.tagit-choice a.tagit-label {
    cursor: pointer;
    text-decoration: none;
}
ul.tagit li.tagit-choice .tagit-close {
    cursor: pointer;
    position: absolute;
    right: .1em;
    top: 50%;
    margin-top: -8px;
    line-height: 17px;
}

/* used for some custom themes that don't need image icons */
ul.tagit li.tagit-choice .tagit-close .text-icon {
/*     display: none; */
}

ul.tagit li.tagit-choice input {
    display: block;
    float: left;
    margin: 2px 5px 2px 0;
}
ul.tagit input[type="text"] {
    -moz-box-sizing:    border-box;
    -webkit-box-sizing: border-box;
    box-sizing:         border-box;

    -moz-box-shadow: none;
    -webkit-box-shadow: none;
    box-shadow: none;

    border: none;
    margin: 0;
    padding: 0;
    width: inherit;
    background-color: inherit;
    outline: none;
}

.write_tag {padding-bottom:25px; clear:both;}
.tagit {margin:17px 17px 8px 17px!important; padding:5px 8px!important; border-radius:0!important;}
.tagit li.tagit-new {padding:0 4px 0 0!important;}

.ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default {
    color: #078b11!important;
}
.ui-state-default .ui-icon {
    background-image: url(images/ui-icons_ef8c08_256x240.png);
}

ul.tagit {
    width: 620px;
    vertical-align: middle;
}
ul.tagit {
    padding: 1px 5px;
    overflow: hidden;
    margin-left: inherit;
    margin-right: inherit;
}
.cont_box ul, .cont_box li {
    list-style: none;
    margin: 0;
    padding: 0;
}
.cont_box ul {
    display: inline-block;
}
</style>
글 목록 화면 
<input type="hidden" name="boa_tx_tag" value="" id="mySingleFieldTags" style="width:100%">
   		 <span style="display:block; color:#666; margin-bottom:-8px;margin-left:140px">
   		 주재료, 목적, 효능, 대상 등을 태그로 남겨주세요.
   		 <em style="font-style:normal; color:#999; padding-left:8px;">예) 돼지고기, 다이어트, 비만, 칼슘, 감기예방, 이유식, 초간단</em>
   		 </span>

</body>
</html>