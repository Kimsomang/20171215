<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fivefingers.outfrog.model.dto.Contest" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out-frog : 우물 밖 개구리</title>
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<link type="text/css" rel="stylesheet" href="resources/css/view.css">
<style type="text/css">
.work {
	position: relative;
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
	width: 200px;
	height: 60px;
	padding: 5px 0;
}

.imgTitle {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	width: 150px;
	margin: 0 25px auto;
}

.scroll {
	width: 100%;
	height: 300px;
	white-space: nowrap;
	overflow-x: scroll;
	overflow-y: hidden;
	position: static;
	display: flex;
}

.imgContent {
	margin: 5px auto;
}

.center {
	text-align: center;
}

.lb_title {
	margin-top: 30px;
	width: 100%;
	height: 30px;
	color: white;
	background-color: #D33530;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
var chooseCheck = 0;

function contestView(contestNum) {
	var input = document.createElement("input");
	input.setAttribute("type", "hidden");
	input.setAttribute("name", "contestNum");
	input.setAttribute("value", contestNum);
	document.contestForm.appendChild(input);
	document.contestForm.action = "workListView.do";
	document.contestForm.submit();
}

function contestBenefit(bt_benefit, contestNum) {
	var input = document.createElement("input");
	input.setAttribute("type", "hidden");
	input.setAttribute("name", "contestNum");
	input.setAttribute("value", contestNum);
	document.contestForm.appendChild(input);
	document.contestForm.action = "chooseView.do";
	document.contestForm.submit();
}
</script>

</head>
<body>
<div>
	<jsp:include page="header.jsp" flush = "false"/>
</div>
<%
	ArrayList<Contest> list = (ArrayList<Contest>)request.getAttribute("list");
	ArrayList<Contest> contestList = (ArrayList<Contest>)request.getAttribute("contestList");
	ArrayList<Map<String,Integer>> benefitList = (ArrayList<Map<String,Integer>>)request.getAttribute("benefitList");
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("YYYY년MM월dd일");
	String today = formatter.format(new java.util.Date());
%>
<div style="margin: 0 300px;">
	<label class="btn lb_title" style="text-align: left; font-size: medium; font-weight: bolder;">내가 등록한 공모</label>
	<form name="contestForm" method="post">
	<div class="scroll">
<%
		if(contestList != null) {
			for(int i = 0; i < contestList.size(); i++) {
%>
		<div style="margin-bottom: 10px; margin-right: 5px; float: left;">
			<div class="work center" style="flex-flow: row;">
				<img class="img_contest" alt="공모" src="${pageContext.request.contextPath}/resources/upload/<%= contestList.get(i).getContestFile() %>"
				 onclick="contestView(<%= contestList.get(i).getContestNum() %>)">
				<div class="title" onclick="location.href='workListView.do?contestNum=<%= contestList.get(i).getContestNum() %>'">
					<h5 class="imgTitle"><%= contestList.get(i).getContestTitle() %></h5>
					<p class="imgContent"><%= contestList.get(i).getDueDate() %> &emsp;|&emsp; ★ : <%= contestList.get(i).getBookmarkCount() %></p>
				</div>
			</div>
			<div style="clear: both;">
<%			if(today.compareTo((String)contestList.get(i).getDueDate()) <= 0) { %>				
				<input type="button" id="bt_benefit" value="채택하러 가기" onclick="contestBenefit(this, <%= contestList.get(i).getContestNum() %>)"
				class="btn btn-primary" style="width: 200px; margin: 5px 10px auto; font-size: medium;" disabled="disabled">
<%			} else { %>
				<input type="button" id="bt_benefit" value="채택하러 가기" onclick="contestBenefit(this, <%= contestList.get(i).getContestNum() %>)"
				class="btn btn-primary" style="width: 200px; margin: 5px 10px auto; font-size: medium;">
<% 			} %>				
			</div>
		</div>
<% 
			}
		}
%>
	</div>
	</form>
</div>
<div style="margin: 0 300px;">
	<label class="btn lb_title" style="text-align: left; font-size: medium; font-weight: bolder;">채택 완료된 공모</label>
	<div class="scroll" style="height: 250px;">
<%
	if(list != null) {
		for(int i = 0; i <list.size(); i++) {
			for(int idx = 0; idx < benefitList.size(); idx++) {
				if(list.get(i).getContestNum() == benefitList.get(idx).get("contestNum")) {
%>
		<div style="margin-bottom: 10px; margin-right: 5px; float: left;">
			<div class="work center" style="flex-flow: row;">
				<img class="img_contest" alt="공모" src="${pageContext.request.contextPath}/resources/upload/<%= list.get(i).getContestFile() %>"
				 onclick="contestView(<%= list.get(i).getContestNum() %>)">
				<div class="title" onclick="location.href='workListView.do?contestNum=<%= list.get(i).getContestNum() %>'">
					<h5 class="imgTitle"><%= list.get(i).getContestTitle() %></h5>
					<p class="imgContent"><%= list.get(i).getDueDate() %> &emsp;|&emsp; ★ : <%= list.get(i).getBookmarkCount() %></p>
				</div>
			</div>
		</div>
<%				}
			}
		}
	}
%>
	</div>
</div>
</body>
</html>