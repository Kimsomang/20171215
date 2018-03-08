<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out-frog : 우물 밖 개구리</title>

<link type="text/css" rel="stylesheet" href="resources/css/view.css">
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">

<style type="text/css">
.frame {
	width: 100%;
}

.content {
	width: 100%;
	height: auto;
}

.left {
	float: left;
}

.clear {
	clear: both;
}

.center {
	margin: 0 auto;
	text-align: center;
}

.spacing_left {
	margin-left: 13%;
}

.spacing {
	margin: 10px;
}

.contest {
	width: 80%;
	height: 20%;
}

.work {
	width: 80%;
	height: 20%;
}

.board {
	width: 80%;
	height: 20%;
}

.customer {
	width: 80%;
	height: 20%;
}

.spacing_top {
	margin-top: 3%;
}

.table_s {
	width: 35%;
	height: 100%;
}

.table_m {
	width: 40%;
	height: 100%;
}

.table_l {
	width: 45%;
	height: 100%;
}

.dash {
	display: inline-block;
	height: 40px;
	padding: 2px;
	margin-left: 1%;
	text-align: left;
	vertical-align: middle;
}

.over {
	overflow: auto;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$(".contestTable").hide();
		$(".reportWorkTable").hide();
		$(".reportBoardTable").hide();
		$(".reportReplyTable").hide();

		$(".bt_contestList").click(function() {
			$(".contestTable").slideToggle();
		});
		
		$(".bt_reportWorkList").click(function() {
			$(".reportWorkTable").slideToggle();
		});
		
		$(".bt_reportBoardList").click(function() {
			$(".reportBoardTable").slideToggle();
		});
		
		$(".bt_reportReplyList").click(function() {
			$(".reportReplyTable").slideToggle();
		});
	});
</script>

</head>
<body>
<div class="frame">
	
	<div class="header">
		<jsp:include page="header.jsp" flush = "false"/>
	</div> <!-- //header -->
	
	<div class="content center left">
		<!-- 의뢰 관련 기능 -->
		<div class="spacing_top contest left spacing_left">
			<div class="dash left">
				<h4>
				  <b>의뢰(Contest) 기능 관련:</b> 
				  <small class="text-muted">의뢰 들어온 공모 / 마감 다가오는 공모</small>
				</h4>
			</div>
			<!-- 의뢰 들어온 공모리스트 보여주는 버튼 -->
			<div class="clear left spacing table_l center">			
				<div>
					<label class="btn btn-primary btn-lg btn-block" 
						style="height: 4%; font-size: 15px; font-weight: 800;">의뢰 들어온 공모</label>
				</div>
				<div class="fix over">
					<table class="table table-striped table-hover table-bordered"
							style="font-size: small;">
						<thead class="thead-dark">
							<tr>
								<th>#</th>
								<th>기업명</th>
								<th>작성자</th>
								<th>공모분야</th>
								<th>공모제목</th>
							</tr>
						</thead>
						<tbody>
						<c:set var="idx" value="0" />
						<c:forEach var="idx" items="${requestList}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${idx.contestSponsor}</td>
								<td>${idx.userId}</td>
								<td>${idx.contestField}</td>
								<td><a href="requestView.do?requestNum=${idx.requestNum}">${idx.contestTitle}</a></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- //의뢰 들어온 공모리스트 -->
			
			<!-- 마감이 다가오는 공모리스트 보여주는 div -->
			<div class="left spacing table_l">
				<div>
					<label class="btn btn-primary btn-lg btn-block" 
						style="height: 4%; font-size: 15px; font-weight: 800;">마감이 다가오는 공모</label>
				</div>
				<div class="fix_m over">
					<table class="table table-striped table-hover table-bordered"
							style="font-size: small;">
						<thead class="thead-dark">
							<tr>
								<th>공모 제목</th>
								<th>의뢰 기업</th>
								<th>마감날짜</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>21세기 브랜드명</td>
								<td>소년기업</td>
								<td>2018-01-01</td>
							</tr>
							<tr>
								<td>차기 제품의 지면광고 공모</td>
								<td>파인애플</td>
								<td>2018-11-11</td>
							</tr>
							<tr>
								<td>8hours 동영상 광고 문의</td>
								<td>8hours</td>
								<td>2018-12-01</td>
							</tr>
							<tr>
								<td>신발의 이름을 정해라~</td>
								<td>삼디다스</td>
								<td>2018-12-01</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- //마감이 다가오는 공모리스트 -->
		</div>
		<!-- //의뢰 관련 기능 -->
			
		<!-- 작품 관련 기능 -->
		<div class="spacing_top work left spacing_left">
			<div class="dash left">
				<h4>
				  <b>작품(Work) 기능 관련:</b> 
				  <small class="text-muted">신고 들어온 작품 / 수상 작품</small>
				</h4>
			</div>	
			<!-- 신고 들어온 작품리스트 보여주는 div -->
			<div class="clear left spacing table_l">
				<div>
					<label class="btn btn-primary btn-lg btn-block" 
						style="height: 4%; font-size: 15px; font-weight: 800;">신고 들어온 작품</label>
				</div>
				<div class="fix over">
					<table class="table table-striped table-hover table-bordered"
							style="font-size: small;">
						<thead class="thead-dark">
							<tr>
								<th>#</th>
								<th>작성자</th>
								<th>작품제목</th>
								<th>신고사유</th>
								<th>신고자</th>
							</tr>
						</thead>
						<tbody>
						<c:set var="idx" value="0" />
						<c:forEach var="idx" items="${reportWorkList}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${idx.writer}</td>
								<td>${idx.title}</td>
								<td>${idx.reportReason}</td>
								<td>${idx.reporter}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- //신고 들어온 작품리스트 -->
		
			<!-- 수상 작품리스트 보여주는 div -->
			<div class="left spacing table_l">
				<div>
					<label class="btn btn-primary btn-lg btn-block" 
						style="height: 4%; font-size: 15px; font-weight: 800;">당선된 작품들</label>
				</div>
				<div class="fix over">
					<table class="table table-striped table-hover table-bordered"
							style="font-size: small;">
						<thead class="thead-dark">
							<tr>
								<th>#</th>
								<th>작성자</th>
								<th>작품제목</th>
								<th>수상내역</th>
								<th>투표수</th>
							</tr>
						</thead>
						<tbody>
						<c:set var="idx" value="0" />
						<c:forEach var="idx" items="${workList}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${idx.userNickname}</td>
								<td>${idx.workTitle}</td>
								<td>${idx.prize}</td>
								<td>${idx.voteCount}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- //수상 작품리스트 -->
		</div>	
		<!-- //작품 관련 기능 -->	
		
		<!-- 게시글 관련 기능 -->	
		<div class="clear spacing_top left board spacing_left">
			<div class="dash left">
				<h4>
				  <b>게시글(Board) 기능 관련:</b> 
				  <small class="text-muted">신고 들어온 게시글 / 신고 들어온 댓글</small>
				</h4>
			</div>
			<!-- 신고 들어온 게시글리스트 보여주는 div -->
			<div class="clear left spacing table_l">
				<div>
					<label class="btn btn-primary btn-lg btn-block" 
						style="height: 4%; font-size: 15px; font-weight: 800;">신고 들어온 게시글</label>
				</div>
				<div class="fix over">
					<table class="table table-striped table-hover table-bordered"
							style="font-size: small;">
						<thead class="thead-dark">
							<tr>
								<th>#</th>
								<th>작성자</th>
								<th>글제목</th>
								<th>신고사유</th>
								<th>신고자</th>
							</tr>
						</thead>
						<tbody>
						<c:set var="idx" value="0" />
						<c:forEach var="idx" items="${reportBoardList}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${idx.writer}</td>
								<td>${idx.title}</td>
								<td>${idx.reportReason}</td>
								<td>${idx.reporter}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- //신고 들어온 게시글리스트 -->
			
			<!-- 신고 들어온 댓글리스트 보여주는 div -->
			<div class="left spacing table_m">
				<div>
					<label class="btn btn-primary btn-lg btn-block" 
						style="height: 4%; font-size: 15px; font-weight: 800;">신고 들어온 댓글</label>
				</div>
				<div class="fix over">
					<table class="table table-striped table-hover table-bordered"
							style="font-size: small;">
						<thead class="thead-dark">
							 <tr>
							 	<th>#</th>
								<th>작성자</th>
								<th>글제목</th>
								<th>신고사유</th>
								<th>신고자</th>
							 </tr>
						</thead>
						<tbody>
						<c:set var="idx" value="0" />
						<c:forEach var="idx" items="${reportReplyList}" varStatus="status" >
							<tr>
								<td>${status.count}</td>
								<td>${idx.writer}</td>
								<td>${idx.title}</td>
								<td>${idx.reportReason}</td>
								<td>${idx.reporter}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- //신고 들어온 게시글리스트 -->
		</div>
		<!-- //게시글 관련 기능 -->
		
		<!-- 고객관리 관련 기능 -->
		<div class="clear left spacing_top customer spacing_left">
			<div class="dash left">
				<h4>
				  <b>고객관리(Customer-center) 기능 관련:</b> 
				  <small class="text-muted">답변 대기중인 1:1 문의 / BAN 사용자</small>
				</h4>
			</div>
			<!-- 1:1문의 답변 대기중 보여주는 div -->
			<div class="clear left spacing table_l">
				<div>
					<label class="btn btn-primary btn-lg btn-block" 
							style="height: 4%; font-size: 15px; font-weight: 800;"
							onclick="location.href='questionManage.do'">1:1 문의 답변 대기중..</label>
				</div>
				<div class="fix_m over">
					<table class="table table-striped table-hover table-bordered"
							style="font-size: small;">
						<thead class="thead-dark">
						  <tr>
						    <th style="width: 40px;">#</th>
						    <th style="width: 130px;">사용자 별명</th>
						    <th style="width: 145px;">문의 제목</th>
						    <th style="width: 100px;">작성 날짜</th>
						  </tr>
						</thead>
						<tbody>
							<c:set var="idx" value="0"/>
							<c:forEach var="idx" items="${questionList}" varStatus="status">
							<tr>				
								<td>${status.count}</td>
								<td>${idx.userNickname}</td>
								<td>
									<a href="questionView.do?questionNum=${idx.questionNum}">${idx.questionTitle}</a>
								</td>
								<td>${idx.writeDate}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- //1:1 답변 대기중 -->
			
			<!-- BAN 사용자리스트 보여주는 div -->
			<div class="left spacing table_s">
				<div>
					<label class="btn btn-primary btn-lg btn-block" 
							style="height: 4%px; font-size: 15px; font-weight: 800;">BAN 사용자 리스트</label>
				</div>
				<div class="fix_s over">
					<table class="table table-striped table-hover table-bordered"
							style="font-size: small;">
						<thead class="thead-dark">
							<tr>
								<th width="130px;">사용자</th>
								<th width="60px;">등급</th>
								<th width="60px;">신고</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>이병철</td>
								<td>S</td>
								<td>11</td>
							</tr>
							<tr>
								<td>힙찔이</td>
								<td>G</td>
								<td>11</td>
							</tr>
							<tr>
								<td>김소망희망</td>
								<td>G</td>
								<td>21</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- //BAN 사용자리스트 -->
		</div>
		<!-- //고객관리 관련 기능 -->
	</div> <!-- //content -->
	
</div> <!-- //frame -->
</body>
</html>