<%@page import="com.fivefingers.outfrog.model.dto.Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false" %> 


<%
 String userGrade = (String)request.getAttribute("userGrade");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>out-frog : 우물 밖 개구리</title>
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<link type="text/css" rel="stylesheet" href="resources/css/customerCenter.css">
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
	window.onload = function() {
<%
		if(userGrade.equals("A")) {
%>
			document.questionViewForm.questionContent.readOnly = true;
<%
		}else {
%>
			document.questionViewForm.questionComment.readOnly = true;
<%
		}
%>
	}

	function updateContent() {
		var form = document.questionViewForm;
		var title = document.questionViewForm.questionTitle;
		var content = document.questionViewForm.questionContent;
		
		form.action = "questionUpdate.do?questionNum=${questionNum}";
		if(title.value.trim().length<2) {
			alert('제목은 두 글자 이상 입력해주세요!');	
			title.focus();
		}else if(content.value.trim().length==0) {
			alert('내용을 입력해주세요!');				
			content.focus();
		}else {
			form.submit();			
		}
	}

	function deleteContent() {
		var form = document.questionViewForm;
		form.action = "questionDelete.do?questionNum=${questionNum}";
		
		if(confirm("정말 삭제하시겠습니까?") == true) {
			form.submit();			
		}
	}
	
	function commentSubmit() {
		var form = document.questionViewForm;
		var comment = document.questionViewForm.questionComment;
		
		form.action = "commentSubmit.do?questionNum=${questionNum}";
		if(comment.value.trim().length<2) {
			alert('관리자님 답변은 두 글자 이상으로 성의껏 답해주세요!');
			comment.focus();
		}else {		
			form.submit();
		}
	}

	function updateComment() {
		var form = document.questionViewForm;
		var updateComment = document.questionViewForm.questionUpdateComment;
		
		form.action = "commentUpdate.do?questionNum=${questionNum}";
		if(updateComment.value.trim().length<2) {
			alert('관리자님 답변은 두 글자 이상으로 성의껏 답해주세요!');
			updateComment.focus();
		}else {		
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
<Form name="questionViewForm" method="post">
<div id="contents">
	<div class="tr_css">
		<div class="td_css font_title">제목 : 
			<input style="font-size: medium; width: 340px; height: 20px;" type="text" name="questionTitle" value="${questionTitle }"
			<c:if test="${userGrade eq 'A'}">readonly</c:if> placeholder="제목 입력" required="required">
		</div>
		<div class="td_css font_title">상태 : ${commentState }</div>
	</div>
	<div class="tr_css">
		<div class="td_css font_title">작성자 : ${userNickname }</div>
		<div class="td_css font_title">작성일 : ${writeDate }</div>
	</div>
	<div class="tr_css">
		<textarea class="ta_size" rows="10" cols="80" name="questionContent" placeholder="내용 입력">${questionContent }</textarea>
	</div>
	<c:if test="${userGrade ne 'A'}">
	<div class="tr_css">
		<input class="bt_size" type="button" value="수정" onclick="updateContent()">
		<input class="bt_size" type="button" value="삭제" onclick="deleteContent()">
		<input class="bt_longSize" type="button" value="목록으로" name="bt_list" onclick="location.href='questionList.do'">
	</div>
	</c:if>
	<c:if test="${commentState eq '답변대기' && userGrade eq 'A'}">
		<div class="tr_css">
			<div class="td_css">
				<textarea class="ta_size" rows="5" cols="80" name="questionComment" 
				placeholder="답변 내용" required="required"></textarea>
			</div>
			<div class="td_css">
				<input class="bt_bigSize" type="button" value="등록" onclick="commentSubmit()">
				<input class="bt_bigSize" type="reset" value="취소">
				<input class="bt_bigSize" type="button" value="목록으로" onclick="location.href='questionListView.do'">
			</div>
		</div>
	</c:if>
	<c:if test="${commentState eq '답변완료'}">
		<div class="tr_css">
			<div class="td_css font_title">관리자</div>
			<div class="td_css">
				<textarea class="ta_size" rows="5" cols="80" name="questionUpdateComment" 
				placeholder="답변 내용" required="required">${questionComment }</textarea>
			</div>
			<c:if test="${userGrade eq 'A'}">
				<div class="td_css">
					<input class="bt_bigSize" type="button" value="수정" onclick="updateComment()">
					<input class="bt_bigSize" type="button" value="목록으로" onclick="location.href='questionListView.do'">
				</div>
			</c:if>
		</div>
	</c:if>
</div>
</Form>
</body>
</html>