<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out-frog : 우물 밖 개구리</title>
</head>
<body>
<h2>Error Page</h2>
<hr>
<font style="color: red; font-size: large;"><%=request.getAttribute("error") %></font>
</body>
</html>