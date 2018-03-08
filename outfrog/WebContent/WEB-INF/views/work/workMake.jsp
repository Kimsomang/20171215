<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fivefingers.outfrog.model.dto.Work" %>    
<%@ page import="com.fivefingers.outfrog.model.dto.Contest" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out-frog : 우물 밖 개구리</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css?ver=1">
<style type="text/css">
.lb_title {
	font-size: x-large; 
	font-weight: bold; 
	text-align: left; 
	margin: 10px 180px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
    $('#workContent').on('keyup', function() {
        if($(this).val().length > 500) {
            $(this).val($(this).val().substring(0, 500));
        }
    });
    $("#workPicture").on("change", handleImgFileSelect);
});

var sel_file;

function handleImgFileSelect(e) {
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            document.getElementById("workPicture").value="";
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

function timeCheck(frm) {
	<%
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("YYYY년MM월dd일");
	String dueDate = (String)request.getAttribute("dueDate");
	String timeCheck = formatter.format(new java.util.Date());

	if(timeCheck.compareTo(dueDate)>0) {
		%>
		alert("마감일이 지났습니다.");
		return false;
	<%} else {
	%> 
	if(document.getElementById("workPicture").value=="") {
		alert("대표사진을 첨부해 주세요.");
		return false;
	}
	if(document.getElementById("workFile").value=="") {
		alert("파일을 첨부해 주세요.");
		return false;
	}
	
	var file = frm.workFile.value;
	var size = frm.workFile;
	var fileExt = file.substring(file.lastIndexOf('.')+1); //파일의 확장자를 구합니다.
	var bSubmitCheck = true;		
	var ext = fileExt.toUpperCase();
	if (ext!="WMV"&&ext!="AVI"&&ext!="MP4"&&ext!="HWP"&&ext!="PPTX"&&ext!="TXT"&&ext!="DOC"&&ext!="DOCX"&&ext!="PDF"&&ext!="ZIP"&&ext!="JPG"&&ext!="JPEG"&&ext!="PNG") {
		alert("파일 확장자를 확인해주세요.");
		return false;
	}
	var maxSize  = 500*1024*1024;
    var fileSize = size.files[0].size;
    if(fileSize > maxSize)
    {
        alert("첨부파일 사이즈는 500MB 이내로 등록 가능합니다.");
        return false;
    }
	return true;
<%}%>
}
</script>
</head>
<body>
<div>
	<jsp:include page="/WEB-INF/views/header.jsp" flush = "false"/>
</div>
<div style="margin-left: 250px; margin-top:30px; width: 52%;">
<% Work work = (Work)request.getAttribute("work");
	String contestNum = (String)request.getAttribute("contestNum");
	Contest contest = (Contest)request.getAttribute("contest");
	String benefit = contest.getContestBenefit();
	String benefits[] = benefit.split("/");
	String benefitPrint = "";
	for(int i=0;i<benefits.length;i++) {
		benefitPrint += benefits[i];
		if(i%3==0)
			benefitPrint += " : ";
		else if(i%3==1)
			benefitPrint += " - ";
		else if(i%3==2)
			benefitPrint += "\n";
	}
	if(work==null) {
%>
<label class="btn-primary btn-lg btn-block lb_title" style="margin-left: 0px;">작 품 등 록 페 이 지</label>
<% } else {%>
<label class="btn-primary btn-lg btn-block lb_title" style="margin-left: 0px;">작 품 수 정 페 이 지</label>
<%} %>
</div>
<div style="margin-left: 250px; width: 52%;">
	<table border="1" style="font-size: 13px; width:700px; line-height: 0.9;" class="table table-striped table-hover table-bordered"> 
		<tr>
			<td rowspan="5" style="width: 200px; background-size: 200px 230px; background-image: url('${pageContext.request.contextPath}/resources/upload/<%=contest.getContestFile()%>');"></td>
			<th style="width:100px; text-align: center;">제&emsp;&emsp;목</th>
			<td><%=contest.getContestTitle() %></td>
		</tr>
		<tr>
			<th style="text-align: center;">주&emsp;&emsp;최</th>
			<td><%=contest.getContestSponsor() %></td>
		</tr>				
		<tr>
			<th style="text-align: center;">분&emsp;&emsp;야</th>
			<td><%=contest.getContestField() %></td>
		</tr>		
		<tr>
			<th style="text-align: center;">시상내역</th>
			<td><textarea rows="5" cols="40" style="resize:none; border: 0;" readonly><%=benefitPrint %></textarea></td>
		</tr>		
		<tr>
			<th style="text-align: center;">마감시간</th>
			<td><%=contest.getDueDate() %></td>
		</tr>		
	</table>
</div>
<br>
<%if(work==null) {%>
<form action="insertWork.do" method="post" enctype="multipart/form-data">
<% } else {%>
<form action="updateWork.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="preFile" value="<%=work.getWorkFile() %>">
<input type="hidden" name="prePicture" value="<%=work.getWorkPicture() %>">
<input type="hidden" name="workNum" value="<%=work.getWorkNum() %>">
<input type="hidden" name="contestNum" value="<%=contestNum %>">
<%} %>
<input type="hidden" id="contestNum" name="contestNum" value="<%=contestNum %>">
<div>
	<table border="1" style="margin-left: 250px; font-size: 14px; width:700px;" class="table table-striped table-hover table-bordered">
		<tr>
			<th style="width: 150px;">작품 제목</th>
			<td style="width: 600px;">
				<input type="text" name="workTitle" id="workTitle" placeholder="2~50자 제목" style="width: 570px; height: 30px; font-size: large;" maxlength=50 value="<%if(work!=null) %><%=work.getWorkTitle() %>" required> 
			</td>
		</tr>
		<tr height="300px">
			<th>작품 내용</th>
			<td>
				<textarea rows="10" cols="60" name="workContent" id="workContent" style="resize:none; font-size: large;" placeholder="작품 내용을 입력하세요!(500자 이내)" required><%if(work!=null) %><%=work.getWorkContent() %></textarea> 
			</td>
		</tr>
		<tr>
			<th>대표 사진</th>
			<td>
				<input type="file" name="workPicture" id="workPicture" style="width: 300px; height: 30px; font-size: medium" accept=".jpg, .png">
				<%if(work!=null) {%> <br><span style="font-size:small;">기존파일(비우시면 이전 파일 그대로, 새로 넣으시면 수정됩니다.) : <%=work.getWorkPicture()%></span><%} %>
				<div>
        			<div>
        				<% if(work==null) { %>
            			<img style="width:300px; height:200px;" id="img" src="${pageContext.request.contextPath}/resources/image/noPicture.png"/>
        				<% } else { %>
        				<img style="width:300px; height:200px;" id="img" src="${pageContext.request.contextPath}/resources/upload/<%=work.getWorkPicture()%>"/>
        				<%} %>
        			</div>
    			</div>
			</td>
		</tr>
		<tr>
			<th>파일 업로드</th>
			<td>
				<input type="file" name="workFile" id="workFile" style="width: 300px; height: 30px; font-size: small;" accept=".wmv, .avi, .mp4, .hwp, .pptx, .txt, .doc, .docx, .pdf, .zip, .jpg, .jpeg, .png"><p>.wmv .avi .mp4 .hwp .pptx .txt .doc .docx .pdf .zip .jpg .jpeg .png<p><%if(work!=null) {%> <br><span style="font-size:small;">기존파일(비우시면 이전 파일 그대로, 새로 넣으시면 수정됩니다.) : <%=work.getWorkFile() %></span><%} %>
			</td>
		</tr>
	</table>
</div>
<div style="margin-left: 700px; margin-bottom: 100px;">
	<%if(work==null) {%>
	<input type="submit" class="btn btn-primary" value="등록하기" style="width: 120px; line-height: 16px; font-size: 12px; font-weight: 600; float:left; margin: 5px 5px auto;" onclick="return timeCheck(this.form);">
	<%} else {%>
	<input type="submit" class="btn btn-primary" value="수정하기" style="width: 120px; line-height: 16px; font-size: 12px; font-weight: 600; float:left; margin: 5px 5px auto;" onclick="return timeCheck(this.form);">
	<%} %>
	<input type="reset" class="btn btn-primary" value="취소" style="width: 120px; line-height: 16px; font-size: 12px; font-weight: 600; float:left; margin: 5px 5px auto;" onclick="history.back()">
</div>
<br><br>
</form>
</body>
</html>