<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out-frog : 우물 밖 개구리</title>
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<link type="text/css" rel="stylesheet" href="resources/css/view.css">
<style type="text/css">
	.frame {
		width: 100%;
		height: 200px;
		overflow: hidden;
	}
	
	#video {
		width: 100%;
	}

	.middle-font {
		position: absolute; 
		width: 749px; 
		line-height: 150px; 
		background: rgba(0,0,0,0); 
		vertical-align: middle;
	}
	
	.middle-button {
		position: absolute; 
		width: 749px; 
		line-height: 300px; 
		background: rgba(0,0,0,0); 
		text-align: center;
	}
	
	.left {
		float: left;
	}

	.work {
		position: relative;
		width: 200px;
		height: 200px;
		margin: 10px 10px auto;
	}
	
	.title {
		position: absolute;
		bottom: 0px;
		left: 0px;
		color: #FFF;
		background: rgba(0, 0, 0, 0.5);
		width: 200px;
		height: 60px;
		padding: 5px 0;
	}
	
	.center {
		text-align: center;
	}
	
	.scroll {
		width: 100%;
		height: 250px;
		white-space: nowrap;
		overflow-x: scroll;
		overflow-y: hidden;
		position: static;
		display: flex;
	}
	
	.imgTitle {
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
		width: 150px;
		margin: 0 25px auto;
	}
	
	.imgContent {
		margin: 5px auto;
	}
	
	.lb_title {
		margin-top: 30px;
		width: 100%;
		height: 30px;
		color: white;
		background-color: #D33530;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
function contestFieldView(contestNum) {
	var input = document.createElement("input");
	input.setAttribute("type", "hidden");
	input.setAttribute("name", "contestNum");
	input.setAttribute("value", contestNum);
	document.contestFieldForm.appendChild(input);
	document.contestFieldForm.action = "workListView.do";
	document.contestFieldForm.submit();
}

function contestBookmarkView(contestNum) {
	var input = document.createElement("input");
	input.setAttribute("type", "hidden");
	input.setAttribute("name", "contestNum");
	input.setAttribute("value", contestNum);
	document.contestBookmarkForm.appendChild(input);
	document.contestBookmarkForm.action = "workListView.do";
	document.contestBookmarkForm.submit();
}

function contestVoteView(contestNum, workNum) {
	var input = document.createElement("input");
	input.setAttribute("type", "hidden");
	input.setAttribute("name", "contestNum");
	input.setAttribute("value", contestNum);
	document.contestVoteForm.appendChild(input);
	var input2 = document.createElement("input");
	input2.setAttribute("type", "hidden");
	input2.setAttribute("name", "workNum");
	input2.setAttribute("value", workNum);
	document.contestVoteForm.appendChild(input2);
	document.contestVoteForm.action = "workView.do";
	document.contestVoteForm.submit();
}
</script>
</head>
<body>
<div>
	<jsp:include page="header.jsp" flush = "false"/>
</div>
<div style="margin: 0 300px;">

	<form name="contestFieldForm" method="post">
		<label class="btn lb_title" style="text-align: left; font-size: medium; font-weight: bolder;">내가 등록한 작품</label>
		<c:if test="${fieldList ne null}">
			<div class="scroll">
				<c:set var="idx" value="0" />
				<c:forEach var="idx" items="${fieldList}">
				<div class="work center contest" style="flex-flow: row;">
					<img class="img_contest" alt="공모" src="${pageContext.request.contextPath}/resources/upload/${idx.contestFile}"
					 onclick="contestFieldView(${idx.contestNum})">
					<div class="title" onclick="location.href='workListView.do?contestNum=${idx.contestNum}'">
						<h5 class="imgTitle">${idx.contestTitle}</h5>
						<p class="imgContent">${idx.dueDate} &emsp;|&emsp; ★ : ${idx.bookmarkCount}</p>
					</div>
				</div>
				</c:forEach>
			</div>
		</c:if>
		<c:if test="${fieldList eq null}">
			<div class="frame">
				<div class="left">
					<video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
				      <source src="resources/movie/interest.mp4">
					</video>
				</div>
				<div class="middle-font">
					<marquee direction="left"><h3><b style="color: white;">등록한 작품이 없습니다! '${userNickname }'님을 위한 추천 공모를 보러가세요~</b></h3></marquee>
				</div>
				<div class="middle-button">
					<input class="btn btn-primary bt_login" type="button" style="font-size: 100%" value="추천 공모 보러가기" 
					   			onclick="location.href='topContestList.do'">
				</div>
			</div>
		</c:if>
	</form>
	
	<form name="contestBookmarkForm" method="post" >
		<label class="btn lb_title" style="text-align: left; font-size: medium; font-weight: bolder;">내 즐겨찾기 공모</label>
		<c:if test="${bookmarkList ne null}">
			<div class="scroll">
				<c:set var="idx" value="0" />
				<c:forEach var="idx" items="${bookmarkList}">
					<div class="work center contest" style="flex-flow: row;">
						<img class="img_contest" alt="공모" src="${pageContext.request.contextPath}/resources/upload/${idx.contestFile}"
						onclick="contestBookmarkView(${idx.contestNum})">	
						<div class="title" onclick="location.href='workListView.do?contestNum=${idx.contestNum}'">
							<h5 class="imgTitle">${idx.contestTitle}</h5>
							<p class="imgContent">${idx.dueDate} &emsp;|&emsp; ★ : ${idx.bookmarkCount}</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
		<c:if test="${bookmarkList eq null}">
			<div class="frame">
				<div class="left">
					<video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
				      <source src="resources/movie/bookmark.mp4">
					</video>
				</div>
				<div class="middle-font">
					<marquee direction="left"><h3><b>즐겨찾기한 공모가 없습니다! TOP 공모들을 만나보세요~</b></h3></marquee>
				</div>
				<div class="middle-button">
					<input class="btn btn-primary bt_login" type="button" style="font-size: 100%" value="Hot한 공모 보러가기" 
					   			onclick="location.href='topContestList.do'">
				</div>
			</div>
		</c:if>
	</form>
		
	<c:if test="${voteList ne null}">
		<form name="contestVoteForm" method="post">
		<label class="btn lb_title" style="text-align: left; font-size: medium; font-weight: bolder;">내가 투표한 작품</label>
		<div class="scroll">
			<c:set var="idx" value="0" />
			<c:forEach var="idx" items="${voteList}">
				<div class="work center contest" style="flex-flow: row;">
					<img class="img_contest" alt="공모" src="${pageContext.request.contextPath}/resources/upload/${idx.workPicture}"
						onclick="contestVoteView(${idx.contestNum}, ${idx.workNum})">	
					<div class="title" onclick="location.href='workView.do?contestNum=${idx.contestNum}&workNum=${idx.workNum}'">
						<h5 class="imgTitle">${idx.workTitle}</h5>
						<p class="imgContent">up : ${idx.voteCount} &emsp;|&emsp; Report : ${idx.reportCount}</p>
					</div>
				</div>
			</c:forEach>
		</div>	
		</form>
	</c:if>
	<br>

	<%-- <div>
		<img alt="내가 최근에 검색한 공모" width="300px" height="50px" src="${pageContext.request.contextPath}/resources/image/lb_recent.png">
	</div>
	<div class="scroll">
		<div class="contest">
			<div>
				<img class="img_contest" alt="공모" src="${pageContext.request.contextPath}/resources/image/img_contest.png">	
			</div>
			<div>
				[공모1: 첫번째 공모입니다.]
			</div>
			<div>
				2000-01-01 ★:1 Report:0
			</div>
		</div>
		<div class="contest">
			<div>
				<img class="img_contest" alt="공모" src="${pageContext.request.contextPath}/resources/image/img_contest.png">	
			</div>
			<div>
				[공모2: 두번째 공모입니다.]
			</div>
			<div>
				2000-01-01 ★:1 Report:0
			</div>
		</div>
		<div class="contest">
			<div>
				<img class="img_contest" alt="공모" src="${pageContext.request.contextPath}/resources/image/img_contest.png">	
			</div>
			<div>
				[공모3: 세번째 공모입니다.]
			</div>
			<div>
				2000-01-01 ★:1 Report:0
			</div>
		</div>
		<div class="contest">
			<div>
				<img class="img_contest" alt="공모" src="${pageContext.request.contextPath}/resources/image/img_contest.png">	
			</div>
			<div>
				[공모4: 네번째 공모입니다.]
			</div>
			<div>
				2000-01-01 ★:1 Report:0
			</div>
		</div>
		<div class="contest">
			<div>
				<img class="img_contest" alt="공모" src="${pageContext.request.contextPath}/resources/image/img_contest.png">	
			</div>
			<div>
				[공모5: 다섯번째 공모입니다.]
			</div>
			<div>
				2000-01-01 ★:1 Report:0
			</div>
		</div>
		<div class="contest">
			<div>
				<img class="img_contest" alt="공모" src="${pageContext.request.contextPath}/resources/image/img_contest.png">	
			</div>
			<div>
				[공모6: 여섯번째 공모입니다.]
			</div>
			<div>
				2000-01-01 ★:1 Report:0
			</div>
		</div>
	</div> --%>
</div>
</body>
</html>