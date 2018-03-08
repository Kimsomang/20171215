<%@page import="com.fivefingers.outfrog.model.dto.Request"%>
<%@page import="com.fivefingers.outfrog.model.dto.Work"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out-frog : 우물 밖 개구리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">	

</script>
</head>
<body>


<% 
ArrayList<Work> list = (ArrayList<Work>)request.getAttribute("allRequest");
%>

<div style="float:left;">
<table style = " width:250px; line-height: 30px; margin-left: 50px;">
		
		<tr  id = reportBoardListcl ><td><h4><a style="text-decoration: none; color:black;" href="reportBoardList.do">신고받은 글</a></h4></td></tr>
		<tr id = reportWorkListcl><td><h4><a style="text-decoration: none; color:black;" href="reportWorkList.do">신고받은 작품</a></h4></td></tr>
		<tr id = reportReplyListcl><td><h4><a style="text-decoration: none; color:black;" href="reportReplyList.do" >신고받은 댓글</a></h4></td></tr>
		<tr id = reportAfterListcl><td><h4><a style="text-decoration: none; color:black;" href="reportAfterList.do" >신고 처리완료 관리</a></h4></td></tr>
		<tr id = requestListViewcl><td><h4><a style="text-decoration: none; color:black;" href="requestListView.do">의뢰받은 요청</a></h4></td></tr>
		<tr id = questionManagecl><td><h4><a style="text-decoration: none; color:black;" href="questionManage.do">들어온 문의</a></h4></td></tr>
		<tr id = askFormcl><td><h4><a style="text-decoration: none; color:black;" href="askFormView.do">자주 묻는 질문 등록</a></h4></td></tr>
		<tr id = userListViewcl><td><h4><a style="text-decoration: none; color:black;" href="userListView.do">회원 관리</a></h4></td></tr>
		<tr id = changePwcl><td><h4><a style="text-decoration: none; color:black;" href="changePw.do">비밀번호 변경</a></h4></td></tr>
		
</table>
</div>



</body>
</html>