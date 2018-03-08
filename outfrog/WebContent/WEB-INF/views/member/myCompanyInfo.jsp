<%@page import="com.fivefingers.outfrog.model.dto.Users" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>out-frog : 우물 밖 개구리</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#bt_update1').click(function() {
		$('#bt_complete1').css({'display':'inline'});
		$(this).css({'display':'none'});
		$('.attr_readonly').attr("readonly", false);
		$('.attr_disabled').attr("disabled", false);
		$('.bt_certify').css({'display':'inline'});
	});
	
	$('#bt_complete1').click(function() {
		$('#bt_update1').css({'display':'inline'});
		$(this).css({'display':'none'});
		$('.bt_certify').css({'display':'none'});
		document.myCompanyInfoForm.submit();
		$('.attr_readonly').attr("readonly", true);
		$('.attr_disabled').attr("disabled", true);
	});
});
</script>
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css?ver=1">
</head>
<body>

<div class="header">
		<jsp:include page="/WEB-INF/views/header.jsp" flush = "false"/>
	</div>
	<div class="header" >
		<jsp:include page="/WEB-INF/views/member/semiAdminSideBar.jsp" flush = "false"/>
	</div>

<form name="myCompanyInfoForm" method="post" action="updateMyCompanyInfo.do">
<div style="background-color: #EAF1FB; width:50%;margin: auto;float:left;">
	<div style="width: 80%; background-color: #EAF1FB;">

				<div class="form-group">
      				<label for="company"> 회사(기관)명</label>
      				<input type="text" class="form-control attr_readonly" value="${usersDto.contestSponsor}" style="width:100% height:30px" readonly="readonly"  id="contestSponsor" name="contestSponsor" maxlength="30" placeholder="최대 30자리" required>
    			</div>
 
				<div class="form-group">
				      <label for="type"> 구분</label>
				      <div class="form-check">
				        <label class="form-check-label">
				          <input type="radio" class="form-check-input attr_disabled" disabled="disabled"  name="division" id="division" checked value="기업">기업
				        </label>
				        <label class="form-check-label">
				          <input type="radio" class="form-check-input attr_disabled" disabled="disabled"  name="division" id="division" value="공공기관">공공기관
				        </label>
				       </div>
				</div>
				
				<div class="form-group">
      				<label for="companyNum"> 사업자번호</label>
      				<input type="text" class="form-control tx_userEmail attr_readonly" value="${usersDto.groupNum}"  style="width:100% height:30px" readonly="readonly" id="groupNum" name="groupNum" maxlength="10" placeholder="10자리를 입력하세요" required>
    			</div>
    			
    			<div class="form-group">
      				<label for="userEmail"> 이메일</label>
      				<input type="email"  class="form-control tx_userEmail attr_readonly" value="${usersDto.userEmail}" readonly="readonly" style="width:100% height:30px" id="userEmail" name="userEmail" maxlength="30" required>
    			</div>
    			
    			<div class="form-group">
      				<label for="userEmail"> 휴대전화</label>
      				<input type="tel"  class="form-control tx_userPhone1 attr_readonly" readonly="readonly" value="${usersDto.userPhone1}" style="width:100% height:30px" id="userPhone1" name="userPhone1" maxlength="11" required>
    			</div>
    			
    			<div class="form-group">
      				<label for="userEmail"> 연락처</label>
      				<input type="tel"  class="form-control tx_userPhone2 attr_readonly" readonly="readonly" value="${usersDto.userPhone2}" readonly="readonly" style="width:100% height:30px" id="userPhone2" name="userPhone2" maxlength="11" required>
    			</div>
    			
    			<div class="form-check">
      				<label class="form-check-label">
        			<input class="form-check-input attr_disabled" type="checkbox" name="userGetmail" disabled="disabled" value="Y"
			<c:if test="${usersDto.userGetsms eq 'Y'}">checked="checked"</c:if> /> 이메일 정보제공 동의
      				</label>
   				</div>
   				<div class="form-check">
      				<label class="form-check-label">
        			<input class="form-check-input attr_disabled" type="checkbox" name="userGetsms" disabled="disabled" value="Y"
			<c:if test="${usersDto.userGetsms eq 'Y'}">checked="checked"</c:if> /> SMS 정보제공 동의
      				</label>
   				</div>
	</div>
<div align="right" style="width:100%;">
<input id="bt_update1" type="button" value="수정하기" style="align:right">
<input id="bt_complete1" type="button" value="변경완료" style="align:right;display: none">
</div>
</div>
</form>
<div>
	<jsp:include page="/WEB-INF/views/footer.jsp" flush = "false"/>
</div>
</body>
</html>