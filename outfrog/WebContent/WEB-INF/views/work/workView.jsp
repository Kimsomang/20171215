<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fivefingers.outfrog.model.dto.Work" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out-frog : 우물 밖 개구리</title>
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css?ver=1">
<script type="text/javascript" src="resources/js/bootstrap/bootstrap.bundle.js"></script>
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
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
</head>
<body>
<div>
   <jsp:include page="/WEB-INF/views/header.jsp" flush = "false"/>
</div>
<%  Work work = (Work)request.getAttribute("workView");
   boolean isVote = (Boolean)request.getAttribute("isVote");
   boolean isReport = (Boolean)request.getAttribute("isReport");
   String contestNum = (String)request.getAttribute("contestNum");
   String UserId = (String)request.getAttribute("UserId");
   String UserGrade = (String)request.getAttribute("UserGrade");
   String dueDate = (String)request.getAttribute("dueDate");
   java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("YYYY년MM월dd일");
   String today = formatter.format(new java.util.Date());
%>
<script type="text/javascript">
function reportView() {
	<% if(isReport) {%>
		alert("이미 신고하신 게시물 입니다.");
	<%} else {%>
   var settings ='toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=400,width=600,left=300,top=100';
   var obj = window.open("reportWork.do?workNum=<%=work.getWorkNum()%>&workTitle=<%=work.getWorkTitle()%>","작품 신고",settings);
   <%}%>
}

function bigImage() {
	 var settings ='toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=750,width=700,left=0,top=0';
	 var obj = window.open("bigImage.do?fileName=<%=work.getWorkPicture()%>","이미지 확대", settings);
}

function conform() {
   var message = confirm("확인을 누르시면 삭제됩니다. 계속하길 원하시면 확인을 눌러주세요.");
    return message;
}
</script>

<div style="margin-left: 250px; margin-top:30px; width: 52%;">
<label class="btn-primary btn-lg btn-block lb_title" style="margin-left: 0px;">작 품 정 보</label>
   <div>
      <table border="1" style="font-size: 13px; width: 700px; line-height: 0.9;" class="table table-striped table-hover table-bordered"> 
	      <tr>
	      	 <td rowspan="5" style="width: 200px; background-size: 200px 230px; background-image: url('${pageContext.request.contextPath}/resources/upload/<%=work.getWorkPicture()%>');"></td>
	         <th style="width:100px; text-align: center;">제&emsp;&emsp;목</th>
	         <td><%=work.getWorkTitle() %></td>
	      </tr>
	      <tr>
	         <th class="center">작&nbsp;성&nbsp;자</th>
	         <td><%=work.getUserId() %></td>
	      </tr>            
	      <tr>
	         <th class="center">닉&nbsp;네&nbsp;임</th>
	         <td><%=work.getUserNickname() %></td>
	      </tr>      
	      <tr>
	         <th class="center">UP</th>
	         <td><%=work.getVoteCount() %></td>
	      </tr>      
	      <tr>
	         <th class="center">신&nbsp;고&nbsp;수</th>
	         <td><%=work.getReportCount() %></td>
	      </tr>      
      </table>
   </div>
</div>
<div>
   <div style="margin-left: 250px; margin-top:30px; width: 52%;">
      <textarea rows="10" cols="75" name="workContent" id="workContent" style="resize:none; font-size: large; border-color: #ECECEC;" readonly><%=work.getWorkContent() %></textarea>
   </div>
</div>
<div>
   <div style="margin-left: 250px; margin-top:30px; width: 52%;">
      [첨 부 파 일] <a href='fileDownload.do?fileName=<%=work.getWorkFile()%>'><%=work.getWorkFile()%></a>
   </div>
</div>
<div style="margin-top: 20px; margin-left: 30%;">
   <div>
      <form action="workListView.do">
      <input type="hidden" name="contestNum" id="contestNum" value="<%=work.getContestNum()%>">
      <input class="btn btn-primary center" type="submit" value="목&emsp;록" style="width: 120px; line-height: 16px; font-size: 12px; font-weight: 600; float:left; margin: 5px 5px auto;"></form>
   <%if(UserGrade.equals("G")) { %>
      <%if(!isVote) {%>
         <form action="insertVote.do"  method="post">
         <input type="hidden" name="contestNum" id="contestNum" value="<%=work.getContestNum()%>">
         <input type="hidden" name="workNum" id="workNum" value="<%=work.getWorkNum()%>">
         <input class="btn btn-primary" type="submit" value="UP" style="width: 120px; line-height: 16px; font-size: 12px; font-weight: 600; float:left; margin: 5px 5px auto;"></form>
    	  <input class="btn btn-primary center" type="button" value="신&emsp;고" style="width: 120px; line-height: 16px; font-size: 12px; font-weight: 600; float:left; margin: 5px 5px auto;" onclick="reportView()">
      <%} else { %>
         <form action="deleteVote.do"  method="post">
         <input type="hidden" name="contestNum" id="contestNum" value="<%=work.getContestNum()%>">
         <input type="hidden" name="workNum" id="workNum" value="<%=work.getWorkNum()%>">
         <input class="btn btn-primary" type="submit" value="UP취소" style="width: 120px; line-height: 16px; font-size: 12px; font-weight: 600; float:left; margin: 5px 5px auto;"></form>
	      <input class="btn btn-primary center" type="button" value="신&emsp;고" style="width: 120px; line-height: 16px; font-size: 12px; font-weight: 600; float:left; margin: 5px 5px auto;" onclick="reportView()">
      <%} %>
   <%}%>
      <%if(UserId.equals(work.getUserId()) || UserGrade.equals("A")) {%>
      <form name="workDeleteForm" action="deleteWork.do"  method="post">
         <input type="hidden" name="workNum" id="workNum" value="<%=work.getWorkNum()%>">
         <input type="hidden" name="workPicture" id="workPicture" value="<%=work.getWorkPicture()%>">
         <input type="hidden" name="workFile" id="workFile" value="<%=work.getWorkFile()%>">
         <input type="hidden" name="contestNum" id="contestNum" value="<%=contestNum%>">
         <input class="btn btn-primary" type="submit" onclick="return conform();" value="삭&emsp;제" style="width: 120px; line-height: 16px; font-size: 12px; font-weight: 600; float:left; margin: 5px 5px auto;">
      </form>
      <%} %>
      <%if((UserId.equals(work.getUserId()) || UserGrade.equals("A")) && today.compareTo(dueDate)<=0) {%>
      <form action="updateWorkView.do"  method="post">
         <input type="hidden" name="workNum" id="workNum" value="<%=work.getWorkNum()%>">
         <input type="hidden" name="contestNum" id="contestNum" value="<%=contestNum%>">
         <input class="btn btn-primary" type="submit" value="수&emsp;정" style="width: 120px; line-height: 16px; font-size: 12px; font-weight: 600; float:left; margin: 5px 5px auto;">
      </form>
      <%} %>
   </div>
   <br><br><br>
</div>
</body>
</html>