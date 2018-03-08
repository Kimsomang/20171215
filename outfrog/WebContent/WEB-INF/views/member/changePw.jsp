<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out-frog : 우물 밖 개구리</title>
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<style type="text/css">
.lb_title {
	color: white;
	font-weight: bold;
	background-color: #D33530;
	margin-bottom: 30px;
	margin-top: 20px;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function checkPw(userPw){
   $.ajax({
      type : 'POST',
      data:"userPw="+ userPw,
      dataType : 'text',
      url : 'pwCheck.do',
      success : function(rData, textStatus, xhr) {
            var pwCheck = document.getElementById("pwCheck");
            var checkNum = rData;
            if(checkNum == 0) {
            	pwCheck.innerHTML = "기존 비밀번호와 일치하지 않습니다.";
            	pwCheck.style.color = "#D33530";
            	$('#pw_oldUserPw').addClass('is-invalid');
             	$('#pw_oldUserPw').removeClass('is-valid');
            } else {
            	pwCheck.innerHTML = "";
            	$('#pw_oldUserPw').addClass('is-valid');
             	$('#pw_oldUserPw').removeClass('is-invalid');
            }
      },
      error : function(xhr, status, e) {  
          alert(e);
      }
   });
}
function init() {
	$('#pwCheck').html('');
	$('#newPwCheck').html('');
	$('#pwDoubleCheck').html('');
	$('#pw_oldUserPw').removeClass('is-valid');
	$('#pw_oldUserPw').removeClass('is-invalid');
	$('#pw_userPw').removeClass('is-valid');
	$('#pw_userPw').removeClass('is-invalid');
	$('#pw_userPwCheck').removeClass('is-valid');
	$('#pw_userPwCheck').removeClass('is-invalid');
}
	
$(document).ready(function() {
	init();
	
	$("#pw_oldUserPw").keyup(function() {
		if($(this).val().length > 0) {
			checkPw($(this).val());
		}
	});
	
	$("#pw_oldUserPw").focusout(function() {
		var userPw = $(this).val();
		var pwCheck = $("#pwCheck");
		
		if(userPw == null || userPw == '' || userPw.length == 0) {
			pwCheck.css({'color':"#D33530"});
			pwCheck.html("비밀번호를 입력하세요.");
			$('#pw_oldUserPw').addClass('is-invalid');
	      	$('#pw_oldUserPw').removeClass('is-valid');
		}
	});
	
	$("#pw_userPw").focusout(function() {
		var userPw = $(this).val();
		var pwCheck = $("#newPwCheck");
		var userOldPw = $('#pw_oldUserPw').val();
		
		if(userPw == null || userPw == '' || userPw.length == 0) {
			pwCheck.css({'color':"#D33530"});
			pwCheck.html("비밀번호는 필수 입력사항입니다.");
			$('#pw_userPw').addClass('is-invalid');
	      	$('#pw_userPw').removeClass('is-valid');
		} else if(userPw.length < 8 || !(userPw.includes('!') || userPw.includes('@') || userPw.includes('#')
	    		  || userPw.includes('$') || userPw.includes('`') || userPw.includes('~') || userPw.includes('%')
	    		  || userPw.includes('^') || userPw.includes('&') || userPw.includes('*') || userPw.includes('(')
	    			|| userPw.includes(')') || userPw.includes('-'))) {
			pwCheck.css({'color':'#D33530'});
			pwCheck.html("비밀번호는 8~20자리 사이의 영문/숫자/특수문자 조합 형식입니다.");
			$('#pw_userPw').addClass('is-invalid');
	      	$('#pw_userPw').removeClass('is-valid');
		} else if(userPw == userOldPw){
			pwCheck.css({'color':'#D33530'});
			pwCheck.html("기존 비밀번호와 일치합니다. 다른 비밀번호를 입력하세요.");
			$('#pw_userPw').addClass('is-invalid');
	      	$('#pw_userPw').removeClass('is-valid');
		} else {
			pwCheck.html("");
			$('#pw_userPw').addClass('is-valid');
	      	$('#pw_userPw').removeClass('is-invalid');
		}
	});
	
	$("#pw_userPwCheck").keyup(function(){
		var check = $(this).val();
		var userPw = $("#pw_userPw").val();
		var userOldPw = $('#pw_oldUserPw').val();
		var pwCheck = $("#pwDoubleCheck");
		
		if(check == null || check == '' || check.length == 0) {
			pwCheck.css({'color':"#D33530"});
			pwCheck.html("비밀번호를 입력하세요.");
			$('#pw_userPwCheck').addClass('is-invalid');
	      	$('#pw_userPwCheck').removeClass('is-valid');
		} else if(check != userPw) {
			pwCheck.css({'color':"#D33530"});
			pwCheck.html("비밀번호와 일치하지 않습니다.");
			$('#pw_userPwCheck').addClass('is-invalid');
	      	$('#pw_userPwCheck').removeClass('is-valid');
		} else if(check.length <8 || !(userPw.includes('!') || userPw.includes('@') || userPw.includes('#')
	    		  || userPw.includes('$') || userPw.includes('`') || userPw.includes('~') || userPw.includes('%')
	    		  || userPw.includes('^') || userPw.includes('&') || userPw.includes('*') || userPw.includes('(')
	    			|| userPw.includes(')') || userPw.includes('-'))) {
			pwCheck.html('');
			$('#pw_userPwCheck').addClass('is-invalid');
	      	$('#pw_userPwCheck').removeClass('is-valid');
		} else if(check == userOldPw) {
			pwCheck.html("");
			$('#pw_userPwCheck').addClass('is-invalid');
	      	$('#pw_userPwCheck').removeClass('is-valid');
		} else {
			pwCheck.html("");
			$('#pw_userPwCheck').addClass('is-valid');
	      	$('#pw_userPwCheck').removeClass('is-invalid');
		}
	});
	
	$('#bt_update').click(function() {
		var pwCheck = $('#pwCheck').html();
		var newPwCheck = $('#newPwCheck').html();
		var pwDoubleCheck = $('#pwDoubleCheck').html();
		
		if(pwCheck == '' && newPwCheck == '' && pwDoubleCheck == '') {
			document.changePwForm.submit();
		} else {
			alert('비밀번호를 다시 확인해주세요.');
			return;
		}
	});
	
	$('#bt_reset').click(function() {
		init();
		document.changePwForm.reset();
	});
	
	$("#chpwcl").addClass('listcolor');
});
</script>
</head>
<body>
<div class="header">
	<jsp:include page="/WEB-INF/views/header.jsp" flush = "false"/>
</div>
<div style="float: left; width: 20%; height:100%; background-color: #3E3F3A;">
<div id="side" style="width:100%; height:100%;">
   <c:if test="${sessionScope.userGrade eq 'G'}">
      <jsp:include page="/WEB-INF/views/member/userSideBar.jsp"/>
   </c:if>
   <c:if test="${sessionScope.userGrade eq 'S'}">
      <jsp:include page="/WEB-INF/views/member/semiAdminSideBar.jsp" />
   </c:if>
	<c:if test="${sessionScope.userGrade eq 'A'}">
		<jsp:include page="/WEB-INF/views/member/adminSideBar.jsp" />
	</c:if>
</div>
</div>
<div style="float: left; width: 80%; height: 550px; overflow: auto;">
<label class="btn-primary btn-lg btn-block lb_title">비 밀 번 호 변 경</label>
<form name="changePwForm" action="updateUserPw.do" method="post">
	<div style="margin-left: 20%; width:700px;">
	<div>	
		<div class="form-group">
			<h5 style="width: 150px; margin: 0 10px; text-align: center; display: inline-block;">현재 비밀번호</h5>
			<input class="form-control" type="password" name="userPw" id="pw_oldUserPw" required maxlength="20"
			style="width: 400px; display: inline-block;" placeholder="현재 비밀번호">
			<div id="pwCheck" style="margin-left: 180px;"></div>
		</div>
		<div class="form-group">
			<h5 style="width: 150px; margin: 0 10px; display: inline-block; text-align: center;">새 비밀번호</h5>
			<input class="form-control" type="password" name="newUserPw" id="pw_userPw" required maxlength="20"
			pattern="^(?=.*\d)(?=.*[~`!@#$%\^&*()-])(?=.*[a-zA-Z]).{8,20}$"
			placeholder="새 비밀번호(8자 이상 영문/숫자/특수문자 조합)" style="width: 400px; display: inline-block;">
			<div id="newPwCheck" style="margin-left: 180px;"></div>
		</div>
		<div class="form-group">
			<h5 style="width: 150px; margin: 0 10px; display: inline-block; text-align: center;">새 비밀번호 확인</h5>
			<input class="form-control" type="password" name="userPwCheck" id="pw_userPwCheck" required maxlength="20"
			pattern="^(?=.*\d)(?=.*[~`!@#$%\^&*()-])(?=.*[a-zA-Z]).{8,20}$"
			placeholder="새 비밀번호 확인" style="width: 400px; display: inline-block;">
			<div id="pwDoubleCheck" style="margin-left: 180px;"></div>
		</div>
		<div class="form-group" style="margin-left: 45%;">
			<input class="btn btn-primary" type="button" id="bt_update" style="width: 120px; line-height: 16px; font-size: 12px; font-weight: 600; float:left; margin: 5px 5px auto;" value="변&emsp;경">
			<input class="btn btn-primary" type="reset" id="bt_reset" style="width: 120px; line-height: 16px; font-size: 12px; font-weight: 600; float:left; margin: 5px 5px auto;" value="취&emsp;소">
		</div>
	</div>
	</div>
</form>
</div>
</body>
</html>