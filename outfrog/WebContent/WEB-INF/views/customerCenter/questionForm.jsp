<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out-frog : 우물 밖 개구리</title>
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">

<link type="text/css" rel="stylesheet"
	href="resources/css/customerCenter.css">
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function validCheck() {
		var title = document.questionForm.questionTitle;
		if(title.value.trim().length<2) {
			alert('제목은 두 글자 이상 입력해주세요!');
			title.focus();
			return false;
		}
		return true;
	}
</script>

</head>
<body>
<head>
<div class="header">
		<jsp:include page="/WEB-INF/views/header.jsp" flush = "false"/>
	</div>
<h2>1:1 질문 문의하기</h2>
<hr>
	<Form name="questionForm" method="post" action="questionForm.do">
		<div id="contents">
			<div class="tr_css">
				<div class="td_css question_title">제  목</div>
				<div class="td_css">
					<input class="tx_size" type="text" name="questionTitle" required>
				</div>
			</div>
			<div class="tr_css">
				<textarea class="ta_size" rows="20" cols="80" name="questionContent" required></textarea>
			</div>
			<div class="tr_css">
				<input class="bt_size" type="submit" value="등록" onclick="return validCheck()">
				<input class="bt_size" type="button" value="취소" onclick="location.href='questionList.do'">
			</div>
		</div>
	</Form>
</body>
</html>