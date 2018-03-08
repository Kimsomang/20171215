<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fivefingers.outfrog.model.dto.Work" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채택하기</title>
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
	bottom: -18%;
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
</style>
</head>
<%
	ArrayList<Work> list = (ArrayList<Work>)request.getAttribute("workList");
	int contestNum = (int)request.getAttribute("contestNum");
	String benefit = (String)request.getAttribute("contestBenefit");
	String contestTitle = (String)request.getAttribute("contestTitle");
	String alarm = benefit;
	String benefitAlarm = "";
	String alarms[] = alarm.split("/");
	for(int i=0;i<alarms.length;i++) {
		benefitAlarm += alarms[i]+" ";
		if(i%3==0)
			benefitAlarm += ": ";
		if(i%3==1)
			benefitAlarm += ", ";
		if(i%3==2)
			benefitAlarm += ". ";
	}
	
	String str[] = benefit.split("/");
	benefit = "";
	for(int i=0;i<str.length;i++) {
		if(i%3==0) {
			benefit += str[i];
		}
		else if(i%3==1) {
			benefit += str[i].substring(0, str[i].length()-1);
		}
	}
%>
<script type="text/javascript">
	function check() {
		
		var count1 = 0;
		var count2 = 0;
		var count3 = 0;
		var count4 = 0;
		var count5 = 0;
		var prize1 = "";
		var prize2 = "";
		var prize3 = "";
		var prize4 = "";
		var prize5 = "";
		<%
		if(list != null) {
			for(int i=0;i<list.size();i++) {
		%>
				var selecting = document.getElementById("<%=list.get(i).getWorkNum()%>").value;
				if(selecting=="대상") {
					count1++;
					prize1 += <%=list.get(i).getWorkNum()%>+"/";
				}
				else if(selecting=="최우수상") {
					count2++;
					prize2 += <%=list.get(i).getWorkNum()%>+"/";
				}
				else if(selecting=="우수상") {
					count3++;
					prize3 += <%=list.get(i).getWorkNum()%>+"/";
				}
				else if(selecting=="장려상") {
					count4++;
					prize4 += <%=list.get(i).getWorkNum()%>+"/";
				}
				else if(selecting=="입상") {
					count5++;
					prize5 += <%=list.get(i).getWorkNum()%>+"/";
				}
			<%}}%>

		var str = "";
		
		if(count1!=0) {
			str = "대상"+count1;
		}
		if(count2!=0) {
			str += "최우수상"+count2;
		}
		if(count3!=0) {
			str += "우수상"+count3;
		}
		if(count4!=0) {
			str += "장려상"+count4;
		}
		if(count5!=0) {
			str += "입상"+count5;
		}

		if(str!="<%=benefit%>") {
			alert("수상 선택을 확인해주세요.")
			return false;
		}
		
		document.getElementById("prize1").value = prize1;
		document.getElementById("prize2").value = prize2;
		document.getElementById("prize3").value = prize3;
		document.getElementById("prize4").value = prize4;
		document.getElementById("prize5").value = prize5;
		
		var message = confirm("채택을 완료하시겠습니까?");
	    return message;
	}
</script>
<body>
<div>
	<jsp:include page="/WEB-INF/views/header.jsp" flush = "false"/>
</div>
<div style="font-size: 30px; text-align:center"><%=contestTitle %>채택</div>
<div style="font-size: 20px; text-align:center">시상 - <%=benefitAlarm %></div>
<form action="choose.do">
<div>
	<div>
		<font style="margin-top: 20px; margin-left: 15%; font-weight: bold;">[지원 작품]</font>
	</div>
	
	<div style="border:1px solid; margin-left: 15%; overflow: auto; width: 1080px; height: 600px;">
		<% if(!list.isEmpty()) {
			for(int i=0;i<list.size();i++) { 
				String title = list.get(i).getWorkTitle();
				if(title.length()>10) {
					title = title.substring(0, 10)+"..";
				}
		%>
		<div style="margin-top:30px; margin-left:55px" class="work center">
			<select class="form-control" id="<%=list.get(i).getWorkNum()%>">
				<option value="" selected>--선택--</option>
				<option value="대상">대상</option>
				<option value="최우수상">최우수상</option>
				<option value="우수상">우수상</option>
				<option value="장려상">장려상</option>
				<option value="입상">입상</option>
			</select>
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
	<input type="hidden" name="prize1" id="prize1" value="">
	<input type="hidden" name="prize2" id="prize2" value="">
	<input type="hidden" name="prize3" id="prize3" value="">
	<input type="hidden" name="prize4" id="prize4" value="">
	<input type="hidden" name="prize5" id="prize5" value="">
	<input type="hidden" name="contestNum" value="<%=contestNum%>">
	
</div>
<div style="width:1150px; margin-left:10%; text-align:right"><input class="btn btn-primary" type="submit" id="choose" value="채택하기" onclick="return check()"></div>
</form>
<div>
	<jsp:include page="/WEB-INF/views/footer.jsp" flush = "false"/>
</div>
</body>
</html>