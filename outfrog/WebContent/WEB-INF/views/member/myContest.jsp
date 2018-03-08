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
<style type="text/css">
.work {
	position: relative;
	z-index: 1;
	width: 200px;
	height: 200px;
	margin: 10px 10px auto;
}

.title {
	position: absolute;
	bottom: 0px;
	left: 0px;
	color: #FFF;
	background: rgba(0, 0, 0, 0.5);
	z-index: 2;
	width: 200px;
	height: 80px;
	padding: 5px 0;
}

.center {
	text-align: center;
}

.imgTitle {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	width: 150px;
	margin: 0 25px auto;
}

.imgContent {
	margin: 5px auto;
	font-size: 10px;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function contestView(contestNum) {
	var input = document.createElement("input");
	input.setAttribute("type", "hidden");
	input.setAttribute("name", "contestNum");
	input.setAttribute("value", contestNum);
	document.contestForm.appendChild(input);
	document.contestForm.action = "workListView.do";
	document.contestForm.submit();
}
</script>
</head>
<body>
<div class="header">
	<jsp:include page="/WEB-INF/views/header.jsp" flush = "false"/>
</div>
<div style="float:left;">
	<jsp:include page="/WEB-INF/views/member/semiAdminSideBar.jsp"/>
</div>
<div style="align: center; margin-left: 80px; overflow: auto; width:900px; height: 450px; float: left;">
	<form name="contestForm" method="post">
		<c:set var="idx" value="0" />
		<c:forEach var="idx" items="${list}">
		<div class="work center" style="float:left;">
			<img style="width:200px ;height:200px" src="resources/upload/${idx.contestFile}" onclick="contestView(${idx.contestNum})">
			<div class="title" onclick="contestView(${idx.contestNum})">
				<h5 class="imgTitle">${idx.contestTitle}</h5>
				<c:set var="i" value="0" />
				<p class="imgContent">작품수 : <c:forEach var="i" items="${countList}"><c:if test="${idx.contestNum eq i.contestNums}">${i.workCount}</c:if></c:forEach>
				&emsp;|&emsp; 즐겨찾기수 : ${idx.bookmarkCount}</p>
				<p class="imgContent">마감일&emsp;:&emsp;${idx.dueDate}</p>
			</div>
		</div>
		</c:forEach>
	</form>
</div>
<div>
	<jsp:include page="/WEB-INF/views/footer.jsp" flush = "false"/>
</div>
</body>
</html>