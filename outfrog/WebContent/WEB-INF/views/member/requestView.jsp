<%@page import="com.fivefingers.outfrog.model.dto.Request"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out-frog : 우물 밖 개구리</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/company.css?ver=2">
<script type="text/javascript">
$(document).ready(function() {
    $('#contestContents').on('keyup', function() {
        if($(this).val().length > 500) {
            $(this).val($(this).val().substring(0, 500));
        }
    });
});

function bigImage() {
	 var settings ='toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=750,width=700,left=0,top=0';
	 var obj = window.open("bigImage.do?fileName=${requestView.contestFile}","이미지 확대", settings);
}

function cancled(){
	document.contestForm.action = "deleteRequest.do?requestNum=${requestView.requestNum}";
	document.contestForm.submit();
}
function enrolled(){
	document.contestForm.action = "insertContest.do?requestNum=${requestView.requestNum}";
	document.contestForm.submit();
}

</script>
</head>
<body>
<div>
	<jsp:include page="/WEB-INF/views/header.jsp" flush = "false"/>
</div>
<form name="contestForm"  id="contestForm" action="insertContest.do?requestNum=${requestView.requestNum}" method="post">
	<div style="background-color: #EAF1FB; width:100%; padding: 10px auto; position: relative;">
	<div style="width: 800px; background-color: white; position: absolute; top:0; left:0; bottom:0; right:0; margin: auto;">
	
	<div class="title"><div class="title2" align="center">공모 의뢰 확인</div></div><br>

				<div class="form-group">
      				<label for="userId"> 작성자 아이디</label>
      				<input type="text" class="form-control" value="${requestView.userId}" style="width:400px; height:30px" id="userId" name="userId" maxlength="20" placeholder="최대 20자리" required>
    			</div>

				<div class="form-group">
      				<label for="company"> 회사(기관)명</label>
      				<input type="text" class="form-control" value="${requestView.contestSponsor}" style="width:400px; height:30px" id="contestSponsor" name="contestSponsor" maxlength="20" placeholder="최대 20자리" required>
    			</div>
				
				<div class="form-group">
      				<label for="companyNum"> 사업자번호</label>
      				<input type="text" class="form-control" value="${requestView.groupNum}"  style="width:400px; height:30px" id="groupNum" name="groupNum" maxlength="10" placeholder="10자리를 입력하세요" required>
    			</div>
    			
    			<div class="form-group">
      				<label for="userEmail"> 이메일</label>
      				<input type="text"  class="form-control" value="${usersDto.userEmail}" style="width:400px; height:30px" id="userEmail" name="userEmail" maxlength="30" required>
    			</div>
    			
    			<div class="form-group">
      				<label for="userEmail"> 휴대전화</label>
      				<input type="text"  class="form-control" value="${usersDto.userPhone1}" style="width:400px; height:30px" id="userPhone1" name="userPhone1" maxlength="30" required>
    			</div>
    			
    			<div class="form-group">
      				<label for="userEmail"> 연락처</label>
      				<input type="text"  class="form-control" value="${usersDto.userPhone2}" style="width:400px; height:30px" id="userPhone2" name="userPhone2" maxlength="30" required>
    			</div>
   				<br>
   				<br>
   				
   				
   				<div class="form-group">
      				<label for="exampleInputFile">공모 포스터</label><br>
      				<input type="hidden" value="${requestView.contestFile}" id="contestFile" name="contestFile">
      				<div class="bigImage">
        				<img style="width:300px; height:200px" id="img" onclick="bigImage()" src="${pageContext.request.contextPath}/resources/upload/${requestView.contestFile}"/>
        			</div>
        			<div style="">
						<a href='fileDownload.do?fileName=${requestView.contestFile}'>${requestView.contestFile}</a>
					</div>
    			</div>
   				
   				<div class="form-group">
      				<label for="contestTitle">제목</label>
      				<input type="text"  class="form-control" value="${requestView.contestTitle}" style="width:400px; height:30px" id="contestTitle" name="contestTitle" maxlength="30" required>
    			</div>
    			
    			<div class="form-group">
      				<label for="contestField">분야</label>
      				<input type="text"  class="form-control" value="${requestView.contestField}" style="width:400px; height:30px" id="contestField" name="contestField" maxlength="30" required>
    			</div>
    			
    			<div class="form-group">
      				<label for="userEmail">마감일</label>
      				<input type="text" class="form-control" value="${requestView.dueDate}" style="height:30px; width:400px" name="dueDate" id="dueDate" size="12" required/>
    			</div>
    			
    			<div class="form-group">
			      	<label for="requestTextArea">내용(500자 제한)</label>
			      	<textarea style="resize:none;" class="form-control" id="contestContents" name="contestContents" rows="3">${requestView.contestContents}</textarea>
			    </div>
			    
			   <div class="form-group">
      				<label for="benefit">혜택</label>
      				<input type="text" class="form-control" value="${requestView.contestBenefit}" style="height:30px; width:400px" name="contestBenefit" id="contestBenefit" size="12" required/>
    			</div>
    			
    			<input style="margin-left:80%" type="button" class="btn btn-primary" onClick="javascript:cancled()" value="삭제">
   				<input style="" class="btn btn-primary" type="button" onClick="javascript:enrolled()" value="처리완료">
	</div>
</div>
					
</form>
</body>
</html>