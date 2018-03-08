<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="header">
		<jsp:include page="/WEB-INF/views/header.jsp" flush = "false"/>
	</div>
<form action="noticeBoardWrite.do" method="post">
<div style="margin:auto; width: 80%">
<table class="table table-striped table-hover table-bordered" style="background-color: skyblue;" border=1 cellspacing=0 align="center">
<thead class="thead-dark">
  
    <tr>
    <th colspan="2">
       <h3>공지 게시판</h3>
</th>
</tr>
</thead>
<tr align="center">
<th>게시글 제목</th>
<th>작성자</th>
</tr>

<tr bgcolor="white">
<td colspan="1" align="center">
<input type="text" style=" width:700px;" id= "boardTitle" name="boardTitle">
</td>

<td align="center">
<H3>관리자</H3></td>
</tr>
<tr><td colspan="2" align="center">내용</td></tr>
<tr>
<td colspan="2">
<textarea rows="50" cols="100" name="boardContents" style="width:970px;height:400px;resize: none;"></textarea>
</td>
</tr>
<tr>
<td colspan="2" align="right"><button class="btn btn-primary" type="submit">작성완료</button>
<a href="noticeBoard.do"><button type="button" class="btn btn-primary">목록으로</button></a></td>
</tr>

</table>
</div>
</form>
</body>
</html>