<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신고 내용 작성</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css?ver=1">
<script type="text/javascript">
<%  String field = (String)request.getAttribute("field");
int typeNum = (int)request.getAttribute("typeNum");
	int replyNum = (int)request.getAttribute("replyNum");
String title = (String)request.getAttribute("title");
String writer = (String)request.getAttribute("writer");
%>
	$(document).ready(function() {
	  $("form").submit(function() {
	    var $form = $(this);
	    $.post($form.attr('action'), $form.serializeArray());
	    alert("신고 완료");
	    opener.location.reload();
	    window.close();
	    return false;
	  });
	});
</script>
</head>
<body>

<form action="insertReport.do" name="freeboard" method="post">
<input type="hidden" name="field" value="<%=field%>">
<input type="hidden" name="typeNum" value="<%=typeNum%>">
<input type="hidden" name="replyNum" value="<%=replyNum%>">
<input type="hidden" name="title" value="<%=title%>">
<input type="hidden" name="writer" value="<%=writer%>">
<table border=1 cellspacing=0 align="center" class="table table-striped table-hover table-bordered">
<tr>
<td colspan="5" align="center">
신고
</td>
</tr>
<tr>
<td>
신고 할 게시글 작성자 : <%=writer %>
</td>
<td align="center"><%=field %></td>
</tr>
<tr>
<td colspan="15" align="center"><%=title %></td>
</tr>
<tr>
<td colspan="15" align="center">사유 선택</td>
</tr>
<tr>
<td colspan="15" style="background-color: white">
<input type="radio" name="reportWhy" id="reportWhy" value="부적절한 게시물" checked>부적절한 게시물(불법성 홍보, 판매 등)
</td>
</tr>
<tr>
<td colspan="15" style="background-color: white">
<input type="radio" name="reportWhy" id="reportWhy" value="음란성 또는 청소년에게 부적합한 내용">음란성 또는 청소년에게 부적합한 내용(음란물, 잔인함 등)
</td>
</tr>
<tr>
<td colspan="15" style="background-color: white">
<input type="radio" name="reportWhy" id="reportWhy" value="비방/욕설">비방/욕설(신체,외모,취향,특정인,계층,지역,국민,종교,죽음 비하 및 모욕)
</td>
</tr>
<tr>
<td colspan="15" style="background-color: white">
<input type="radio" name="reportWhy" id="reportWhy" value="명예훼손/사생활 침해 및 저작권침해 등">명예훼손/사생활 침해 및 저작권침해 등
</td>
</tr>

<tr><td colspan="5" align="right">
<input type="submit" class="btn btn-primary" value="신고하기">
</td></tr>
</table>
</form>
</body>
</html>