<%@ page import="com.fivefingers.outfrog.model.dto.Request"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의뢰 리스트</title>
<link type="text/css" rel="stylesheet" href="resources/css/view.css">
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
<%
ArrayList<Request> list = (ArrayList<Request>)request.getAttribute("allRequest");
String requestNum = (String)request.getAttribute("requestNum");
%>
<label class="btn-primary btn-lg btn-block lb_title">의뢰받은 요청</label>
<div class="contestTable table table-striped table-hover table-bordered tmp_table clear spacing_left" style="width: 850px; margin-top: 30px;">
	<table style="line-height: 10px;">
		<thead class="thead-dark center">
			<tr class="center">
				<th style="width: 100px;">번호</th>
				<th style="width: 350px;">제목</th>
				<th style="width: 250px;">주최</th>
				<th style="width: 150px;">분야</th>
			</tr>
		</thead>
		<tbody>
			<% if(list != null) {
					for(int i=0;i<list.size();i++) {
				%>
			<tr>
				<th class="center"><%= list.get(i).getRequestNum() %></th>
				<th>
					<a style="text-decoration: none; color:black;" href="requestView.do?requestNum=<%=list.get(i).getRequestNum()%>"> <%= list.get(i).getContestTitle() %></a>
				</th>
				<th class="center"><%= list.get(i).getContestSponsor() %></th>
				<th class="center"><%= list.get(i).getContestField() %></th>
			</tr>
			<%} }%>
		</tbody>
	</table>
</div>
</div>
</body>
</html>