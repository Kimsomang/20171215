<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fivefingers.outfrog.model.dto.Work" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out-frog : 우물 밖 개구리</title>
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<link type="text/css" rel="stylesheet" href="resources/css/view.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="resources/js/bootstrap/bootstrap.bundle.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#workcl").addClass('listcolor');
});

</script>
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
	height: 60px;
	padding: 5px 0;
}

.center {
	text-align: center;
}

.lb_title {
	font-weight: bold; 
	text-align: left;
	width: 100%;
	margin-top: 20px;
}

.scroll {
	width: 80%;
	height: 250px;
	white-space: nowrap;
	overflow-x: scroll;
	overflow-y: hidden;
	position: static;
	display: flex;
	margin-left: 10%;
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
	}
</style>
</head>
<body>
<div class="header">
		<jsp:include page="/WEB-INF/views/header.jsp" flush = "false"/>
	</div>
<div style="float: left; width: 20%; height:100%; background-color: #3E3F3A;">
<div id="side" style="width:100%; height:100%;">
   <c:if test="${sessionScope.userGrade eq 'G'}">
      <jsp:include page="/WEB-INF/views/member/userSideBar.jsp"/>
   </c:if>
</div>
</div>
<div style="float: left; width: 80%; height: 550px; overflow: auto;">
	<label class="btn-primary btn-lg btn-block lb_title" style="margin-left: 0px;">내 작 품 목 록</label>
<%
	ArrayList<Work> list = (ArrayList<Work>)request.getAttribute("myWorkList");
%>
	<div>
		<div class="scroll">
		<% if(list != null) {
			for(int i=0;i<list.size();i++) {
		%>
			<div class="work center" style="flex-flow: row;">
				<a href="workView.do?workNum=<%=list.get(i).getWorkNum()%>&contestNum=<%=list.get(i).getContestNum()%>">
					<img class="img_work" alt="작품 대표사진" src="${pageContext.request.contextPath}/resources/upload/<%=list.get(i).getWorkPicture()%>">	
				</a>
				<div class="title" onclick="location.href='workView.do?workNum=<%=list.get(i).getWorkNum()%>&contestNum=<%=list.get(i).getContestNum()%>'">
					<h5 class="imgTitle"><%= list.get(i).getWorkTitle() %></h5>
					<p class="imgContent">up : <%=list.get(i).getVoteCount() %>&emsp;|&emsp; report : <%=list.get(i).getReportCount() %></p>
				</div>
			</div>
		<%} }%>
		</div>
	</div>
</div>
</body>
</html>