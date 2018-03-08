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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="resources/js/datepicker-ko.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
function init() {
	var select = "${selectMenu}";
	if(select == "contact") {
		$('.adminMain').hide();
		$("#contactUs").show();
	} else if(select == "contract") {
		$('.adminMain').hide();
		$("#contract").show();
	} else if(select == "chpw") {
		$('.adminMain').hide();
		$("#chpw").show();
	} else if(select == "draw") {
		$('.adminMain').hide();
		$("#draw").show();
	} else if(select == "contest") {
		$('.adminMain').hide();
		$("#contest").show();
	} else if(select == "company") {
		$('.adminMain').hide();
		$("#companyInfo").show();
	} else {
		$('.adminMain').hide();
		$("#info").show();
	}
}
$(document).ready(function(){
	init();
	
    $("#infocl").click(function(){
    	$("#info").show();
    	$("#contactUs").hide();
    	$("#contest").hide();
    	$("#contract").hide();
    	$("#chpw").hide();
    	$("#companyInfo").hide();
    	$("#draw").hide();
    });
    
    $("#contactUscl").click(function(){
    	$("#info").hide();
    	$("#contactUs").show();
    	$("#contest").hide();
    	$("#contract").hide();
    	$("#chpw").hide();
    	$("#companyInfo").hide();
    	$("#draw").hide();
    });
    
    $("#contestcl").click(function(){
    	$("#info").hide();
    	$("#contactUs").hide();
    	$("#contest").show();
    	$("#contract").hide();
    	$("#chpw").hide();
    	$("#companyInfo").hide();
    	$("#draw").hide();
    });
    
    $("#chpwcl").click(function(){
    	$("#info").hide();
    	$("#contactUs").hide();
    	$("#contest").hide();
    	$("#contract").hide();
    	$("#chpw").show();
    	$("#companyInfo").hide();
    	$("#draw").hide();
    });
    
    $("#companyInfocl").click(function(){
    	$("#info").hide();
    	$("#contactUs").hide();
    	$("#contest").hide();
    	$("#contract").hide();
    	$("#chpw").hide();
    	$("#companyInfo").show();
    	$("#draw").hide();
    });
    
    $("#drawcl").click(function(){
    	$("#info").hide();
    	$("#contactUs").hide();
    	$("#contest").hide();
    	$("#contract").hide();
    	$("#chpw").hide();
    	$("#companyInfo").hide();
    	$("#draw").show();
    });
});


$(function(){
    $("#dueDate").datepicker({ minDate: 0, dateFormat: "yy년mm월dd일"});
});
</script>

</head>
<body>

<a style="text-decoration:none;"  href = "semiAdminMain.do"><h1 align="center" style="margin-top: 30px;">로고</h1></a>

<div style="float:left;">
<table style = " width:250px; line-height: 30px; margin-left: 50px;">
		
		<tr><td><h2> 등급 : Semi-Admin</h2></td></tr>
		<tr id = "infocl"><td><h4><a style="text-decoration: none; color:black;">내 정보 보기</a></h4></td></tr>
		<tr id = "contactUscl"><td><h4><a id = "work" style="text-decoration: none; color:black;">의뢰하기</a></h4></td></tr>
		<tr id = "contestcl"><td><h4><a style="text-decoration: none; color:black;">내 공모전 목록</a></h4></td></tr>
		<tr id = "chpwcl"><td><h4><a style="text-decoration: none; color:black;">비밀번호 변경</a></h4></td></tr>
		<tr id = "companyInfocl"><td><h4><a style="text-decoration: none; color:black;">기업정보변경</a></h4></td></tr>
		<tr id = "drawcl"><td><h4><a style="text-decoration: none; color:black;">회원 탈퇴</a></h4></td></tr>
	
</table>
</div>

<div id="info" class = "adminMain">
<jsp:include page="myInfo.jsp" flush = "true"/>
</div>
<div id="contactUs" style="float:left; display: none;" class = "adminMain">
<jsp:include page="/WEB-INF/views/contest/contactUs.jsp" flush = "true"/>
</div>
<div id="contract" style="float:left; display: none;" class = "adminMain">
<jsp:include page="/WEB-INF/views/contest/contract.jsp" flush = "true"/>
</div>
<div id="contest" style=" display: none;" class = "adminMain">
<jsp:include page="myContest.jsp" flush = "true"/>
</div>
<div id="chpw" style=" display: none;" class = "adminMain">
<jsp:include page="changePw.jsp" flush = "true"/>
</div>
<div id="companyInfo" style=" display: none;" class = "adminMain">
<jsp:include page="myCompanyInfo.jsp" flush = "true"/>
</div>
<div id="draw" style=" display: none;" class = "adminMain">
<jsp:include page="withdrawal.jsp" flush = "true"/>
</div>


</body>
</html>