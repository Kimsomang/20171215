<%@page import="com.fivefingers.outfrog.model.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 보기</title>
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function() {
	function reportForm() {
		window.open("reportForm.do", "", "width=550 height=350")
	}
	
	
});
</script>

</head>
<body>
<div class="header">
		<jsp:include page="/WEB-INF/views/header.jsp" flush = "false"/>
	</div>
<%
Board board = (Board)request.getAttribute("noticeboardView"); 
%>

<form action="noticeDeleteBoard.do" name="noticeboard" id="noticeboard" method="post">
<div style="margin:auto; width: 80%">
<table class="table table-striped table-hover table-bordered">
<thead class="thead-dark">
<tr>
<th colspan="15" align="left" width="500px"><h3>게시글 상세보기</h3>
</th>
</tr>
</thead>
<tr>
<th>번호</th><th>게시글 제목</th><th>작성 날짜</th><th>작성자</th><th>조회수</th>
</tr>
<tr>
<td><input type="hidden" id="boardNum" name = "boardNum" readonly="readonly" value= "<%= board.getBoardNum() %>"><%= board.getBoardNum() %></td><td><%= board.getBoardTitle() %></td><td><%= board.getPostDate() %></td>
<td> 관리자 </td><td><%=board.getHits() %></td>
</tr>
<tr><td colspan="15" align="center">내용</td></tr>

<tr>
<td colspan="15">
<div style="margin: auto;float: left">
<textarea rows="50" cols="100" readonly="readonly"  id="ta_contents" name = "ta_contents"  style="width:970px;height:400px;resize: none;"> <%=board.getBoardContents() %> </textarea>
</div>
</td>
</tr>


<script>
$(document).ready(function() {
	$('#bt_update').click(function() {
		var usrId = "<%=session.getAttribute("userId")%>";
		var usercId = "<%= board.getUserId()%>";
		alert(usercId);
		if(usrId == usercId){
			
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
		document.noticeboard.action = "updateBoard.do";
		document.noticeboard.submit();
		
		alert("수정 완료")
	});
	
	$('#bt_delete').click(function(){
		
		var usrId = "<%=session.getAttribute("userId")%>";
		var usercId = "<%= board.getUserId()%>";
		alert(usercId);
		if(usrId == usercId){
			
			$('#ta_contents').attr('readonly',false);
			$('#bt_update').hide();
			$('#bt_complete').show();
			
			alert("삭제 이동");
			document.noticeboard.submit();
		}else{
			alert("권한이 없습니다");
		}
		
	});

});
</script>
<tr>
<td colspan="15" align="right">
<%if(session.getAttribute("userGrade").equals("A")){ %>
<button id="bt_delete" class="btn btn-primary" type="button">삭제</button>
<button type="button" class="btn btn-primary" id="bt_update">수정</button>
<button  class="btn btn-primary" id="bt_complete" type="button" style="margin:auto;display: none">변경완료</button>
<%} %>
<a href="noticeBoard.do"><button type="button" class="btn btn-primary">목록으로</button></a>
</td>
</tr>

</table>
</div>
</form>

</body>
</html>