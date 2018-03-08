<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fivefingers.outfrog.model.dto.Work" %>
<%@ page import="com.fivefingers.outfrog.model.dto.Contest" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out-frog : 우물 밖 개구리</title>
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css?ver=2">
<link type="text/css" rel="stylesheet" href="resources/css/view.css?ver=1">
<link type="text/css" rel="stylesheet" href="resources/css/company.css?ver=1">
<style type="text/css">
.work {
	float: left;
	margin-left: 40px;
	position: relative;
	z-index: 1;
	width: 200px;
	height: 200px;
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
	font-size: x-large; 
	font-weight: bold; 
	text-align: left; 
	margin: 10px 180px;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
</head>
<body>

<div>
	<jsp:include page="header.jsp" flush = "false"/>
</div>
<% ArrayList<Work> list = (ArrayList<Work>)request.getAttribute("workList");
	Contest contest = (Contest)request.getAttribute("contest");
	String contestNum = (String)request.getAttribute("contestNum");
	String userId = (String)request.getAttribute("userId");
	int isChoose = (int)request.getAttribute("isChoose");
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("YYYY년MM월dd일");
	String today = formatter.format(new java.util.Date());
	String dueDate = (String)request.getAttribute("dueDate");
	String searchText = (String)request.getAttribute("searchText");
	boolean isBookmark = (boolean)request.getAttribute("isBookmark");
	boolean isEnd = true;
	if(today.compareTo(dueDate)>0) {
		isEnd = false;
	}
	String benefit = contest.getContestBenefit();
	String benefits[] = benefit.split("/");
	String benefitPrint = "";
	for(int i=0;i<benefits.length;i++) {
		benefitPrint += benefits[i];
		if(i%3==0)
			benefitPrint += " : ";
		else if(i%3==1)
			benefitPrint += " - ";
		else if(i%3==2)
			benefitPrint += "\n";
	}
%>
<script type="text/javascript">
	function timeCheck() {
		<%
		String timeCheck = formatter.format(new java.util.Date());
		if(timeCheck.compareTo(dueDate)>0) {
			%>
			alert("마감일이 지났습니다.");
			return false;
		<%} else
		%> return true;
	}
	
	function searchCheck() {
		var searchText = document.getElementById("searchWork").value;
		var option = document.getElementById("selectOption").value;
		if(option=="-----선택-----") {
			alert("옵션을 선택하세요.");
			return false;
		}
		if(searchText.trim().length==0) {
			alert("검색어를 입력하세요.");
			return false;
		}
		return true;
	}

	function bigImage() {
		 var settings ='toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=750,width=700,left=0,top=0';
		 var obj = window.open("bigImage.do?fileName=<%=contest.getContestFile()%>","이미지 확대", settings);
	}
</script>
<div style="margin-left: 250px; margin-top:30px; width: 52%;">
<label class="btn-primary btn-lg btn-block lb_title" style="margin-left: 0px;">공 모 정 보</label>
	<table border="1" style="font-size: 13px; width:700px; line-height: 0.9;" class="table table-striped table-hover table-bordered img_contest"> 
		<tr>
			<td rowspan="5" style="width:200px; height: 230px; background-size: 200px 230px; background-image: url('${pageContext.request.contextPath}/resources/upload/<%=contest.getContestFile()%>');"
			onclick="bigImage()" alt="공모 사진"></td>
			<th style="width:200px;" class="center">제&emsp;&emsp;목</th>
			<td><%=contest.getContestTitle() %></td>
		</tr>
		<tr>
			<th class="center">주&emsp;&emsp;최</th>
			<td><%=contest.getContestSponsor() %></td>
		</tr>				
		<tr>
			<th class="center">분&emsp;&emsp;야</th>
			<td><%=contest.getContestField() %></td>
		</tr>		
		<tr>
			<th class="center">시상내역</th>
			<td><textarea rows="5" cols="50" style="resize:none; border: 0;" readonly><%=benefitPrint %></textarea></td>
		</tr>		
		<tr>
			<th class="center">마감시간</th>
			<td><%=contest.getDueDate() %></td>
		</tr>		
	</table>
</div>
<div style="margin-left: 250px; margin-top:30px; width: 52%;">
	<textarea rows="10" cols="75" name="contestContent" id="contestContent" style="resize:none; font-size: large; border-color: #ECECEC;" placeholder="작품 내용을 입력하세요!(500자 이내)" readonly><%=contest.getContestContents() %></textarea>
</div>
<div style="margin-left: 250px; width: 52%;">
	<form action="chooseView.do" style="float: left;">
		<input type="hidden" name="contestNum" value="<%=contestNum %>">
		<% if(!isEnd && isChoose==0 && userId.equals(contest.getUserId())) { %>
		<input class="btn btn-primary" type="submit" style="width:120px; height:30px; margin: 10px 10px auto; font-size: 13px;" value="채택하러가기">
		<%} %>
	</form>
	<div style="float: left; margin-bottom: 30px; margin-left: 60%;"> <!-- 즐겨찾기 -->
		<%if(!isBookmark) {%>
	         <form action="insertBookmark.do"  method="post">
	         <input type="hidden" name="contestNum" id="contestNum" value="<%= contestNum %>">
	         <input class="btn btn-primary" type="submit" value="즐겨찾기 추가" style="width: 120px; line-height: 16px; font-size: 12px; font-weight: 600; float:left; margin: 5px 5px auto;"></form>
		<%} else { %>
	         <form action="deleteBookmark.do"  method="post">
	         <input type="hidden" name="contestNum" id="contestNum" value="<%= contestNum %>">
	         <input class="btn btn-primary" type="submit" value="즐겨찾기 해제" style="width: 120px; line-height: 16px; font-size: 12px; font-weight: 600; float:left; margin: 5px 5px auto;"></form>
	    <%} %>
	</div>
	<form action="workMake.do" style="float: left;">
	<input type="hidden" name="dueDate" value="<%=dueDate %>">
	<input type="hidden" name="contestNum" value="<%=contestNum %>">
	<div>
		<% if(isEnd) { %>
		<input class="btn btn-primary" type="submit" style="width: 120px; line-height: 16px; font-size: 12px; font-weight: 600; float:left; margin: 5px 5px auto;" value="작품 작성" onclick="return timeCheck();">
		<%} %>
	</div>
	</form>
</div>
<div style="clear: both; margin-left: 250px; width: 52%">	
	<label for="workList" class="btn-primary btn-lg btn-block lb_title" style="margin-left: 0px; margin-top: 20px;">작 품 목 록</label>
	<div id="workList" style="border-color: #ECECEC; overflow: auto; width: 700px; height: 600px;">
		<%if(searchText != null) {%>
			<div style="text-align:center">'<%=searchText %>' 검색 결과</div>
		<%} if(!list.isEmpty()) {
			for(int i=0;i<list.size();i++) { 
				String title = list.get(i).getWorkTitle();
				if(title.length()>10) {
					title = title.substring(0, 10)+"..";
				}
		%>
		<div style="margin-top:30px; margin-left:20px" class="work center">
			<a href="workView.do?workNum=<%=list.get(i).getWorkNum()%>&contestNum=<%=list.get(i).getContestNum()%>">
				<img class="img_work" alt="작품 대표사진" src="${pageContext.request.contextPath}/resources/upload/<%=list.get(i).getWorkPicture()%>">	
			</a>
			<div class="title" onclick="location.href='workView.do?workNum=<%=list.get(i).getWorkNum()%>&contestNum=<%=list.get(i).getContestNum()%>'">
				<h5><%= title %></h5>
				<h5>up : <%=list.get(i).getVoteCount() %>&emsp;|&emsp; report : <%=list.get(i).getReportCount() %></h5>
			</div>
		</div>
		<%} }%>
	</div>
</div>
<div>
	<form style="margin-left: 28%;" action="workSearch.do" class="form-inline my-2 my-lg-0">
		<input type="hidden" name="dueDate" value="<%=dueDate %>">
		<input type="hidden" name="contestNum" value="<%=contestNum %>">
		<div class="bottom-bar">
			<select name="selectOption" id="selectOption"
				style="width: 110px; height: 30px; font-size: medium;">
				<option>-----선택-----</option>
				<option>제목</option>
				<option>내용</option>
				<option>제목+내용</option>
				<option>작성자</option>
			</select>
		</div>
		<div class="bottom-bar">
			<input style="width: 250px; height: 30px; font-size: medium;"
				type="text" name="searchWork" id="searchWork" class="form-control mr-sm-2"
				placeholder="검색할 내용을 입력하세요" required>
		</div>
		<div class="bottom-bar">
			<input style="width: 30px; height: 30px;" type="image"
				src="${pageContext.request.contextPath}/resources/image/bt_search.png" onclick="return searchCheck();">
		</div>
	</form>
	<br><br>
</div>
</body>
</html>