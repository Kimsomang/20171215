<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>out-frog : 우물 밖 개구리</title>
</head>
<body>
<% String fileName = (String)request.getAttribute("fileName"); %>

<img alt="사진 확대" src="${pageContext.request.contextPath}/resources/upload/<%=fileName%>" onclick="window.close()">
</body>
</html>