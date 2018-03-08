<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 보기</title>
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
</head>
<script>
$(document).ready(function() {
    $('#boardContents').on('keyup', function() {
        if($(this).val().length > 498) {
            $(this).val($(this).val().substring(0, 498));
        }
    });
    $('#boardTitle').on('keyup', function() {
        if($(this).val().length > 24) {
            $(this).val($(this).val().substring(0, 24));
        }
    });
});
</script>
<body>
<div class="header">
		<jsp:include page="/WEB-INF/views/header.jsp" flush = "false"/>
	</div>

<form action="freeBoardWrite.do" method="post">
<div style="margin:auto; width: 80%">
<table class="table" style="background-color: gray;" border=1 cellspacing=0 align="center">
<thead class="thead-dark">
  
    <tr>
    <th colspan="2">
       <h2 style="float: left;">자유+TIP 게시판</h2>
      <div class="form-group">
<select id="category" style="width: 200px; margin-left:30px ; float: right" class="form-control" name="category">
<option value="N">카테고리 선택</option>
<option value="F">자유</option>
<option value="T">TIP</option>
</select>
</div>
</th>
</tr>
</thead>
<tr style="text-align: center; color: white">
<th>게시글 제목</th>
<th>작성자 (닉네임)</th>
</tr>

<tr bgcolor="gray" style="color: white">
<td colspan="1" align="center" width="70%">
<input type="text" style=" width:100%;" id= "boardTitle" name="boardTitle">
</td>

<td align="center">
<input type="hidden" readonly="readonly" name = "userId" value="${userId}">${userId}
<input type="hidden" readonly="readonly" name="userNickname" value="${userNickname }">(${userNickname })</td>
</tr>
<tr style="color: white;"><td colspan="2" align="center">내용</td></tr>
<tr>
<td colspan="2">
<textarea rows="50" cols="100" id="boardContents" name="boardContents" style="width: 100%; height: 400px; resize: none;font-size: 20px"></textarea>
</td>
</tr>
<tr>
<td colspan="2" align="right"><button class="btn btn-primary" type="submit">작성완료</button>
<a href="freeBoard.do"><button type="button" class="btn btn-primary">목록으로</button></a></td>
</tr>

</table>
</div>
</form>
<div>
	<jsp:include page="/WEB-INF/views/footer.jsp" flush = "false"/>
</div>
</body>
</html>