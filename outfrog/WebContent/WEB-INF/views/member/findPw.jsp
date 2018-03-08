<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out-frog : 우물 밖 개구리</title>

<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">

<style type="text/css">
	.lb_title {
		width: 100%; 
		font-size: x-large; 
		font-weight: bold; 
		text-align: left; 
		margin-top: 10px;
	}
	
	.tx_value {
		width:600px; 
		height:50px;
	}
	
	.around {
		margin: 80px;
	}

	.top {
		margin-top: 50px;
	}
	
	.right {
		margin-right: 20px;
	}
	
	.bt_findPw {
		width: 120px; 
		height: 30px;
	}
	
	.bt_reset {
		width: 60px; 
		height: 30px;
	}
	
	.bt_login {
		width: 200px; 
		height: 40px;
	}
	
	.radio_font	{
		margin-left: 10px;
		font-size: large;
		font-weight: bold;
	}
</style>

</head>
<body>
<div class="frame">
	<div class="header">
		<jsp:include page="../header3.jsp" flush = "false"/>
	</div> <!-- //header -->

	<div align = "center">
		<label class="btn-primary btn-lg btn-block lb_title">비밀번호 찾기</label>

		<table class="top">
			<thead class="thead-dark">	
				<tr style="height: 50px">
					<td colspan="1">
						<label class="btn-secondary btn-lg btn-block disabled" 
								style="text-align: center; width: 100%;"
								onclick="location.href='findId.do'">아이디 찾기</label>
					</td>
					<td>
						<label class="btn-primary btn-lg btn-block" 
								style="text-align: center; width: 100%;">비밀번호 찾기</label>
					</td>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td width="600px" colspan="2">
						<form action="findPwPhone.do" name="findPwForm">
							<input type="radio" checked="checked"><font class="radio_font">등록된 휴대폰 번호로 찾기</font><br/>
							<div id="findPwPhone">
								<div>
									<input class="form-control tx_value" type="text" placeholder="아이디" 
											name ="userId" required><br/>
									<input class="form-control tx_value" type="text" placeholder="이름" 
											name ="userName" required><br/>
									<input class="form-control tx_value" type="password" placeholder="휴대전화('-' 제외 입력)" 
											name ="userPhone1" required><br/>
								</div>
							
								<div align = "right">
									<input class="btn btn-primary bt_findPw right" type="submit" 
											style="font-size: 100%;" value="비밀번호 찾기">
									<input class="btn btn-primary bt_reset" type="reset" 
											style="font-size: 100%;" value="취소">
								</div>
							</div>
						</form>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<form action="findPwEmail.do" name="findPwForm">
							<input type="radio" checked="checked"><font class="radio_font">등록된 이메일로 찾기</font><br/>
							<div id="findPwEmail">
								<div>									
									<input class="form-control tx_value" type="text" placeholder="아이디" 
											name ="userId" required><br/>
									<input class="form-control tx_value" type="text" placeholder="이름" 
											name ="userName" required><br/>
									<input class="form-control tx_value" type="text" placeholder="이메일" 
											name ="userEmail"  required><br/>
								</div>
							
								<div align = "right">
									<input class="btn btn-primary bt_findPw right" type="submit" 
											style="font-size: 100%;" value="비밀번호 찾기">
									<input class="btn btn-primary bt_reset" type="reset" 
											style="font-size: 100%;" value="취소">
								</div>
							</div>
						</form>
					</td>
				</tr>
			</tbody>
		</table>
		
		<div class="around">
			<input class="btn btn-primary btn-lg bt_login" type="button" value="로그인 화면으로" 
					style="font-size: 100%;" onclick="location.href='login.do'">
		</div>
	</div>
</div> <!-- //frame -->
</body>
</html>