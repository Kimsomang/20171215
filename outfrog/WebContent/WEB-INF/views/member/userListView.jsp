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
<style type="text/css">
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

.spacing {
	margin: 10px;
}

.spacing_left {
	margin-left: 30px;
}
</style>

<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
var a = 0;

function checkPassword(userPw){
   $.ajax({
      type : 'POST',
      data:"userPw="+userPw,
      dataType : 'text',
      async : false,
      url : 'pwCheck.do',
      success : function(rData) {
            var checkNum = rData;
            if(checkNum == 0) {
            	alert("비밀번호가 일치하지 않습니다.");
            	a = 0;
            } else {
            	a = 1;
            }
      },
      error : function(xhr, status, e) {  
          alert(e);
          a = 0;
      }
   });
}

function updateGrade(userId, grade){
	$.ajax({
		type: 'POST',
		data: {
			'userId[]': userId,
			'userGrade': grade
		},
		dataType: 'text',
		url: 'updateUserGrade.do',
		success: function(rData, textStatus, xhr) {
			var updateNum = rData;
			if(updateNum == 0) {
				alert('오류가 발생했습니다. 잠시후 다시 시도해주세요.')
			} else {
			alert(updateNum+'명의 회원의 등급이 변경되었습니다.');
			window.location.reload();
			}
		},
		error: function(xhr, status, e) {
			alert('오류가 발생했습니다. 잠시후 다시 시도해주세요.');
		}
	});
}
$(document).ready(function() {
	a = 0;
	$(".cb_checkAll").click(function() {
		if($('.cb_checkAll:checked').length == 0) {
			$('.cb_user').prop('checked', false);
		} else {
			$('.cb_user').prop('checked', true);
		}
	});
	
	$("#sb_category").change(function() {
		var category = $(this).val();
	});
	
	$('#bt_updateGrade').click(function() {
		var userId = [];
		$('.cb_user:checked').each(function() {
			userId.push($(this).val());
		});
		if(userId.length == 0){
			alert('등급을 변경하고자 하는 회원을 선택해주세요.');
			return;
		}
		do{
			var grade = prompt("해당 회원의 변경하고자 하는 등급을 입력하세요.(X/G/S/A)");
		} while(!(grade == 'X' || grade == 'G' || grade == 'S' || grade == 'A' || grade == null));
		if(grade != null) {
			if(grade == 'A') {
				var check = prompt("관리자 권한 부여를 위해 비밀번호를 다시 입력해주세요.");
				checkPassword(check);
				if(a == 0) {
					return;
				}
			}
			$.ajaxSettings.traditional = true;
			updateGrade(userId, grade);
		}
	});
});

function search() {
	var selected = document.getElementById("sb_category").value;
	if(selected=="---선택---") {
		alert("옵션을 선택하신 후 검색하세요.");
		return false;
	}
	else if(selected=="아이디검색") {
		document.userListViewForm.action = "userIdListView.do";
		return true;
	}
	else if(selected=="회원등급검색") {
		document.userListViewForm.action = "userGradeListView.do";
		return true;
	}
}
</script>
</head>
<body>
<div>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
</div>
<div>
	<jsp:include page="/WEB-INF/views/member/adminSideBar.jsp"/>
</div>
<Form name="userListViewForm" method="post">
<div style="background-color: #EAF1FB; width:100%; padding: 10px auto; position: relative;">
	<div style="width: 850px; background-color: white; position: absolute; top:0; left:0; bottom:0; right:0; margin: auto;">
		<div class="clear left spacing spacing_left center">
			<div class="left">
				<select class="form-control" id="sb_category" name="searchCategory">
					<option>---선택---</option>
					<option>아이디검색</option>
					<option>회원등급검색</option>
				</select>
			</div>
			<div class="left">
				<input class="form-control" style="width: 500px;" type="text" name="searchText">
			</div>
			<div class="left">
				<input class="btn btn-primary" type="submit" name="searchButton" value="검색" onclick="return search();">
			</div>
		</div>
		<div class="contestTable table table-striped table-hover table-bordered tmp_table clear">
			<table>
				<thead class="thead-dark center">
					<tr>
						<th>
							<input type="checkbox" class="cb_checkAll">
						</th>
						<th style="width: 150px;">아이디</th>
						<th style="width: 100px;">닉네임</th>
						<th style="width: 120px;">연락처</th>
						<th style="width: 85px;">회원등급</th>
						<th style="width: 70px;">투표수</th>
						<th style="width: 70px;">신고수</th>
						<th style="width: 70px;">작품수</th>
						<th style="width: 85px;">작성글수</th>
						<th style="width: 70px;">댓글수</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="idx" value="0" />
					<c:forEach var="idx" items="${userList}">
						<tr>
							<th>
								<input class="cb_user" type="checkbox" name="usersId" value="${idx.userId}" multiple="multiple">
							</th>
							<th id="userId">${idx.userId}</th>
							<th>${idx.userNickname}</th>
							<th>${idx.userPhone1}</th>
							<th>${idx.userGrade}</th>
						<c:set var="i" value="0" />
						<c:forEach var="i" items="${countList}">
						<c:if test="${idx.userId eq i.countId}">
							<th>${i.voteCount}</th>
							<th>${i.reportCount}</th>
							<th>${i.workCount}</th>
							<th>${i.boardCount}</th>
							<th>${i.replyCount}</th>
						</c:if>
						</c:forEach>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			<div class="clear" style="text-align: right;">
				<input class="btn btn-primary" id="bt_updateGrade" type="button" name="updateGrade" value="등급변경">
			</div>
		</div>
	</div>
</Form>
</body>
</html>