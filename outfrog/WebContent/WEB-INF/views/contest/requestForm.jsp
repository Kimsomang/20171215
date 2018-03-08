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
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="resources/css/company.css?ver=2">
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
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="resources/js/datepicker-ko.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#contestContents').on('keyup', function() {
        if($(this).val().length > 500) {
            $(this).val($(this).val().substring(0, 500));
        }
    });
    $("#contestFile").on("change", handleImgFileSelect);
    
    $('#contestField').click(function() {
    	if($(this).val() == '기타광고') {
 	   		$('#inputField').css({'display': 'inline-block'});
    	} else {
    		$('#inputField').css({'display':'none'});
    	}
    });
});

$(function(){
    $("#dueDate").datepicker({ minDate: 0, dateFormat: "yy년mm월dd일"});
});

function handleImgFileSelect(e) {
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            document.getElementById("contestFile").value="";
            return;
        }

        sel_file = f;

        var reader = new FileReader();
        reader.onload = function(e) {
            $("#img").attr("src", e.target.result);
        }
        reader.readAsDataURL(f);
    });
}
	var count = 1; 
	function plus() {
		
		if(count<5) {
			count++;
			document.getElementById("plusInner"+count).innerHTML="<select id='contestBenefit"+count+"' name='contestBenefit"+count+"' onchange='return selectBene()' style='width: 100px; margin-left: 35px; margin-top:10px; float:left; clear:both;' required><option  value='none' selected disabled='disabled' selected>--선택--</option><option value='대상'>대상</option>"
			+"<option value='최우수상'>최우수상</option><option value='우수상'>우수상</option><option value='장려상'>장려상</option><option value='입상'>입상</option></select> <input type='number' class='form-control' id='contestBenefitNum"+count+"' name='contestBenefitNum"+count+"' style='width: 100px; height: 35px; margin-top:10px; float: left;' placeholder='수상 인원' required><span style='float: left; line-height: 35px; margin-top:10px; margin-left: 3px;'>명</span> <input type='number' class='form-control' id='contestBenefitMoney"+count+"' name='contestBenefitMoney"+count+"' style='width: 100px; height: 35px; margin-top:10px; float: left; margin-left: 10px;' placeholder='상금' required>"
			+"<select style='margin-left: 0px; width: 60px; float: left; margin: 0px 10px; margin-top:10px;'><option value='원'>원</option><option value='만원'>만원</option><option value='억원'>억원</option></select>"
		}
		
		return false;
	}
	
	function minus() {
		if(count!=1) {
			document.getElementById("plusInner"+count).innerHTML = "";
			count--;
		}
		return false;
	}
	
	function test(frm) {
		var size = frm.workFile;
		var maxSize  = 10*1024*1024;
	    var fileSize = size.files[0].size;
	    if(fileSize > maxSize)
	    {
	        alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다.");
	        return false;
	    }
		if(document.getElementById("contestFile").value=="") {
			alert("포스터를 첨부해 주세요.");
			document.getElementById("contestFile").focus();
			return false;
		}
		//if(contestForm.contestField.options[contestForm.contestBenefit.selectedIndex].value=="none") {
		if(document.getElementById("contestField").value=="none"){
			alert("공모 분야를 선택해 주세요.")
			document.getElementById("contestField").focus();
			return false;
		}
		for(var i=1; i<6; i++) {
			
			if(document.getElementById("contestBenefit"+i).value=="none") {
				alert("수상명을 선택해 주세요.")
				document.getElementById("contestBenefit"+i).focus();
				return false;
			}
		 }
		
	    
		return true;
	}

function selectBene(){
	for(var i=1;i<6;i++){
	for(var j=1;j<i;j++){
	if(document.getElementById("contestBenefit"+(i)).value!=document.getElementById("contestBenefit"+j).value){
	}else{
		document.getElementById("contestBenefit"+(i)).value="none";
	}
	}
	}
}
	
</script>

</head>
<body>

<div class="header">
	<jsp:include page="/WEB-INF/views/header.jsp" flush = "false"/>
</div>
<form id="contestForm" action="insertRequest.do" method="post" enctype="multipart/form-data">
	<div style="width:60%; margin-left: 20%; margin-top: 30px;">
		<label class="btn-primary btn-lg btn-block lb_title">공 모 의 뢰 서</label>
		<div style="width: 800px;">
			<div class="form-group" style="margin-left: 150px;">
   				<label for="company"> 회사(기관)명</label>
   				<input type="text" class="form-control" value="${usersDto.contestSponsor}" style="width:450px; height:30px" id="contestSponsor" name="contestSponsor" maxlength="20" placeholder="최대 20자리" required>
   			</div>
			<div class="form-group" style="margin-left: 150px;">
			    <label for="type"> 구분</label>
			      <div class="form-check">
			        <label class="form-check-label" style="margin-left: 30px;">
			          <input type="radio" class="form-check-input" name="division" id="division" checked value="기업">기업
			        </label>
			        <label class="form-check-label" style="margin-left: 30px;">
			          <input type="radio" class="form-check-input" name="division" id="division" value="공공기관">공공기관
			        </label>
			     </div>
			</div>
				
				<div class="form-group" style="margin-left: 150px;">
      				<label for="companyNum"> 사업자번호</label>
      				<input type="text" class="form-control" value="${usersDto.groupNum}"  style="width:450px; height:30px" id="groupNum" name="groupNum" maxlength="10" placeholder="10자리를 입력하세요" required>
    			</div>
    			
    			<div class="form-group" style="margin-left: 150px;">
      				<label for="userEmail"> 이메일</label>
      				<input type="text"  class="form-control" value="${usersDto.userEmail}" style="width:450px; height:30px" id="userEmail" name="userEmail" maxlength="30" required>
    			</div>
    			
    			<div class="form-group" style="margin-left: 150px;">
      				<label for="userEmail"> 휴대폰 전화</label>
      				<input type="text"  class="form-control" value="${usersDto.userPhone1}" style="width:450px; height:30px" id="userPhone1" name="userPhone1" maxlength="30" required>
    			</div>
    			
    			<div class="form-group" style="margin-left: 150px;">
      				<label for="userEmail"> 비상연락처</label>
      				<input type="text"  class="form-control" value="${usersDto.userPhone2}" style="width:450px; height:30px" id="userPhone2" name="userPhone2" maxlength="30" required>
    			</div>
    			
    			<div class="form-check" style="margin-left: 150px;">
        			<input class="form-check-input" type="checkbox" name="userGetmail" id="userGetmail" value="Y"
        			<c:if test="${usersDto.userGetmail eq 'Y'}">checked="checked"</c:if> />
					<label class="col-form-label" for="userGetmail">이메일 정보제공 동의</label>
   				</div>
   				<div class="form-check" style="margin-left: 150px;">
        			<input class="form-check-input" type="checkbox" name="userGetsms" id="userGetsms" value="Y"
        			<c:if test="${usersDto.userGetsms eq 'Y'}">checked="checked"</c:if> />
        			<label class="col-form-label" for="userGetsms">SMS 정보제공 동의</label>
   				</div>
   				<br>
   				
   				<div class="form-group" style="margin-left: 150px;">
      				<label for="exampleInputFile">파일 입력</label><br>
      				<input type="file" id="contestFile" name="contestFile">
    			</div>
   				
   				<div class="form-group" style="margin-left: 150px;">
      				<label for="userEmail">제목</label>
      				<input type="text"  class="form-control" style="width:450px; height:30px" id="contestTitle" name="contestTitle" maxlength="30" required>
    			</div>
    			
    			<div class="form-group" style="margin-left: 150px;">
      				<label for="exampleSelect1">분야</label>
      				<select style="margin-left:-1px; width: 450px;" class="form-control" id="contestField"  name="contestField" required>
						<option value="none" selected disabled="disabled">-==-선택-==-</option>
						<option value="none" disabled="disabled">----온라인----</option>
						<option value="배너광고">배너광고</option>
						<option value="팝업광고">팝업광고</option>
						<option value="동영상광고">동영상광고</option>
						<option value="none" disabled="disabled">---오프라인---</option>
						<option value="지면광고">지면광고</option>
						<option value="none" disabled="disabled">----기타----</option>
						<option value="기타광고">기타광고</option>
						<option value="브랜드명">브랜드명</option>
						<option value="제품명">제품명</option>
					</select>
      				<input type="text" class="form-control" style="height:30px; width:450px; display: none; margin-top: 10px;" name="inputField" id="inputField" placeholder="공모 분야를 입력하세요." size="12" />
			    </div>
    			
    			<div class="form-group" style="margin-left: 150px;">
      				<label for="userEmail">마감일</label>
      				<input type="text" class="form-control" style="height:30px; width:450px" name="dueDate" id="dueDate" size="12" required readonly/>
    			</div>
    			
    			<div class="form-group" style="margin-left: 150px;">
			      	<label for="requestTextArea">내용(500자 제한)</label>
			      	<textarea class="form-control" id="contestContents" name="contestContents" rows="5" style="width: 450px; resize: none; overflow: auto;"></textarea>
			    </div>
			    
			    <div class="form-group" style="margin-left: 150px;">
      				<label for="prize">수상 혜택</label><br>
      				<select id="contestBenefit1" name="contestBenefit1" onchange="return selectBene();" style="width: 100px; margin-left: 5px; float:left;" required="required">
						<option value="none" selected disabled="disabled">--선택--</option>
						<option value="대상">대상</option>
						<option value="최우수상">최우수상</option>
						<option value="우수상">우수상</option>
						<option value="장려상">장려상</option>
						<option value="입상">입상</option>
					</select>
				
					<input type="number" class="form-control" id="contestBenefitNum1" name="contestBenefitNum1" style="width: 100px; height: 35px; float: left;" placeholder="수상 인원" required>
					<span style="float: left; line-height: 35px; margin-left: 3px;">명</span>
					<input type="number" class="form-control" id="contestBenefitMoney1" name="contestBenefitMoney1" style="width: 100px; height: 35px; float: left; margin-left: 10px;" placeholder="상금" required>
					<select style="margin-left: 0px; width: 60px; float: left; margin: 0px 10px;">
						<option value="원">원</option>
						<option value="만원">만원</option>
						<option value="억원">억원</option>
					</select>
					
      				<input type="image" style="width:20px; height:20px; float:left;" src="resources/image/plus.png" onclick="return plus()">
      				<input type="image" style="width:20px; height:20px; float:left;" src="resources/image/minus.png" onclick="return minus()">
				</div>
				
				<div style="margin-left:120px; margin-top:10px;" class="form-group" id="plusInner2"></div>
				<div style="margin-left:120px; margin-top:10px;" class="form-group" id="plusInner3"></div>
				<div style="margin-left:120px; margin-top:10px;" class="form-group" id="plusInner4"></div>
				<div style="margin-left:120px; margin-top:10px;" class="form-group" id="plusInner5"></div>
    			
   				 <div class="form-group" style="margin-left: 60%; clear: both;">
					<input type="submit" class="btn btn-primary" value="의뢰요청" onclick="return test(this.form);" style="width: 120px; line-height: 16px; font-size: 12px; font-weight: 600; margin: 10px 10px auto;">
					<br><br><br>
				</div>
	</div>
</div>

</form>
</body>
</html>