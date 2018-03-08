<%@page import="com.fivefingers.outfrog.model.dto.Board"%>
<%@page import="com.fivefingers.outfrog.model.dto.Reply"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 보기</title>
<% boolean isReport = (boolean)request.getAttribute("isReport");
	boolean isReports[] = (boolean[])request.getAttribute("isReports");
	Board board = (Board)request.getAttribute("boardView"); 
	ArrayList<Reply> replyList = (ArrayList<Reply>)request.getAttribute("replyList"); 
%>
</head>
<script>
$(document).ready(function() {
    $('#replyContents').on('keyup', function() {
        if($(this).val().length > 150) {
            $(this).val($(this).val().substring(0, 150));
        }
    });
});

function reportView() {
	<% if(isReport) {%>
		alert("이미 신고하신 게시물 입니다.");
	<%} else {%>
   var settings ='toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=400,width=600,left=300,top=100';
   var obj = window.open("reportBoard.do?boardNum=<%=board.getBoardNum()%>&boardTitle=<%=board.getBoardTitle()%>&boardWriter=<%=board.getUserId()%>","게시글 신고",settings);
   <%}%>
}

<% for(int i=0;i<replyList.size();i++) {%>
function reportView<%=i%>() {
	<% if(isReports[i]) {%>
		alert("이미 신고하신 댓글 입니다.");
	<%} else {%>
   var settings ='toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=400,width=600,left=300,top=100';
   var obj = window.open("reportReply.do?boardNum=<%=board.getBoardNum()%>&replyNum=<%=replyList.get(i).getReplyNum()%>&replyTitle=<%=replyList.get(i).getReplyContents()%>&replyWriter=<%=replyList.get(i).getUserId()%>","댓글 신고",settings);
   <%}%>
}
<%}%>
</script>
</head>
<body>
<div>
	<jsp:include page="/WEB-INF/views/header.jsp" flush = "false"/>
</div>
<div style="margin:auto; width: 80%">
<form action="deleteBoard.do" name="freeboard" id="freeboard" method="post">
<table class="table table-striped table-hover table-bordered" >
<thead class="thead-dark">
<tr>
<th colspan="15" align="left" width="500px"><h3>게시글 상세보기</h3>
</th>
</tr>
</thead>
<tr>
<th>번호</th><th>게시글 제목</th><th>작성 날짜</th><th>작성자</th><th>조회수</th><th>신고수</th>
</tr>
<tr >
<td><input type="hidden" id="boardNum" name = "boardNum" readonly="readonly" value= "<%= board.getBoardNum() %>"><%= board.getBoardNum() %></td><td><%= board.getBoardTitle() %></td><td><%= board.getPostDate() %></td>
<td><%=board.getUserId() %></td><td><%=board.getHits() %></td><td><%= board.getReportCount() %></td>
<input type="hidden" id="boardId" name="boardId" value="<%= board.getBoardId() %>">
</tr>
<tr><td colspan="15" align="center">내용</td></tr>

<tr>
<td colspan="15">
<div style="margin: auto;float: left;width: 100%">
<textarea rows="50" cols="100"  required readonly="readonly"  id="ta_contents" name = "ta_contents"  style="height:400px;resize: none;width: 100%"> <%=board.getBoardContents() %> </textarea>
</div>
</td>
</tr>


<script>
$(document).ready(function() {
	$('#bt_update').click(function() {
		var usrId = "<%=session.getAttribute("userId")%>";
		var usergrade ="<%=session.getAttribute("userGrade")%>";
		var usercId = "<%= board.getUserId()%>";
		if(usrId == usercId||usergrade=="A"){
			
			$('#ta_contents').attr('readonly',false);
			$('#bt_update').hide();
			$('#bt_complete').show();
			
			alert("수정 화면 이동");
		}else{
			alert("권한이 없습니다");
		}
	});
	
	$('#bt_complete').click(function(){
		
		$('#ta_contents').attr('readonly',true);
		$('#bt_update').show();
		$('#bt_complete').hide();
		document.freeboard.action = "updateBoard.do";
		document.freeboard.submit();
		
		alert("수정 완료")
	});
	
	$('#bt_delete').click(function(){
		
		var usrId = "<%=session.getAttribute("userId")%>";
		var usergrade ="<%=session.getAttribute("userGrade")%>";
		var usercId = "<%= board.getUserId()%>";
		if(usrId == usercId||usergrade=="A"){
			
			$('#ta_contents').attr('readonly',false);
			$('#bt_update').hide();
			$('#bt_complete').show();
			
			alert("삭제 이동");
			document.freeboard.submit();
		}else{
			alert("권한이 없습니다");
		}
		
	});

});
</script>
<tr>
<td colspan="15" align="right">
<button id="bt_delete" class="btn btn-primary" type="button">삭제</button>
<button type="button" class="btn btn-primary" id="bt_update">수정</button>
<button  class="btn btn-primary" id="bt_complete" type="button" style="margin:auto;display: none">변경완료</button>
<a href="freeBoard.do"><button type="button" class="btn btn-primary">목록으로</button></a>
<button type="button" class="btn btn-primary" onclick="reportView()">신고</button>
</td>
</tr>

</table>
</form>
</div>
<br><br>


<div style="margin:auto; width: 72%;">
<table class="table table-hover table-bordered" style=" background-color: gray ; color: white" border=1 cellspacing=0 align="center">

<thead class="thead-dark" style="width:72%">
<tr >
<th colspan="15" >
Reply Comments
</th></tr>
</thead>
<tbody style="cellspacing:0;width: 72%" >
<% 
	if(replyList!=null) {
		for(int i=0;i<replyList.size();i++){

%>

<%if(replyList.get(i).getUserId().equals(session.getAttribute("userId"))||session.getAttribute("userGrade").equals("A")) {%>
<tr><th style="width: 200px" rowspan="2" align="center">
<h4><%=replyList.get(i).getUserNickname() %></h4>
<h5><%=replyList.get(i).getReplyDate() %></h5>

<input type="hidden" id="<%= replyList.get(i).getReplyNum() %>replyNum" 
name="<%= replyList.get(i).getReplyNum() %>replyNum" value="<%= replyList.get(i).getReplyNum() %>"> 
</th>
<th style="width: 100px;color: skyblue" align="center">댓글 내용
</th></tr>


<tr align="right"><th style="width:72% ;color: skyblue;height: 260px;" align="right">
<form action="updateReply.do?boardId=<%=board.getBoardId() %>&boardNum=<%=board.getBoardNum() %>
&replyNum=<%=replyList.get(i).getReplyNum() %>" id="replyUpdateForm" method="post">
<textarea rows="30" cols="10" id="replyContents"  required name="replyContents" style="width:100%;height:200px;resize: none;">
<%=replyList.get(i).getReplyContents() %></textarea>
<input type="submit" class="btn btn-primary" id="bt_updateReplyStart" value="댓글 수정" style="float: right;">
</form>
<form action="deleteReply.do?boardId=<%=board.getBoardId() %>&boardNum=<%=board.getBoardNum() %>
&replyNum=<%=replyList.get(i).getReplyNum() %>" name="replyDeleteForm" id="replyDeleteForm" method="post" >

<input type="submit" class="btn btn-primary" id="bt_deleteReply" value="댓글 삭제"  style="margin-right:10px">

</form>

</th></tr>



<%}else{%>


<tr><th style="width:15%" rowspan="2" align="center">
<h4><%=replyList.get(i).getUserNickname() %></h4>
<h5><%=replyList.get(i).getReplyDate() %></h5>

<input type="hidden" id="<%= replyList.get(i).getReplyNum() %>replyNum" 
name="<%= replyList.get(i).getReplyNum() %>replyNum" value="<%= replyList.get(i).getReplyNum() %>"> 
</th>
<th style="width: 100px;color: skyblue" align="center">댓글 내용
</th></tr>


<tr><th style="color: skyblue"><div class="text-white">
<h4 class="card-text"><%=replyList.get(i).getReplyContents() %></h4>
</div></th></tr>


<tr><td colspan=5 align="right">

<button type="button" class="btn btn-primary" onclick="reportView<%=i%>()">신고</button>
</td></tr>

<%} %>

</tbody>
<% } } %>

</table>
</div>


<br>
<form action="writeReply.do?boardNum=<%=board.getBoardNum()%>&boardId=<%=board.getBoardId()%>" 
name="replyWriteForm" id="replyWriteForm" method="post">

<div style="margin:auto; width: 72%">
<table class="table table-striped table-hover table-bordered" style="background-color: skyblue;" border=1 cellspacing=0 align="center">

<thead class="thead-dark" >
<tr >
<th colspan="15">
댓글달기
</th></tr>
</thead>


<tr><td rowspan="3" style="width: 2%">
<h4> <%=session.getAttribute("userId") %> </h4> <br> <h5> 닉네임:<%=session.getAttribute("userNickname") %> </h5>
</td>
<td align="center" rowspan="1" style="width: 10%">내용</td>
</tr>
<tr>
<td>
<textarea style="width:100%;height:200px;text-align: left;resize: none" name="replyContents" id="replyContents" required ></textarea>
</td>
</tr>
<tr>
<td colspan="5" align="right">
<button type="submit" class="btn btn-primary">댓글작성</button>
</td>
</tr></table>
</div>
</form>
<div>
	<jsp:include page="/WEB-INF/views/footer.jsp" flush = "false"/>
</div>
</body>
</html>