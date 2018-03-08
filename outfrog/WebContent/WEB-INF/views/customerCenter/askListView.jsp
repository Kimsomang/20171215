<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out-frog : 우물 밖 개구리</title>
<link type="text/css" rel="stylesheet" href="resources/css/customerCenter.css">
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		if('<%=session.getAttribute("userGrade") %>'=='A') {
			$('textarea').attr('readonly', false);
		}
		
		if($("#category").attr("value")==$(".customerCenterMenu").attr("value")){
			$(".customerCenterMenu").css({'background-color':"#c2e7f8"});
		}
		$(".askTitle").click(function(e){
			$(this).parents(".askBox").children(".askComment").slideToggle("slow");
			e.preventDefault();
		});
		$(".customerCenterMenu").click(function(){
			$(this).css({'background-color': "#c2e7f8"});
			$(".customerCenterMenu").not(this).css({'background-color':"#0080c0"});
			var input = document.createElement("input");
			input.type = "hidden";
			input.name = "selectCategory";
			input.value = $(this).attr("value");
			document.askListViewForm.appendChild(input);
			document.askListViewForm.submit();
		});
	});

	function updateComment(askNum, askComment, originComment) {
		var form = document.askListViewForm;
		var updateComment = document.getElementById(askComment).value;
		
		if(updateComment.trim().length == 0){
			alert('답변을 입력해주시기 바랍니다!');
			document.getElementById(askComment).focus();
		}else if(updateComment == originComment) {
			location.href='askListView.do';
		}else {
			alert('수정 완료!');
	
			form.action = "oftenAskUpdate.do?askNum=" + askNum + "&askComment=" + updateComment;
			form.submit();			
		}
	}

	function deleteComment(askNum) {
		var form = document.askListViewForm;
		form.action = "oftenAskDelete.do?askNum=" + askNum;
		
		if(confirm("정말 삭제하시겠습니까?") == true) {
			form.submit();			
		}
	}
</script>
</head>
<body>
<head>
<div class="header">
		<jsp:include page="/WEB-INF/views/header.jsp" flush = "false"/>
	</div>
<div id="contents">
<form name="askListViewForm" action="askListView.do" method="post">
	<div id="menu" class="td_css">
		<input class="customerCenterMenu" type="button" id="bt_login" value="로그인 관련">
		<br>
		<input class="customerCenterMenu" type="button" name="bt_myInfo" value="내 정보 관련">
		<br>
		<input class="customerCenterMenu" type="button" name="bt_board" value="게시판 관련">
		<br>
		<input class="customerCenterMenu" type="button" name="bt_contest" value="공모 관련">
		<br>
		<input class="customerCenterMenu" type="button" name="bt_work" value="작품 관련">
		<br>
		<input class="customerCenterMenu" type="button" name="bt_request" value="의뢰 관련">
		<br>
		<input class="customerCenterMenu" type="button" name="bt_report" value="신고 관련">
		<br>
		<input class="customerCenterMenu" type="button" name="bt_other" value="기 타">
	</div>
	<div class="td_css">
		<h2>자주 묻는 질문 </h2>
		<hr>
		<c:set var="idx" value="0" />
		<c:forEach var="idx" items="${askList}">
		<c:if test="${selectCategory eq idx.askCategory}">
		<div class="askBox">
			<div class="askTitle">Q${idx.askNum}. <a id="category">[${idx.askCategory}]</a> ${idx.askTitle}</div>
			<div class="askComment">
				<textarea cols="90" rows="5" class="ta_size" id="${idx.askNum }askComment"
				style="border:none" readonly="readonly">${idx.askComment}</textarea>
			<c:if test="${userGrade eq 'A'}">
			<div>
				<input class="bt_size" type="button" value="수정"
				 onclick="updateComment(${idx.askNum}, '${idx.askNum }askComment', '${idx.askComment}')">
				<input class="bt_size" type="button" value="삭제" onclick="deleteComment(${idx.askNum})">
			</div>
			</c:if>
			</div>
		</div>
		</c:if>
		</c:forEach>
	</div>
</form>
</div>
</body>
</html>