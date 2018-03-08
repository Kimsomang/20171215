<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.lb_title {
	height: 40px;
	color: white;
	font-weight: bold;
	background-color: #D33530;
	margin-top: 30px;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#contactUscl").addClass('listcolor');
	$('#bt_contest').click(function(){
		alert("이용약관에 대한 불이익은 책임지지 않습니다.")
	});
	
	
});
</script>
<meta charset="UTF-8">
<title>Contact Us</title>
<link rel="stylesheet" type="text/css" href="resources/css/company.css">
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap/bootstrap.bundle.js"></script>
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
	<label class="btn-primary btn-lg btn-block lb_title">의 뢰 하 기</label>
<div style=" float:left;">
	<div class="form-group" style="margin-left: 20%; width:700px;">
	<label for="terms" class="col-form-label" style="font-size: 15px; font-weight: bold;">이용약관</label>
	<br>
	<textarea rows="100" cols="100" id="terms" style="height: 300px; width:90%; resize:none; overflow:auto; overflow-y:scroll; overflow-x:hidden;" readonly>이용약관
제1조 (목적)
본 약관은 우물밖개구리(이하 "회사"라 합니다)가 제공하는 우물밖개구리 및 우물밖개구리 관련 제반 서비스(이하 "서비스"라 합니다)의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.

제2조 (회원의 정의)
① 회원이란 회사가 제공하는 서비스에 접속하여 본 약관에 따라 회사의 이용절차에 동의하고 회사가 제공하는 서비스를 이용하는 이용자를 말합니다.

제3조 (회원 가입)
① 회원이 되고자 하는 자는 회사가 정한 가입 양식에 따라 회원정보를 기입하고 "동의", "확인" 등의 버튼을 누르는 방법으로 회원 가입을 신청합니다.
② 회사는 제1항과 같이 회원으로 가입할 것을 신청한 자가 다음 각 호에 해당하지 않는 한 신청한 자를 회원으로 등록합니다.
     1. 등록 내용에 허위, 기재누락, 오기가 있는 경우
     2. 제6조 제2항에 해당하는 회원 자격 제한 및 정지, 상실을 한 경험이 있었던 경우
     3. 기타 회원으로 등록하는 것이 회사의 서비스 운영 및 기술상 현저히 지장이 있다고 판단되는 경우
③ 회원가입계약의 성립시기는 회사의 승낙이 가입신청자에게 도달한 시점으로 합니다.
④ 회원은 제1항의 회원정보 기재 내용에 변경이 발생한 경우, 즉시 변경사항을 정정하여 기재하여야 합니다.

제4조 (서비스의 제공 및 변경)
① 회사는 회원에게 아래와 같은 서비스를 제공합니다.
     1. 커뮤니티 서비스 (게시판, 채팅 등)
     2. 검색 서비스
     3. 기타 회사가 자체 개발하거나 다른 회사와의 협력계약 등을 통해 회원들에게 제공할 일체의 서비스
② 회사는 서비스의 내용 및 제공일자를 제7조 제2항에서 정한 방법으로 회원에게 통지하고, 제1항에 정한 서비스를 변경하여 제공할 수 있습니다.

제5조 (서비스의 중단)
① 회사는 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있고, 새로운 서비스로의 교체, 기타 회사가 적절하다고 판단하는 사유에 기하여 현재 제공되는 서비스를 완전히 중단할 수 있습니다.
② 제1항에 의한 서비스 중단의 경우에 회사는 제7조 제2항에서 정한 방법으로 회원에게 통지합니다. 다만, 회사가 통제할 수 없는 사유로 인한 서비스의 중단(시스템 관리자의 고의, 과실이 없는 디스크 장애, 시스템 다운 등)으로 인하여 사전 통지가 불가능한 경우에는 그러하지 아니합니다.

제6조 (회원 탈퇴 및 자격 상실 등)
① 회원은 회사에 언제든지 자신의 회원 등록 말소(회원 탈퇴)를 요청할 수 있으며 회사는 위 요청을 받은 즉시 해당 회원의 회원 등록 말소를 위한 절차를 밟습니다.
② 탈퇴할 경우, 커뮤니티 서비스, 기타 공용 게시판 등에 등록된 게시물은 자동 삭제되지 않습니다.
③ 회원이 다음 각 호의 사유에 해당하는 경우, 회사는 회원의 회원자격을 적절한 방법으로 제한 및 정지, 상실시킬 수 있습니다.
     1. 가입 신청 시에 허위 내용을 등록한 경우
     2. 다른 사람의 서비스 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우
     3. 서비스를 이용하여 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
④ 회사가 회원의 회원자격을 상실시키기로 결정한 경우에는 회원등록을 말소합니다.
⑤ 이용자가 본 약관에 의해서 회원 가입 후 서비스를 이용하는 도중, 연속하여 1년 동안 서비스를 이용하기 위해 로그인 기록이 없는 경우, 회사는 회원의 회원자격을 상실시킬 수 있습니다.

제7조 (회원에 대한 통지)
① 회사가 특정 회원에게 서비스에 관한 통지를 하는 경우 회원정보에 등록된 메일주소를 사용할 수 있습니다.
② 회사가 불특정다수 회원에 대한 통지를 하는 경우 7일 이상 공지사항 게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다.

제8조 (회원의 개인정보)
회사는 서비스를 제공하기 위하여 관련 법령의 규정에 따라 회원으로부터 필요한 개인정보를 수집합니다. (개인정보에 대한 개별 항목은 개인정보취급방침에서 고지)
	</textarea>
	</div>
	<br>
	<div class="form-group" style="margin-left: 20%; width: 700px;">
	<label for="personal" class="col-form-label" style="font-size: 15px; font-weight: bold;">개인정보 수집</label>
	<br>
	<textarea rows="100" cols="100" id="personal" style="height: 300px; width:90%; resize:none; overflow:auto; overflow-y:scroll; overflow-x:hidden" readonly>이용약관
우물밖개구리 개인정보 취급방침
정보통신망 이용촉진 등에 관한 법률 등 관련 법률에 의한 개인정보 보호규정 및 정보통신부가 제정한 개인정보지침을 준수하고 있습니다.

1. 개인정보의 수집 항목
원활한 서비스 이용과 고객과의 소통을 위해 수집합니다.
• 필수항목: 아이디, 비밀번호, 이메일, 닉네임
• 자동수집항목: IP 주소, 접속 기록, 쿠키 등

2. 개인정보 보유 및 이용기간
- 가입 회원정보는 탈퇴할 시 5년간 보관 후 파기됩니다.
- 단, 게시물 및 댓글의 내용은 사이트 폐쇄 시까지 보관합니다.
- 악성 사용자 재가입을 막기 위해, 단일 암호화 기법으로 해쉬 방식으로 일부 개인정보를 해쉬를 영구적으로 저장하여 가입 제한을 할 수 있다.

3. 개인정보의 수집 이용 목적
• 아이디, 비밀번호, 이메일, 닉네임 : 회원 가입시에 사용자확인, 중복가입 방지, 부정 이용 방지를 위한 목적으로 사용합니다.
• 이용자의 IP 주소, 접속 기록 등: 불량회원의 부정 이용방지와 비인가 사용방지, 통계학적 분석에 사용합니다.
	</textarea>
	</div>
	<br>
	<div class="form-group" style="margin-left: 20%; width:700px;">
		<div class="card border-light mb-3" style="width: 90%">
			<div class="card-body">
				<h5 class="card-title" style="text-align: center; font-weight: bold;">우물 밖 개구리 홈페이지를 방문해주셔서 감사합니다.</h5>
				<br>
				<p class="card-text" style="padding-left: 15%;">이메일 : outfrog@naver.com</p>
				<p class="card-text" style="padding-left: 15%;">연락처 : 02-3780-2114</p>
				<p class="card-text" style="padding-left: 15%;">주&emsp;소 : 서울특별시 금천구 가산디지털1로 149 2층 6강의실</p>
				<br>
				<div style="text-align: center;">
					<input type="button" id="bt_contest" class="btn btn-primary" style="width: 300px; font-weight: bold; font-size: 13px;"
					value="의 뢰 하 기" onclick="self.location='contract.do';">
				</div>
			</div>
		</div>
	</div>
	<br><br>
</div>
</div>
</body>
</html>