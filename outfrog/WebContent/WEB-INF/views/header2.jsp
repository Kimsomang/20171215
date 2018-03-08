<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">

<div>
	<div style="background-color: #dfdfdd;">
		<img alt="Logo" src="resources/image/logo.png" onmouseover="this.src='resources/image/logo_change.png'"
				onmouseout="this.src='resources/image/logo.png'" 
			<c:if test ="${userGrade eq 'G'}">	
				onclick="location.href='userMain.do'"
			</c:if>
			<c:if test ="${userGrade eq 'S'}">	
				onclick="location.href='semiAdminMain.do'"
			</c:if>
			<c:if test ="${userGrade eq 'A'}">	
				onclick="location.href='adminMain.do'"
			</c:if>
		>
	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<button class="btn btn-outline-secondary" 
	style="width: 300px; height:35px; font-size: large; font-weight: bold; margin-right: 20px;">
	[${userNickname}]님의 PAGE</button>

	<button class="btn btn-outline-secondary" 
	style="width: 100px; height:35px; font-size: large;">등급: ${userGrade}</button>
			

	<button class="btn btn-secondary" type="button" onclick="location.href='logout.do'"
			style="margin-left: 800px; font-size: medium;">Logout</button>
</nav>
