<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>out-frog : 우물 밖 개구리</title>
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<style type="text/css">
	input[type="checkbox"] {
		display: none;
	}
	
	input[type="checkbox"] + label {
		display: inline-block;
		cursor: pointer;
		line-height: 22px;
		padding-left: 22px;
		background: url('${pageContext.request.contextPath}/resources/image/check_off.png') left/22px no-repeat;
	}
	
	input[type="checkbox"]:checked + label {
		background-image: url('${pageContext.request.contextPath}/resources/image/check_on.png');
	}
	
	.right {
		margin-right: 20px;
	}
	
	.bt_certify {
		float: left;
	}
	
	.bt_login {
		width: 120px; 
		height: 40px;
	}

	.bt_join {
		width: 100px; 
		height: 40px;
	}

	.lb_title {
		width: 100%; 
		font-size: x-large; 
		font-weight: bold; 
		text-align: left; 
		margin-top: 10px;
	}
</style>
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function chkDupId(){
   var userId = $('.tx_userId').val();
     
   $.ajax({
      type : 'POST',
      data:"userId="+ userId,
      dataType : 'text',
      url : 'idCheck.do',
      success : function(rData, textStatus, xhr) {
            var idCheck = document.getElementById('idCheck');
            var checkNum = rData;
            if(checkNum == 0) {
            	$('#userId').addClass('is-valid');
            	$('#userId').removeClass('is-invalid');
                idCheck.innerHTML = "사용 할 수 있는 ID 입니다";
                idCheck.style.color = "#035A37";
               
            } else{
            	$('#userId').addClass('is-invalid');
            	$('#userId').removeClass('is-valid');
                idCheck.innerHTML = "이미 등록된 ID 입니다";
                idCheck.style.color = "#D33530";
            }
      },
      error : function(xhr, status, e) {  
          alert(e);
      }
   });
}
   
$(document).ready(function(){
	$(".bt_certify").attr("disabled", true);
    $(".tx_userId").keyup(function(){
      var userId = $(this).val();
      var idCheck = $("#idCheck");
      
      if(userId.indexOf("@") == -1 || userId.indexOf(".") == -1 ||
            userId.indexOf(".") >= userId.length-2 || userId.length < 10) {
         idCheck.css({'color':'#D33530'});
         idCheck.html("아이디는 10~30자리 사이의 이메일 형식입니다.");
         $('#userId').addClass('is-invalid');
      	 $('#userId').removeClass('is-valid');
      } else {
         idCheck.html("");
         chkDupId();
         $('#userId').addClass('is-valid');
     	 $('#userId').removeClass('is-invalid');
      }
    });
   
   $(".tx_userId").focusout(function() {
      var userId = $(this).val();
      var idCheck = $("#idCheck");
      
      if(userId == null || userId == '' || userId.length == 0) {
         idCheck.css({'color':"#D33530"});
         idCheck.html("아이디는 필수 입력사항입니다.");
         $('#userId').addClass('is-invalid');
      	 $('#userId').removeClass('is-valid');
      }
   });
   
   $(".pw_userPw").focusout(function() {
      var userPw = $(this).val();
      var pwCheck = $("#pwCheck");
      
      if(userPw == null || userPw == '' || userPw.length == 0) {
         pwCheck.css({'color':"#D33530"});
         pwCheck.html("비밀번호는 필수 입력사항입니다.");
         $('#userPw').addClass('is-invalid');
      	 $('#userPw').removeClass('is-valid');
      } else if(userPw.length < 8 || !(userPw.includes('!') || userPw.includes('@') || userPw.includes('#')
    		  || userPw.includes('$') || userPw.includes('`') || userPw.includes('~') || userPw.includes('%')
    		  || userPw.includes('^') || userPw.includes('&') || userPw.includes('*') || userPw.includes('(')
    			|| userPw.includes(')') || userPw.includes('-'))) {
         pwCheck.css({'color':'#D33530'});
         pwCheck.html("비밀번호는 8~20자리 사이의 영문/숫자/특수문자 조합 형식입니다.");
         $('#userPw').addClass('is-invalid');
      	 $('#userPw').removeClass('is-valid');
      } else {
         pwCheck.html("");
         $('#userPw').addClass('is-valid');
      	 $('#userPw').removeClass('is-invalid');
      }
   });
   
   $(".pw_userPwCheck").keyup(function(){
      var check = $(this).val();
      var userPw = $(".pw_userPw").val();
      var checking = $('#pwCheck');
      var pwCheck = $("#pwDoubleCheck");

      if(check == null || check == '' || check.length == 0) {
         pwCheck.css({'color':"#D33530"});
         pwCheck.html("비밀번호를 입력하세요.");
         $('#userPwCheck').addClass('is-invalid');
      	 $('#userPwCheck').removeClass('is-valid');
      } else if(check.length >= 8 && check != userPw) {
         pwCheck.css({'color':"#D33530"});
         pwCheck.html("비밀번호와 일치하지 않습니다.");
         $('#userPwCheck').addClass('is-invalid');
      	 $('#userPwCheck').removeClass('is-valid');
      } else if(check.length < 8 || !(userPw.includes('!') || userPw.includes('@') || userPw.includes('#')
    		  || userPw.includes('$') || userPw.includes('`') || userPw.includes('~') || userPw.includes('%')
    		  || userPw.includes('^') || userPw.includes('&') || userPw.includes('*') || userPw.includes('(')
    			|| userPw.includes(')') || userPw.includes('-'))) {
    	  $('#userPwCheck').addClass('is-invalid');
    	  $('#userPwCheck').removeClass('is-valid');
    	  pwCheck.html('');
      } else {
         pwCheck.html("");
         $('#userPwCheck').addClass('is-valid');
      	 $('#userPwCheck').removeClass('is-invalid');
      }
   });
   
   $(".tx_userName").focusout(function() {
      var userName = $(this).val();
      var nameCheck = $("#userNameCheck");
      
      if(userName == null || userName == '' || userName.length == 0) {
         nameCheck.css({'color':"#D33530"});
         nameCheck.html("이름은 필수 입력사항입니다.");
         $('#userName').addClass('is-invalid');
      	 $('#userName').removeClass('is-valid');
      } else if(!userName.match('^[가-힣]{2,}$')) {
    	 $('#userName').addClass('is-invalid');
    	 $('#userName').removeClass('is-valid');
    	 nameCheck.html('');
      } else {
         nameCheck.html("");
         $('#userName').addClass('is-valid');
      	 $('#userName').removeClass('is-invalid');
      }
   });
   
   $(".tx_phone1").focusout(function() {
      var phone = $(this).val();
      var phoneCheck = $('#phoneCheck');
      
      if(phone == null || phone == '' || phone.length == 0) {
         phoneCheck.css({'color':'#D33530'});
         phoneCheck.html("휴대폰번호는 필수 입력사항입니다.");
         $(".bt_certify").attr("disabled", true);
         $('#userPhone1').addClass('is-invalid');
      	 $('#userPhone1').removeClass('is-valid');
      }
   });
   
   $(".tx_phone1").keyup(function() {
      var phone = $(this).val();
      
      if(phone.length == 11) {
          $('#phoneCheck').html("");
          $(".bt_certify").attr("disabled", false);
          $('#userPhone1').addClass('is-valid');
      	  $('#userPhone1').removeClass('is-invalid');
      } else if (!phone.match('^[0-9]{11}$')) {
    	  $(".bt_certify").attr("disabled", true);
    	  $('#userPhone1').addClass('is-invalid');
          $('#userPhone1').removeClass('is-valid');
          $('#phoneCheck').html("휴대폰번호를 정확히 입력해주세요.");
          $('#phoneCheck').css({'color':'#D33530'});
      } else {
    	  $(".bt_certify").attr("disabled", true);
    	  $('#userPhone1').addClass('is-invalid');
          $('#userPhone1').removeClass('is-valid');
      }
   });
   
   $('.cb_userField').click(function() {
      if($('.cb_userField:checked').length > 2) {
         $(this).prop('checked', false);
         alert('관심분야는 최대 2개까지 선택 가능합니다.');
      }
   });
});
</script>
</head>
<body>
<div class="frame">
	<div class="header">
		<jsp:include page="header3.jsp" flush = "false"/>
	</div> <!-- //header -->

	<div style="background-color: #EAF1FB; width:90%; padding: 10px auto; position: relative;">
		<form name="joinForm" action="insertJoin.do" method="post">
			<div style="width: 800px; background-color: white; position: absolute; top:0; left:0; bottom:0; right:0; margin: auto;">
				<label class="btn-primary btn-lg btn-block lb_title">회 원 가 입</label>
				
				<hr style="width: 80%;">
				<div style="padding-left: 120px;">
					<div class="form-group">
					   <div>
						   	<label class="col-form-label" for="userId">아이디(이메일)</label>
						    <input class="tx_userId form-control" type="text" id = "userId" name="userId" required maxlength="30"
					      			pattern="^[\w]([-_]?[\w]){3,}@[\w]([-_.]?[\w])+\.[a-zA-Z]{2,}$" value="${userNaverId}"
									placeholder="아이디(10자 이상 이메일형식)" style="width: 85%;">
					   <div class="form-control-feedback" id="idCheck"></div>
					   </div>
					</div>
					<div class="form-group" style="clear: both;">
						<div>
					 		<label class="col-form-label" for="userPw">비밀번호</label>
					    	<input class="pw_userPw form-control" type="password" name="userPw" required maxlength="20"
					   			 pattern="^(?=.*\d)(?=.*[~`!@#$%\^&*()-])(?=.*[a-zA-Z]).{8,20}$" id="userPw"
					    		placeholder="비밀번호(8자 이상 영문/숫자/특수문자 조합)" style="width: 85%;">
					   </div>
					   <div id="pwCheck"></div>
					</div>
					<div class="form-group">
					   <div>
					    	<label class="col-form-label" for="userPwCheck">비밀번호 재확인</label>
					      	 <input class="pw_userPwCheck form-control" type="password" name="userPwCheck" required maxlength="20"  style="width: 85%;"
									pattern="^(?=.*\d)(?=.*[~`!@#$%\^&*()-])(?=.*[a-zA-Z]).{8,20}$" id="userPwCheck" placeholder="비밀번호 재확인">
					   </div>
					   <div id="pwDoubleCheck"></div>
					</div>
					<div class="form-group">
					   <div>
					    	<label class="col-form-label" for="userName">이름</label>
					       	<input class="tx_userName form-control" type="text" name="userName" style="width: 85%;"
								id="userName" required maxlength="10" value="${userName}" pattern="^[가-힣]{2,}$" placeholder="이름">
					   </div>
					   <div id="userNameCheck"></div>
					</div>
					<div class="form-group">
					  	<div>
					    	<label class="col-form-label" for="userPhone1">휴대폰 번호</label>
						</div>
						<div style="float:left;">
							<input class="tx_phone1 form-control" type="text" placeholder="휴대폰 번호('-'제외)" pattern="^[0-9]{11}$"
							name="userPhone1" id="userPhone1" required maxlength="11" style="float: left; width: 507px">
						</div>
						<div style="float:left;">
						    <input class="btn bt_certify btn-primary" type="button" value="본인인증">
						</div>
						<div style="clear:both;" id="phoneCheck"></div>
					</div>
					<div class="form-group">
					   <div>
					    	<label class="col-form-label" for="userPhone2">비상연락처</label>
					       	<input class="tx_phone2 form-control" type="text" id="userPhone2" name="userPhone2" placeholder="비상 연락처('-'제외)" style="width: 85%;">
					   </div>
					</div>
				</div>
				<hr style="width: 85%;">
				<div style="padding-left: 120px;">
					<div class="form-group">
					  <div>
					  	<label class="col-form-label" for="userField">관심분야</label>
					  </div>
					  <div>
					      <input class="cb_userField form-check-input" type="checkbox" id="userField1" multiple name="userField" value="배너광고"> 
					  	  <label for="userField1">배너광고</label>
					      <input class="cb_userField form-check-input" type="checkbox" id="userField2" multiple name="userField" value="팝업광고"> 
					      <label for="userField2">팝업광고</label>
					      <input class="cb_userField form-check-input" type="checkbox" id="userField3" multiple name="userField" value="동영상광고"> 
					      <label for="userField3">동영상광고</label>
					      <input class="cb_userField form-check-input" type="checkbox" id="userField4" multiple name="userField" value="지면광고">
					      <label for="userField4">지면광고</label>
					      <input class="cb_userField form-check-input" type="checkbox" id="userField5" multiple name="userField" value="브랜드명">
					      <label for="userField5">브랜드명</label>
					      <input class="cb_userField form-check-input" type="checkbox" id="userField6" multiple name="userField" value="제품명">
					      <label for="userField6">제품명</label>
					      <input class="cb_userField form-check-input" type="checkbox" id="userField7" multiple name="userField" value="기타광고">
					      <label for="userField7">기타광고</label>
					   </div>
					</div>
				</div>
				<hr style="width: 85%;">
				<div style="padding-left: 120px;">
					<div class="form-group">
					   <input class="cb_userGetmail form-check-input" type="checkbox" id="userGetmail" name="userGetmail" value="Y">
					   <label class="col-form-label" for="userGetmail">이메일 정보제공 동의(선택)</label>
					</div>
					<div class="form-group">
					   <input class="cb_userGetsms form-check-input" type="checkbox" id="userGetsms" name="userGetsms" value="Y">
					   <label class="col-form-label" for="userGetsms">SMS 정보제공 동의(선택)</label>
					</div>
					<div class="form-group" style="text-align: right; margin-right: 105px;">
					   <input class="btn btn-primary bt_join right" id="bt_join" type="submit" 
					   			style="font-size: 100%" value="회원가입">
					   <input class="btn btn-primary bt_login" type="button" 
					   			style="font-size: 100%" value="로그인 화면" 
					   			onclick="location.href='login.do'">
					</div>
				</div>
			</div>
		</form>
	</div>
</div> <!-- //frame -->	
</body>
</html>