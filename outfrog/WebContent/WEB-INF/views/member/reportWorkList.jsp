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
<div style="float:left; width: 20%;">
     <jsp:include page="/WEB-INF/views/member/adminSideBar.jsp" />
</div>
<div class="left" style="width: 80%;">
<%
	ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("reportList");
	int contestNum[] = new int[list.size()];
	contestNum = (int[])request.getAttribute("contestNum");
%>
<label class="btn-primary btn-lg btn-block lb_title">신고 받은 작품 관리</label>
<div class="contestTable table table-striped table-hover table-bordered tmp_table clear spacing_left" style="width: 880px; margin-top: 30px;">
	<table style="line-height: 10px;">
		<thead class="thead-dark center">
			<tr>
				<th style="width:160px;">제목</th>
				<th style="width:90px;">작성자</th>
				<th style="width:340px;">신고사유</th>
				<th style="width:90px;">신고자</th>
				<th style="width:200px;">삭제/확인/정지</th>
			</tr>
		</thead>
		<tbody>
			<% for(int i=0;i<list.size();i++) { %>
			<script type="text/javascript">
			 var wX = screen.availWidth-7;
			 var wY = screen.availHeight-70;
		
			function reportView() {
				var settings ='toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height='+wY+',width='+wX+',left=0,top=0';
				var obj = window.open("workView.do?workNum=<%=list.get(i).getTypeNum()%>&contestNum=<%=contestNum[i]%>","작품 신고", settings);
			}
			</script>
			<tr>
				<th style="width:300px">
					<a href="javascript:void(0);" onclick="reportView();"><%=list.get(i).getTitle() %></a>
				</th>
				<th style="width:150px"><%=list.get(i).getWriter() %></th>
				<th style="width:150px"><%=list.get(i).getReportReason() %></th>
				<th style="width:150px"><%=list.get(i).getReporter() %></th>
				<th class="center">
					<form style="float:left" action="reportWorkDelete.do">
						<input type="hidden" name="process" value="삭제">
						<input type="hidden" name="typeNum" value="<%=list.get(i).getTypeNum()%>">
						<input type="hidden" name="replyNum" value="<%=list.get(i).getReplyNum()%>">
						<input class="btn btn-primary" style="line-height: 15px; font-size: 10px; width: 40px;" type="submit" value="삭제">
					</form>
					<form style="float:left; margin-left:10px" action="reportOK.do">
						<input type="hidden" name="process" value="확인">
						<input type="hidden" name="typeNum" value="<%=list.get(i).getTypeNum()%>">
						<input type="hidden" name="replyNum" value="<%=list.get(i).getReplyNum()%>">
						<input class="btn btn-primary left" style="line-height: 15px; font-size: 10px; width: 40px;" type="submit" value="확인">
					</form>
					<form style="float:left; margin-left:10px" action="reportWorkBan.do">
						<input type="hidden" name="process" value="정지">
						<input type="hidden" name="writer" value="<%=list.get(i).getWriter() %>">
						<input type="hidden" name="typeNum" value="<%=list.get(i).getTypeNum()%>">
						<input type="hidden" name="replyNum" value="<%=list.get(i).getReplyNum()%>">
						<input class="btn btn-primary left" style="line-height: 15px; font-size: 10px; width: 40px;" type="submit" value="정지">
					</form>
				</th>	
			</tr>
			<%} %>
		</tbody>
	</table>
</div>
</div>
</body>
</html>