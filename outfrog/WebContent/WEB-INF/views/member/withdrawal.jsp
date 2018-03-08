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
function checkUserPw(userPw){
   $.ajax({
      type : 'POST',
      data:"userPw="+ userPw,
      dataType : 'text',
      url : 'pwCheck.do',
      success : function(rData, textStatus, xhr) {
            var pwCheck = document.getElementById("userPwCheck");
            var checkNum = rData;
            if(checkNum == 0) {
            	pwCheck.style.color = "#D33530";
            	pwCheck.innerHTML = "기존 비밀번호와 일치하지 않습니다.";
            	$('#pw_usersPw').addClass('is-invalid');
    	      	$('#pw_usersPw').removeClass('is-valid');
            } else {
            	pwCheck.innerHTML = "";
            	$('#pw_usersPw').addClass('is-valid');
    	      	$('#pw_usersPw').removeClass('is-invalid');
            }
      },
      error : function(xhr, status, e) {  
          alert(e);
      }
   });
}

function init() {
	$('#userPwCheck').html('');
	$('#userPwDoubleCheck').html('');
	$('#pw_usersPw').removeClass('is-valid');
	$('#pw_usersPw').removeClass('is-invalid');
	$('#pw_usersPwCheck').removeClass('is-valid');
	$('#pw_usersPwCheck').removeClass('is-invalid');
}

function withdrawal() {
	var pwCheck = document.getElementById('userPwCheck');
	var pwDoubleCheck = document.getElementById('userPwDoubleCheck');
	
	if($('#pw_usersPw').val().length == 0 || $('#pw_usersPwCheck').val().length == 0) {
		alert('비밀번호를 입력하세요.');
		document.getElementById('pw_usersPw').focus();
		$('#pw_usersPw').addClass('is-invalid');
      	$('#pw_usersPw').removeClass('is-valid');
		return;
	}
	
	if(pwCheck.innerHTML == "" && pwDoubleCheck.innerHTML == "") {
    	var message = confirm("확인을 누르시면 탈퇴가 진행됩니다. 계속하길 원하시면 확인을 눌러주세요.");
	    if (message == true) {
	    	document.withdrawalForm.submit();
	    } else {
	    	document.withdrawalForm.reset();
	    	return;
	    }
	} else {
		alert('비밀번호를 다시 확인해주시기바랍니다.');
		document.getElementById('pw_usersPw').focus();
		$('#pw_usersPw').addClass('is-invalid');
      	$('#pw_usersPw').removeClass('is-valid');
	}
}

$(document).ready(function() {
	$("#pw_usersPw").keyup(function() {
		if($(this).val().length > 0) {
			checkUserPw($(this).val());
		}
	});
	
	$("#pw_usersPw").focusout(function() {
		var userPw = $(this).val();
		var check = $('#userPwCheck');
		
		if(userPw == null || userPw == '' || check.length == 0) {
			check.css({'color':"#D33530"});
			check.html("비밀번호를 입력하세요.");
			$('#pw_usersPw').addClass('is-invalid');
	      	$('#pw_usersPw').removeClass('is-valid');
		}
	});
	
	$("#pw_usersPwCheck").keyup(function(){
		var check = $(this).val();
		var userPw = $("#pw_usersPw").val();
		var pwCheck = $("#userPwDoubleCheck");
		
		if(check == null || check == '' || check.length == 0) {
			pwCheck.css({'color':"#D33530"});
			pwCheck.html("비밀번호를 입력하세요.");
			$('#pw_usersPwCheck').addClass('is-invalid');
	      	$('#pw_usersPwCheck').removeClass('is-valid');
		} else if(check.length < 8 || !(check.includes('!') || check.includes('@') || check.includes('#')
	    		  || check.includes('$') || check.includes('`') || check.includes('~') || check.includes('%')
	    		  || check.includes('^') || check.includes('&') || check.includes('*') || check.includes('(')
	    			|| check.includes(')') || check.includes('-'))) {
	    	  $('#pw_usersPwCheck').addClass('is-invalid');
	    	  $('#pw_usersPwCheck').removeClass('is-valid');
	    	  pwCheck.html('');
		} else if(check != userPw) {
			pwCheck.css({'color':"#D33530"});
			pwCheck.html("비밀번호와 일치하지 않습니다.");
			$('#pw_usersPwCheck').addClass('is-invalid');
	      	$('#pw_usersPwCheck').removeClass('is-valid');
		} else {
			pwCheck.html("");
			$('#pw_usersPwCheck').addClass('is-valid');
	      	$('#pw_usersPwCheck').removeClass('is-invalid');
		}
	});
	
	$('#bt_withdrawal').click(function() {
		withdrawal();
	});
	
	$('#bt_reset').click(function() {
		document.withdrawalForm.reset();
		init();
	});
	
	$("#drawcl").addClass('listcolor');
});
</script>
</head>
<body>
<div class="header">
	<jsp:include page="/WEB-INF/views/header.jsp" flush = "false"/>
</div>
<div id="side" style="float:left; width:20%; height:100%; background-color: #3E3F3A;">
<div id="side" style="width:100%; height:100%;">
   <c:if test="${sessionScope.userGrade eq 'G'}">
      <jsp:include page="/WEB-INF/views/member/userSideBar.jsp"/>
   </c:if>
   <c:if test="${sessionScope.userGrade eq 'S'}">
      <jsp:include page="/WEB-INF/views/member/semiAdminSideBar.jsp" />
   </c:if>
</div>
</div>
<div style="width:80%; float: left; height: 550px; overflow: auto;">
<label class="btn-primary btn-lg btn-block lb_title">회 원 탈 퇴</label>
<div style="width: 700px; margin-left: 15%;">
	<div>
		<div class="form-group">
			<label style="font-size: large; font-weight: bold;">주 의 사 항</label>
			<div class="card border-light mb-3">
				<div class="card-body">
					<h4 class="card-title" style="padding-left: 20px;">내정보 및 개인형 서비스 이용 기록 삭제 안내</h4>
					<hr id="a">
					<p class="card-text" style="padding: 0 20px;">내정보 및 개인형 서비스 이용기록이 모두 삭제되며,삭제된 데이터는 복구되지 않습니다.</p>
					<p class="card-text" style="padding: 0 20px;">삭제되는 서비스를 확인하시고, 필요한 데이터는 미리 백업을 해주세요.</p>
					<br><br>
					<h4 class="card-title" style="padding-left: 20px;">게시판형 서비스에 등록한 게시글 삭제 불가 안내</h4>
					<hr id="b">
					<p class="card-text" style="padding: 0 20px;">삭제를 원하는 게시글이 있다면 반드시 회원탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.</p>
					<p class="card-text" style="padding: 0 20px;">탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.</p>
					<br>
				</div>
			</div>
		</div>
	</div>
	<br><br>
	<form name="withdrawalForm" action="deleteUsers.do" method="post">
	<label style="font-size: large; font-weight: bold;">탈퇴 전 본인 확인</label>
	<fieldset style="width: 700px; border: 1px solid #dfdfdd; padding-bottom: 30px;">
		<div class="form-group" style="margin: 20px 130px auto;">
			<h5 style="display: inline-block; width: 130px; text-align: center;">비밀번호</h5>
			<input class="pw_usersPw form-control" type="password" id="pw_usersPw" name="userPw" required maxlength="20"
			pattern="^(?=.*\d)(?=.*[~`!@#$%\^&*()-])(?=.*[a-zA-Z]).{8,20}$" placeholder="비밀번호"
			style="display: inline-block; width: 300px;">
			<div id="userPwCheck" style="margin-left: 130px;"></div>
		</div>
		<div class="form-group" style="margin: 20px 130px auto;">
			<h5 style="display: inline-block; width: 130px; text-align: center;">비밀번호 확인</h5>
			<input class="pw_usersPwCheck form-control" type="password" name="userPwCheck" required maxlength="20"
			pattern="^(?=.*\d)(?=.*[~`!@#$%\^&*()-])(?=.*[a-zA-Z]).{8,20}$" id="pw_usersPwCheck"
			placeholder="비밀번호 확인" style="display: inline-block; width: 300px;">
			<div id="userPwDoubleCheck" style="margin-left: 130px;"></div>
		</div>	
	</fieldset>
		<div class="form-group" style="margin-left: 60%;">
		<br>
			<input class="btn btn-primary" id="bt_withdrawal" type="button" value="회 원 탈 퇴" style="width: 120px; line-height: 16px; font-size: 12px; font-weight: 600; float:left; margin: 5px 5px auto;">
			<input class="btn btn-primary" id="bt_reset" type="button" value="취&emsp;소" style="width: 120px; line-height: 16px; font-size: 12px; font-weight: 600; float:left; margin: 5px 5px auto;">
		<br><br><br>
		</div>
	</form>
</div>
</div>
</body>
</html>