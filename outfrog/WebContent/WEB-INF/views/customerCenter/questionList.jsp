<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out-frog : 우물 밖 개구리</title>
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<style type="text/css">
.left {
	float: left;
}

.clear {
	clear: both;
}

.center {
	margin: 0 auto;
	text-align: center;
}

.spacing {
	margin: 10px;
}

.spacing_left {
	margin-left: 30px;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
<%
		String message = (String)request.getAttribute("message");
		if(message!=null){
%>
			alert('<%=message%>');	
<%	
		}
%>
	}
</script>

</head>
<body>
<div class="header">
		<jsp:include page="/WEB-INF/views/header.jsp" flush = "false"/>
	</div>
<h2>1:1 질문 목록</h2>
<hr>
<div style="background-color: #EAF1FB; width:100%; padding: 10px auto; position: relative;">
	<div style="width: 850px; background-color: white; position: absolute; top:0; left:0; bottom:0; right:0; margin: auto;">
		<form name="questionManageForm" method="post">
			<div class="contestTable table table-striped table-hover table-bordered tmp_table clear">
				<table>
					<thead class="thead-dark center">
						<tr class="center">
							<th style="width: 100px;">번호</th>
							<th style="width: 350px;">제목</th>
							<th style="width: 150px;">작성자</th>
							<th style="width: 150px;">작성일</th>
							<th style="width: 100px;">답변상태</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${userGrade ne 'A'}">
					<c:set var="idx" value="0" />
					<c:forEach var="idx" items="${questionList}">
						<tr>
							<th class="center">${idx.questionNum}</th>
							<th>
								<a href="questionView.do?questionNum=${idx.questionNum}">${idx.questionTitle}</a>
							</th>
							<th>${idx.userNickname}</th>
							<th class="center">${idx.writeDate}</th>
							<th class="center">${idx.commentState}</th>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${userGrade eq 'A'}">
					<c:set var="idx" value="0" />
					<c:forEach var="idx" items="${questionManageList}">
						<tr>
							<th class="center">${idx.questionNum}</th>
							<th>
								<a href="questionView.do?questionNum=${idx.questionNum}">${idx.questionTitle}</a>
							</th>
							<th>${idx.userNickname}</th>
							<th class="center">${idx.writeDate}</th>
							<th class="center">${idx.commentState}</th>
						</tr>
					</c:forEach>
					</c:if>
					</tbody>
				</table>
			</div>
			<c:if test="${userGrade ne 'A'}">
			<div style="text-align: right;">
				<input class="btn btn-primary" type="button" value="문의하기" onclick="location.href='questionFormView.do'">
			</div>
			</c:if>
		</form>
	</div>
</div>	
</body>
</html>