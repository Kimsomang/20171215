<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fivefingers.outfrog.model.dto.Work" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out-frog : 우물 밖 개구리</title>
<style>
.list-group{

	text-align:center; 

}
.listul{
	
	width: 100%;
  	list-style:none;
    -webkit-padding-start: 0px;
    background: #3E3F3A;
    display: inline-block;

   }
.listyle{



 height:80px;
 margin-top:30px;
text-align:center;
vertical-align:middle;

 
}
.peacen{
	margin-top:10%;
	width:100%;
	text-align:center;
	height:50px;
	text-decoration: none; 
	vertical-align:middle;
	color:white;
	display: inline-block;
}

.listcolor{
	background-color:#D33530;
	font-weight: bold;
	font-size:20px;
}
</style>
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap/bootstrap.bundle.js"></script>

<script type="text/javascript">


</script>

</head>
<body>
<div class="list-group">
<ul class = "listul">
		
		<li class="listyle" id="infocl"><a class="peacen" href="myInfo.do">내 정보 보기</a></li>
		<li class="listyle" id="workcl"><a class="peacen" href="myWorkList.do">내 작품 목록</a></li>
		<li class="listyle" id="contactUscl"><a class="peacen" href="contactUs.do">의뢰하기</a></li>
		<li class="listyle" id="chpwcl"><a class="peacen" href="changePw.do">비밀번호 변경</a></li>
		<li class="listyle" id="drawcl"><a class="peacen" href="withdrawal.do">회원 탈퇴</a></li>
</ul>
</div>

</body>
</html>