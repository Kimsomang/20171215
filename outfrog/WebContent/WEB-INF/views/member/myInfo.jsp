<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
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
.bt_certify {
	float: left;
}
.lb_title {
	font-weight: bold; 
	text-align: left; 
	width: 100%;
	margin-top: 20px;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap/bootstrap.bundle.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#infocl").addClass('listcolor');
	
	$('#bt_update').click(function() {
		$('#bt_complete').css({'display':'inline'});
		$(this).css({'display':'none'});
		$('.attr_readonly').attr("readonly", false);
		$('.attr_disabled').attr("disabled", false);
		$('.bt_certify').css({'display':'inline'});
	});
	
	$('#bt_complete').click(function() {
		$('#bt_update').css({'display':'inline'});
		$(this).css({'display':'none'});
		$('.bt_certify').css({'display':'none'});
		document.myInfoForm.submit();
		$('.attr_readonly').attr("readonly", true);
		$('.attr_disabled').attr("disabled", true);
		alert("수정이 완료되었습니다~");
	});
	
	$('.cb_userField').click(function() {
		if($('.cb_userField:checked').length > 2) {
			$(this).prop('checked', false);
			alert('관심분야는 최대 2개까지 선택 가능합니다.');
		}
	});
	
	$(".tx_userNickname").focusout(function() {
		  var userName = $(this).val();
	      var nameCheck = $("#userNicknameCheck");
	      
	      if(userName == null || userName == '' || userName.length == 0) {
	         nameCheck.css({'color':"#D33530"});
	         nameCheck.html("닉네임은 필수 입력사항입니다.");
	         $('#userNickname').addClass('is-invalid');
	      	 $('#userNickname').removeClass('is-valid');
	      } else {
	         nameCheck.html("");
	         $('#userNickname').addClass('is-valid');
	      	 $('#userNickname').removeClass('is-invalid');
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
	      } else {
	         nameCheck.html("");
	         $('#userName').addClass('is-valid');
	      	 $('#userName').removeClass('is-invalid');
	      }
	});
	
	$(".tx_phone").focusout(function() {
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
	
	$(".tx_phone").keyup(function() {
	      var phone = $(this).val();
	      
	      if(phone.length == 11) {
	         $('#phoneCheck').html("");
	         $(".bt_certify").attr("disabled", false);
	         $('#userPhone1').addClass('is-valid');
	      	 $('#userPhone1').removeClass('is-invalid');
	      } else {
	    	  $(".bt_certify").attr("disabled", true);
	    	  $('#userPhone1').addClass('is-invalid');
	          $('#userPhone1').removeClass('is-valid');
	      }
	   });
	
	$("#infocl").addClass('listcolor');
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
</div>
</div>
<div style="float: left; width: 80%; height: 550px; overflow: auto;">
	<label class="btn-primary btn-lg btn-block lb_title">내 정 보 보 기</label>
<form name="myInfoForm" method="post" action="updateMyInfo.do">
	<div style="margin-top:30px; margin-left: 20%; overflow: auto; width:580px;">	
		<div class="form-group">
			<label class="col-form-label" for="userId">아이디</label>
			<input class="form-control" type="text" name="userId" id="userId" readonly="readonly" value="${sessionScope.userId}">
		</div>
		<div class="form-group">
			<label class="col-form-label" for="userNickname">닉네임</label>
			<input class="tx_userNickname attr_readonly form-control" type="text" name="userNickname"
			readonly="readonly" value="${usersDto.userNickname}" id="userNickname">
			<div id="userNicknameCheck"></div>
		</div>
		<div class="form-group">
			<label class="col-form-label" for="userName">이름</label>
			<input class="tx_userName attr_readonly form-control" type="text" name="userName" required maxlength="10"
			maxlength="10" readonly="readonly" value="${usersDto.userName}" id="userName">
			<div id="userNameCheck"></div>
		</div>
		<div class="form-group">
			<div>
				<label class="col-form-label" for="userPhone1">휴대폰 번호</label>
			</div>
			<div style="float:left;">
				<input class="tx_phone attr_readonly form-control" type="text" placeholder="'-'를 제외하고 입력" pattern="[0-9]{11}"
				name="userPhone1" id="userPhone1" required maxlength="11" readonly="readonly"
				value="${usersDto.userPhone1}" style="width: 460px;">
			</div>
			<div style="float:left;">	
				<input class="bt_certify attr_disabled btn btn-primary" type="button" value="본 인 인 증" style="width: 120px; font-size: 12px; font-weight: 600; float:left;" disabled="disabled">
			</div>
			<div id="phoneCheck" style="clear: both;"></div>
		</div>
		<div class="form-group">
			<div>
				<label class="col-form-label" for="userPhone2">비상연락처</label>
				<input class="attr_readonly form-control" type="text" name="userPhone2" value="${usersDto.userPhone2}" readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<div>
				<label class="col-form-label" for="userField">관심분야</label>
			</div>
			<div>
				<input class="cb_userField attr_disabled form-check-input" type="checkbox" id="userField1" multiple disabled="disabled"
				name="userField" value="배너광고" <c:if test="${fn:contains(usersDto.userField, '배너광고')}">checked="checked"</c:if> /> 
		        <label for="userField1">배너광고</label>
	            <input class="cb_userField attr_disabled form-check-input" type="checkbox" id="userField2" multiple disabled="disabled"
	            name="userField" value="팝업광고" <c:if test="${fn:contains(usersDto.userField, '팝업광고')}">checked="checked"</c:if> /> 
	            <label for="userField2">팝업광고</label>
	            <input class="cb_userField attr_disabled form-check-input" type="checkbox" id="userField3" multiple disabled="disabled"
	            name="userField" value="동영상광고" <c:if test="${fn:contains(usersDto.userField, '동영상광고')}">checked="checked"</c:if> />
	            <label for="userField3">동영상광고</label>
	            <input class="cb_userField attr_disabled form-check-input" type="checkbox" id="userField4" multiple disabled="disabled"
	            name="userField" value="지면광고" <c:if test="${fn:contains(usersDto.userField, '지면광고')}">checked="checked"</c:if> />
	            <label for="userField4">지면광고</label>
	            <input class="cb_userField attr_disabled form-check-input" type="checkbox" id="userField5" multiple disabled="disabled"
	            name="userField" value="브랜드명" <c:if test="${fn:contains(usersDto.userField, '브랜드명')}">checked="checked"</c:if> />
	            <label for="userField5">브랜드명</label>
	            <input class="cb_userField attr_disabled form-check-input" type="checkbox" id="userField6" multiple disabled="disabled"
	            name="userField" value="제품명" <c:if test="${fn:contains(usersDto.userField, '제품명')}">checked="checked"</c:if> />
	            <label for="userField6">제품명</label>
	            <input class="cb_userField attr_disabled form-check-input" type="checkbox" id="userField7" multiple disabled="disabled"
	            name="userField" value="기타광고" <c:if test="${fn:contains(usersDto.userField, '기타광고')}">checked="checked"</c:if> />
	            <label for="userField7">기타광고</label>
			</div>
		</div>
		<div class="form-group">
			<input class="attr_disabled form-check-input" type="checkbox" name="userGetmail" id="userGetmail" disabled="disabled" value="Y"
			<c:if test="${usersDto.userGetmail eq 'Y'}">checked="checked"</c:if> />
			<label class="col-form-label" for="userGetmail">이메일 정보제공 동의(선택)</label>
		</div>
		<div class="form-group">
			<input class="attr_disabled form-check-input" type="checkbox" name="userGetsms" id="userGetsms" disabled="disabled" value="Y"
			<c:if test="${usersDto.userGetsms eq 'Y'}">checked="checked"</c:if> />
			<label class="col-form-label" for="userGetsms">SMS 정보제공 동의(선택)</label>
		</div>
		<div class="form-group" style="margin-left: 78%;">
			<input class="btn btn-primary" id="bt_update" style="width: 120px; line-height: 16px; font-size: 12px; font-weight: 600; float:left; margin: 10px 5px auto;" type="button" value="수 정 하 기" align="right">
			<input class="btn btn-primary" id="bt_complete" style="width: 120px; line-height: 16px; font-size: 12px; font-weight: 600; float:left; margin: 10px 5px auto; display: none;" type="button" value="변 경 완 료" align="right">
			<br><br>
		</div>
	</div>
</form>
</div>
</body>
</html>