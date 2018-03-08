<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out-frog : 우물 밖 개구리</title>
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<style type="text/css">
.left {
	float: left;
}

.clear {
	clear: both;
}

.center {
	margin: 0 auto;
	text-align: center;
}

.spacing {
	margin: 10px;
}

.spacing_left {
	margin-left: 30px;
}
</style>
</head>
<body>
<div class="header">
   <jsp:include page="/WEB-INF/views/header.jsp" flush = "false"/>
</div>
<div style="float:left;">
      <jsp:include page="/WEB-INF/views/member/adminSideBar.jsp" />
</div>
<div style="background-color: #EAF1FB; width:100%; padding: 10px auto; position: relative;">
	<div style="width: 800px; background-color: white; position: absolute; top:0; left:0; bottom:0; right:0; margin: auto;">
		<Form name="askForm" method="post" action="askForm.do">
			<div class="form-group">
				<label for="askCategory">문의 분류</label>
				<select class="form-control" id="askCategory" name="askCategory">
					<option>로그인 관련</option>
					<option>내 정보 관련</option>
					<option>게시판 관련</option>
					<option>공모 관련</option>
					<option>작품 관련</option>
					<option>신고 관련</option>
					<option>의뢰 관련</option>
					<option>기타</option>
				</select>
			</div>
			<div class="form-group">
				<label for="askTitle">제목</label>
				<input class="form-control" type="text" id="askTitle" name="askTitle" required>
			</div>
			<div class="form-group">
				<textarea class="form-control" rows="20" cols="80" name="askComment" required
				placeholder="내용을 입력하세요." style="resize: none;"></textarea>
			</div>
			<div class="form-group" style="text-align: right;">
				<input class="btn btn-primary" type="submit" value="등록">
				<input class="btn btn-primary" type="reset" value="취소">
			</div>
		</Form>
	</div>
</div>
</body>
</html>