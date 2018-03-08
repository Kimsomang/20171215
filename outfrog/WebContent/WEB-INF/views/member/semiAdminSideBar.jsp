<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out-frog : 우물 밖 개구리</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="resources/css/company.css?ver=2">
<style>
.list-group{

text-align:center; 

margin-left:50px;


}
.listul{
	width:160px;
  	list-style:none;
    -webkit-padding-start: 0px;
    background: #f8f8f8;
    display: inline-block;
  
   }
.listyle{

width:160px;
 height:80px;
text-align:center;
vertical-align:middle;

 
}
.peacen{
	margin-top:20%;
	text-align:center;
	text-decoration: none; 
	color:black;
	display: inline-block;
}

.listcolor{
	background-color:#D33530;
	font-weight: bold;
	
}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="resources/js/datepicker-ko.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">


</script>

</head>
<body>



<div class="list-group" style="float:left;">
<ul class = "listul">
		
		<li class="listyle" id = "infocl"><h4><a class="peacen"  href="myInfo.do">내 정보 보기</a></h4></li>
		<li class="listyle" id = "contactUscl"><h4><a class="peacen" href="contactUs.do">의뢰하기</a></h4></li>
		<li class="listyle" id = "myContestcl"><h4><a class="peacen" href="myContest.do">내 공모전 목록</a></h4></li>
		<li class="listyle" id = "chpwcl"><h4><a class="peacen" href="changePw.do">비밀번호 변경</a></h4></li>
		<li class="listyle" id = "companyInfocl"><h4><a class="peacen" href="myCompanyInfo.do">기업정보변경</a></h4></li>
		<li class="listyle" id = "drawcl"><h4><a class="peacen" href="withdrawal.do">회원 탈퇴</a></h4></li>

</ul>
</div>


</body>
</html>