<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<script src="resources/js/bootstrap/bootstrap.bundle.js"></script>


<style type="text/css">
	img {
		width: 350px;
		height: 80px;
	}

	select {
		width: 170px; 
		height: 35px; 
		font-size: medium; 
		margin-left:50px; 
		margin-right: 10px; 
		border-radius: 0.25rem;
	}
	
	.bt_request {
		float: right;
		line-height: 14px; 
		margin-top: 10px; 
		margin-right: 10px;
	}

	.logo-bar {
		width: 100%;
		height: 10%;
		background-color: #dfdfdd; 
		margin: auto;
		text-align: center;
	}
	
	.menu-font {
		font-size: 16px;
	}

	.info-font {
		font-size: 14px;
	}

</style>
<script type="text/javascript">

function check() {
	var searchText = document.getElementById("searchContest").value;
	if(searchText.trim().length==0) {
		alert("검색어를 입력하세요.");
		return false;
	}
	if(option!="====검색분류====" && searchText.trim().length!=0) {
		document.searchForm.action="searchContest.do";
		document.searchForm.submit();
	}
}
</script>
<div>
	<div class="logo-bar">
		<img alt="Logo" src="resources/image/logo.png" onmouseover="this.src='resources/image/logo_change.png'"
				onmouseout="this.src='resources/image/logo.png'"
			<c:if test ="${userGrade eq 'G'}">	
				onclick="location.href='userMain.do'"
			</c:if>
			<c:if test ="${userGrade eq 'S'}">	
				onclick="location.href='semiAdminMain.do'"
			</c:if>
			<c:if test ="${userGrade eq 'A'}">	
				onclick="location.href='adminMain.do'"
			</c:if>
		>

		<button class="bt_request btn btn-outline-secondary"
				onclick="location.href='contract.do'">광고 의뢰하러 가기 (공모 등록)</button>
	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary" style="width:100%;">
<div style="width: 100%;">
	<!-- 상단 좌측 메뉴 버튼 -->
	<div class="nav-item dropdown" style="float: left; width: 15%;">
	    <button class="nav-link dropdown-toggle btn btn-secondary" data-toggle="dropdown" 
   				role="button" aria-haspopup="true" aria-expanded="false"
   				style="width: 100%; line-height: 13px; font-size: 13px;">우물 밖으로 나가볼까?&nbsp;&nbsp;</button>
   		<div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; 
   			width: 200px; height: 500px; overflow: auto; 
   			transform: translate3d(0px, 40px, 0px); top: 0px; left: 0px; will-change: transform;">
	      <a class="dropdown-item" href="topContestList.do" style="color: #720D2B;">
	      		<b class="menu-font">Top 10 공모</b></a>
	      <div class="dropdown-divider"></div>
	      <a class="dropdown-item" href="finishedContest.do"><b class="menu-font"
	      	style="color: #720D2B;">마감된 공모</b></a>
		  <div class="dropdown-divider"></div>
	      <a class="dropdown-item" style="line-height: 28px;" href="contestListView.do"><b class="menu-font">현재 진행중인 공모</b></a>
	      <a class="dropdown-item" style="line-height: 24px; font-size: 15px;">--------온 라 인--------</a>
	      <a class="dropdown-item" href="contestFieldView.do?contestField=배너광고" 
	      	style="line-height: 28px; font-size: 14px; font-weight: bold; color: #720D2B;">배너광고</a>
	      <a class="dropdown-item" href="contestFieldView.do?contestField=팝업광고"
	      	style="line-height: 28px; font-size: 14px; font-weight: bold; color: #720D2B;">팝업광고</a>
	      <a class="dropdown-item" href="contestFieldView.do?contestField=동영상광고"
	      	style="line-height: 28px; font-size: 14px; font-weight: bold; color: #720D2B;">동영상광고</a>
	      <a class="dropdown-item" style="line-height: 24px; font-size: 15px;">------오 프 라 인------</a>
	      <a class="dropdown-item" href="contestFieldView.do?contestField=지면광고"
	      	style="line-height: 28px; font-size: 14px; font-weight: bold; color: #720D2B;">지면광고</a>
	      <a class="dropdown-item" href="contestFieldView.do?contestField=브랜드명"
	      	style="line-height: 28px; font-size: 14px; font-weight: bold; color: #720D2B;">브랜드명</a>
	      <a class="dropdown-item" href="contestFieldView.do?contestField=제품명"
	      	style="line-height: 28px; font-size: 14px; font-weight: bold; color: #720D2B;">제품명</a>
	      <a class="dropdown-item" style="line-height: 24px; font-size: 15px;">--------기&emsp;&nbsp;타--------</a>
	      <a class="dropdown-item" href="contestFieldView.do?contestField=기타광고"
	      	style="line-height: 28px; font-size: 14px; font-weight: bold; color: #720D2B;">기타광고</a>
	      <div class="dropdown-divider"></div>
	      <a class="dropdown-item"><b class="menu-font">게 시 판</b></a>
	      <a class="dropdown-item" href="noticeBoard.do"
	      	style="line-height: 28px; font-size: 14px; font-weight: bold; color: #720D2B;">공지게시판</a>
	      <a class="dropdown-item" href="freeBoard.do"
	      	style="line-height: 28px; font-size: 14px; font-weight: bold; color: #720D2B;">자유게시판</a>
	      <div class="dropdown-divider"></div>
	      <a class="dropdown-item"><b class="menu-font">고 객 센 터</b></a>
	      <a class="dropdown-item" href="questionListView.do"
	      	style="line-height: 28px; font-size: 14px; font-weight: bold; color: #720D2B;">1:1질문</a>
	      <a class="dropdown-item" href="askListView.do"
	      	style="line-height: 28px; font-size: 14px; font-weight: bold; color: #720D2B;">자주묻는질문</a>
	    </div>
	</div>
	<!-- //상단 좌측 메뉴 버튼 -->
	
	<form class="my-2 my-lg-0"  name="searchForm" action="searchContest.do">
	<div style="width: 50%; float: left;">
		<div style="float: left; width:70%">
			<input class="form-control mr-sm-2" type="text" name="searchContest" 
					style="margin-left:20%;width: 80%; height: 30px;" id="searchContest" placeholder="검색할 내용을 입력하세요">
		</div>
		<div style="float: left;">
			<button class="bt_search btn btn-secondary my-2 my-sm-0" type="submit" id="bt_search" name="bt_search"
					style="margin-left:30%;line-height: 16px;" onclick="return check();">Search</button>
		</div>
	</div>
    </form>	
    
    <input type="hidden" name="userId" value="${userId}">
    <input type="hidden" name="userGrade" value="${userGrade}">
	<input type="hidden" name="UserSession" value="${UserSession}">
	
	<!-- 상단 우측 메뉴 버튼 -->
	<div style="margin-left: 8%; width: 26%; float: left;">
	
		<div style="float: right;">
			<input class="nav-link btn btn-secondary" type="button" value="Logout" onclick="location.href='logout.do'"
				style="margin-left: 30px; line-height: 13px; font-size: 13px;">
		</div>
		
		<div class="nav-item dropdown" style="float: right;">
			<c:if test ="${userGrade eq 'G'}">
				<button class="nav-link btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown" 
			   				role="button" aria-haspopup="true" aria-expanded="false"
			   				style="width: 220px; line-height: 13px; font-size: 13px;">
			   				<div style="width: 180px; float: left;">'${userNickname} 님'의 공간</div></button>	
				<div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; width: 220px; 
		   			transform: translate3d(0px, 40px, 0px); top: 0px; left: 0px; will-change: transform;">
					<a class="dropdown-item" href="myInfo.do" style="color: #720D2B; line-height: 26px;">
			      		<b class="info-font">내 정보 보기</b></a>
					<div class="dropdown-divider"></div>		
					<a class="dropdown-item" href="myWorkList.do" style="color: #720D2B; line-height: 26px;">
			      		<b class="info-font">내 작품 목록</b></a>
					<div class="dropdown-divider"></div>		
					<a class="dropdown-item" href="contactUs.do" style="color: #720D2B; line-height: 26px;">
			      		<b class="info-font">의뢰하기</b></a>
					<div class="dropdown-divider"></div>		
					<a class="dropdown-item" href="changePw.do" style="color: #720D2B; line-height: 26px;">
			      		<b class="info-font">비밀번호 변경</b></a>
				</div>
			</c:if>
			
			<c:if test="${userGrade eq 'S'}">
				<button class="nav-link btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown" 
			   				role="button" aria-haspopup="true" aria-expanded="false"
			   				style="width: 220px; line-height: 13px; font-size: 13px;">
			   				<div style="width: 180px; float: left;">'${userNickname} 님'의 공간</div></button>	
				<div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; width: 220px; 
		   			transform: translate3d(0px, 40px, 0px); top: 0px; left: 0px; will-change: transform;">
					<a class="dropdown-item" href="myInfo.do" style="color: #720D2B; line-height: 26px;">
			      		<b class="info-font">내 정보 보기</b></a>
			      	<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="contactUs.do" style="color: #720D2B; line-height: 26px;">
			      		<b class="info-font">의뢰하기</b></a>
			      	<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="myContest.do" style="color: #720D2B; line-height: 26px;">
			      		<b class="info-font">내 공모전 목록</b></a>
			      	<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="changePw.do" style="color: #720D2B; line-height: 26px;">
			      		<b class="info-font">비밀번호 변경</b></a>
			      	<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="myCompanyInfo.do" style="color: #720D2B; line-height: 26px;">
			      		<b class="info-font">기업정보 변경</b></a>
			      	<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="withdrawal.do" style="color: #720D2B; line-height: 26px;">
			      		<b class="info-font">회원 탈퇴</b></a>
				</div>
			</c:if>
			
			<c:if test="${userGrade eq 'A'}">
				<button class="nav-link btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown" 
			   				role="button" aria-haspopup="true" aria-expanded="false"
			   				style="width: 220px; line-height: 13px; font-size: 13px;">
			   				<div style="width: 180px; float: left;">'${userNickname} 님'의 공간</div></button>	
				<div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; width: 220px; 
		   			transform: translate3d(0px, 40px, 0px); top: 0px; left: 0px; will-change: transform;">
					<a class="dropdown-item" href="reportBoardList.do" style="color: #720D2B; line-height: 26px;">
			      		<b class="info-font">신고받은 글</b></a>
			      	<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="reportWorkList.do" style="color: #720D2B; line-height: 26px;">
			      		<b class="info-font">신고받은 작품</b></a>
			      	<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="reportReplyList.do" style="color: #720D2B; line-height: 26px;">
			      		<b class="info-font">신고받은 댓글</b></a>
			      	<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="reportAfterList.do" style="color: #720D2B; line-height: 26px;">
			      		<b class="info-font">신고 처리완료 관리</b></a>
			      	<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="requestListView.do" style="color: #720D2B; line-height: 26px;">
			      		<b class="info-font">의뢰받은 요청</b></a>
			      	<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="questionManage.do" style="color: #720D2B; line-height: 26px;">
			      		<b class="info-font">들어온 문의</b></a>
			      	<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="askFormView.do" style="color: #720D2B; line-height: 26px;">
			      		<b class="info-font">자주 묻는 질문 등록</b></a>
			      	<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="userListView.do" style="color: #720D2B; line-height: 26px;">
			      		<b class="info-font">회원 관리</b></a>
			      	<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="changePw.do" style="color: #720D2B; line-height: 26px;">
			      		<b class="info-font">비밀번호 변경</b></a>
				</div>
			</c:if>
		</div>
		<!-- //상단 우측 메뉴 버튼 -->
		
	</div>
</div>
</nav>
