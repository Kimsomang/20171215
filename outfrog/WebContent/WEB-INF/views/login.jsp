<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="클라이언트ID">
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
<% String message = (String)request.getAttribute("message"); 
	
   String id = (String)request.getAttribute("id"); 
   if(id==null) id = "";
%>

$(document).ready(function() {
        <%if(message!=null) {%>
        	alert('<%=message%>');    
        <%}%>
});

function loginNaver(){
	window.open("loginNaver.do","","width=500px height=400px");
}
makeNaverUrl= function()
{
    $.postSyncJsonAjax("makeNaverUrl.do", "", function(data){
        var popupObj = new Object();
        popupObj.url = data.url;
        popupObj.popupName = "snsNaverLoginPopup"; 
        popupObj.width = "500";
        popupObj.height = "450";
        popupObj.scrollbars = "no";
        
        customPopup(popupObj);         
    });
};

function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	}
</script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<title>out-frog : 우물 밖 개구리</title>

<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">

<style type="text/css">
	.frame {
		width: 1366px;
		height: 800px;
	}

	.lb {
		width: 400px;
		margin: auto;
	}
	
	.lb_title {
		width: 100%; 
		font-size: x-large; 
		font-weight: bold; 
		text-align: left; 
		margin-top: 10px;
	}

	.bt_id {
		width: 400px; 
		height: 40px;
		margin: 10px auto;
	}
	
	.bt_pw {
		width: 400px; 
		height: 40px;
		margin: 10px auto;
	}
	
	.bt_login {
		width: 400px; 
		height: 50px;
		margin: 10px auto;
	}
	
	.bt_center {
		margin-top: 10px;
		margin-bottom: 30px;
	}
	
	.top {
		margin-top: 50px;
	}
	
	.right {
		margin-right: 10px;
	}
	
	.middle {
		margin: auto;
		text-align: center;
	}
	
	.around {
		margin: 10px;
	}
	
	.social {
		width: 400px;
		height: 70px;
		margin: 10px auto;
	}
</style>

</head>
<body>

<div class="frame middle">
	<div class="header">
		<jsp:include page="header3.jsp" flush = "false"/>
	</div> <!-- //header -->
	
	<div class="lb">	
		<label class="btn-primary btn-lg btn-block lb_title top">로 그 인</label>
	</div>

	<form action = "logindb.do" method="post">
		<div>
			<div class="bt_id">
				<input class="form-control bt_id" type="text" id="userId" placeholder="아이디" 
						name="userId" required="required" value="<%=id%>"><br/>
			</div>
			<span id="idCheck"></span>
			<div class="bt_pw">
				<input class="form-control bt_pw" type="password" id="userPw" placeholder="비밀번호" 
						name="userPw" required><br/><br/>
			</div>
			<span id="pwCheck"></span>
			<div class="bt_login">
				<input class="btn btn-primary btn-lg btn-block top" type="submit" 
						style="font-size: 15px;" value="회원가입한 아이디로 로그인"> <br/>
			</div>
		</div>
	</form>
	
	<div>
		<div class="bt_center">
			<button class="btn btn-secondary btn-lg right" onclick="location.href='findId.do'"
					style="font-size: 15px;">아이디 찾기</button>
			<button class="btn btn-secondary btn-lg right" onclick="location.href='findPw.do'"
					style="font-size: 15px;">비밀번호 찾기</button>
			<button class="btn btn-secondary btn-lg" onclick="location.href='join.do'"
					style="font-size: 15px;">회원가입</button>
		</div>
	</div>

	<div class="around social" align = "center">
		<img style="width:100%; height:100%" src="resources/image/login_naver.png" 
				onClick="javascript:loginNaver()"></a>
	</div>

	<div class="around social" align = "center">
		<a href="facebookLogin.do"><img style="width:100%; height:100%" 
			src="resources/image/login_facebook.png"></a>
	</div>
	
	<div class="around social" align = "center">
		<a href="googleLogin.do"><img style="width:100%; height:100%" 
			src="resources/image/login_google.png"></a>
	</div>	
</div> <!-- //frame -->
</body>
</html>