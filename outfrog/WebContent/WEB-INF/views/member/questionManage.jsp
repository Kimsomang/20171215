<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out-frog : 우물 밖 개구리</title>
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
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

.spacing_left {
	margin-left: 10%;
}

.lb_title {
	font-weight: bold; 
	text-align: left; 
	width: 100%;
	margin-top: 20px;
}
</style>
</head>
<body>
<div class="header">
   <jsp:include page="/WEB-INF/views/header.jsp" flush = "false"/>
</div>
<div class="left" style="width: 20%;">
      <jsp:include page="/WEB-INF/views/member/adminSideBar.jsp" />
</div>
<div class="left" style="width: 80%;">
<label class="btn-primary btn-lg btn-block lb_title">들어온 문의</label>
	<form name="questionManageForm" method="post">
		<div class="contestTable table table-striped table-hover table-bordered tmp_table clear spacing_left" style="width: 850px; margin-top: 30px;">
			<table style="line-height: 10px;">
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
				</tbody>
			</table>
		</div>
	</form>
</div>
</body>
</html>