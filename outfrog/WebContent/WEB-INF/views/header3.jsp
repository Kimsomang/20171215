<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">

<style type="text/css">
	img {
		width: 350px;
		height: 80px;
	}

	.logo-bar {
		width: 100%;
		height: 10%;
		background-color: #dfdfdd; 
		text-align: center;
	}

	.bt_m {
		width: 15%; 
		height: 5%; 
		font-size: medium; 
		font-weight: bold; 
	}
	
	.bt_l {
		width: 25%; 
		height: 5%; 
		font-size: medium; 
		font-weight: bold;
	}
	
	.right {
		margin-right: 20px;
	}
</style>

<div>
	<div class="logo-bar">
		<img alt="Logo" src="resources/image/logo.png" onmouseover="this.src='resources/image/logo_change.png'"
				onmouseout="this.src='resources/image/logo.png'">
	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<button class="btn btn-outline-secondary bt_m right">우물 밖 개구리</button>

	<button class="btn btn-outline-secondary bt_l right">깨어있는 사고를 하는 사람</button>
			
	<button class="btn btn-outline-secondary bt_l right">우물 밖으로 나와 넓은 세상으로</button>
			
	<button class="btn btn-outline-secondary bt_l right">창의적인 도전을 기다립니다!</button>
			
	<button class="btn btn-outline-secondary bt_m">우물 은 도약점</button>
</nav>
