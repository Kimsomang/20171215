<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false" %>   
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fivefingers.outfrog.model.dto.Report" %>  
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
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="header">
   <jsp:include page="/WEB-INF/views/header.jsp" flush = "false"/>
</div>
<div class="left" style="width: 20%;">
      <jsp:include page="/WEB-INF/views/member/adminSideBar.jsp" />

</div>
<div class="left" style="width: 80%;">
<label class="btn-primary btn-lg btn-block lb_title" style="margin-bottom: 20px;">신고처리 완료 관리</label>
<%
	ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("reportList");
%>
<form action="reportAfterSearchList.do">
	<div class="clear left center" style="margin-left: 25%; margin-bottom: 20px;">
		<div class="left">
			<input class="form-control mr-sm-2" style="width:400px; line-height: 15px;" type="text" name="tx_search" placeholder="ID검색">
		</div>
		<div class="left">
			<input class="btn btn-primary" style="line-height: 15px;" type="submit" name="bt_search" value="검색">
		</div>
	</div>
	<div class="contestTable table table-striped table-hover table-bordered tmp_table clear spacing_left" style="width:850px;">
		<table style="line-height: 10px;">
			<thead class="thead-dark center">
				<tr>
					<th class="center" style="width:100px;">타입</th>
					<th style="width:300px;">제목</th>
					<th style="width:150px;">작성자</th>
					<th style="width:200px;">신고사유</th>
					<th class="center" style="width:100px;">처리결과</th>
				</tr>
			</thead>
			<tbody>
				<%for(int i=0; i < list.size(); i++) {%>
					<tr>
						<th><%=list.get(i).getReportType() %></th>
						<th><%=list.get(i).getTitle() %></th>
						<th><%=list.get(i).getWriter() %></th>
						<th><%=list.get(i).getReportReason() %></th>
						<th><%=list.get(i).getProcess() %></th>
					</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</form>
</div>
</body>
</html>