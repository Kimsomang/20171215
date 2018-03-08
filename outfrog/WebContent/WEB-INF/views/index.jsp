<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>out-frog : 우물 밖 개구리</title>

<style type="text/css">
	#video { 
	     position: absolute;
	     top: 0px;
	     left: 0px;
	     min-width: 100%;
	     min-height: 100%;
	     width: 1366px;
	     height: auto;
	     z-index: -1;
	     overflow: hidden;
	}

	.middle {
		margin: auto;
		text-align: center;
	}
	
	.top {
		margin-top: 90px;
	}

	.top_l {
		margin-top: 200px;
	}
	
</style>	
	
</head>
<body>
	<video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
      <source src="resources/movie/frog.mp4">
	</video>
	<div class="middle">
		<div class="title top">
			<img alt="Frog Out of The Well." src="resources/image/index_title.png">
		</div>
		<div class="top_l">
			<img alt="Frog Out of The Well." src="resources/image/bt_index.png"
				onclick="location.href='login.do'">
		</div>
		<div class="top">
			<img src="resources/image/index_footer.png">
		</div>
	</div>
</body>
</html>
