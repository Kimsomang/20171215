<%@page import="com.fivefingers.outfrog.model.dto.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<style type="text/css">
.work {
	position: relative;
	z-index: 1;
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
	z-index: 2;
	width: 200px;
	height: 60px;
	padding: 5px 0;
}

.center {
	text-align: center;
	margin-top:70px;
	align: center;
}
.pagination {
   justify-content: center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>
<script>
<%	String select = (String)request.getAttribute("select");
	String searchInput = (String)request.getAttribute("searchInput");
	String searchCategory = (String)request.getAttribute("searchCategory");
%>
$(document).ready(function(){
	<% if(select.equals("F")) { %>
    	$("select option[value='F']").attr("selected", true);
    <%} else if(select.equals("T")) { %>
    	$("select option[value='T']").attr("selected", true);
    <%}%>
});

function category(){
	
	var category = document.getElementById("category").value;
	
	if(category == "T"){
		location.href="tipTapBoard.do";
	}
	else if(category == "F"){
		location.href="freeTapBoard.do";
	}
	else {
		location.href="freeBoard.do";
	}
}

function search() {
	var category = document.searchBoardForm.searchCategory.value;
	if(category == "제목" || category == "내용" || category == "제목+내용" || category == "아이디") {
		document.searchBoardForm.action = "searchBoard.do";
		document.searchBoardForm.submit();
	}
	else {
		alert("옵션을 선택하세요.");
	}
}
</script>
</head>
<body>
<div class="header">
		<jsp:include page="/WEB-INF/views/header.jsp" flush = "false"/>
	</div>
<%!
	public Integer toInt(String x){
		int a = 0;
		try{
			a = Integer.parseInt(x);
		}catch(Exception e){}
		return a;
	}
%>
<%
ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("freeBoardList");
%>
<%
int pageno = toInt(request.getParameter("pageno"));
if(pageno<1){//현재 페이지
	pageno = 1;
}

int total_record = 0;			//총 레코드 수
int page_per_record_cnt = 0;   //페이지 당 레코드 수
int group_per_page_cnt =0;     //페이지 당 보여줄 번호 수[1],[2],[3],[4],[5]
//  [6],[7],[8],[9],[10]	
	
	
if(list!=null&&list.size()>0){
	total_record = list.size();	
	page_per_record_cnt=10;
	group_per_page_cnt =5;
}										

int record_end_no = pageno*page_per_record_cnt;				
int record_start_no = record_end_no-(page_per_record_cnt-1);
if(record_end_no>total_record){
	record_end_no = total_record;
}

int total_page = 0;
if(list!=null&&list.size()>0){					   
total_page = total_record / page_per_record_cnt + (total_record % page_per_record_cnt>0 ? 1 : 0);
}

if(pageno>total_page){
	pageno = total_page;
}



int group_no = 0;	
int page_eno = 0;		
int page_sno = 0;

if(list!=null&&list.size()>0){		
group_no = pageno/group_per_page_cnt+( pageno%group_per_page_cnt>0 ? 1:0);	
page_eno = group_no*group_per_page_cnt;		
page_sno = page_eno-(group_per_page_cnt-1);
}

if(page_eno>total_page){
	page_eno=total_page;
}

int prev_pageno = 0;
int next_pageno = 0;

if(list!=null&&list.size()>0){		
prev_pageno = page_sno-group_per_page_cnt;  // <<  *[이전]* [21],[22],[23]... [30] [다음]  >>
next_pageno = page_sno+group_per_page_cnt;	// <<  [이전] [21],[22],[23]... [30] *[다음]*  >>
}

if(prev_pageno<1){
	prev_pageno=1;
}
if(next_pageno>total_page){
	next_pageno=total_page/group_per_page_cnt*group_per_page_cnt+1;
}
%>
<div style="width: 80%;margin: auto">
<table class="table table-striped table-hover table-bordered">
  <thead class="thead-dark">
  
    <tr>
   
      <th colspan="2">
       <h3>자유+TIP 게시판</h3>
      <div class="form-group">
      <select id="category" class="form-control" onchange="category()">
        <option value="none">카테고리 선택</option>
        <option value="F">자유</option>
        <option value="T">TIP</option>
      </select>
    </div>
    </th>
    </tr>
  </thead>

  <thead class="thead-dark">
    <tr>
      <th width="150px">게시글번호</th>
      <th width="450px">제목</th>
      <th width="150px">작성날짜</th>
      <th width="150px">작성자</th>
      <th width="100px">조회수</th>
      <th width="100px">신고수</th>
    </tr>
  </thead>
  <tbody>
  <% for(int i=(page_per_record_cnt)*(pageno)-(page_per_record_cnt);i<(page_per_record_cnt)*(pageno);i++){ 
	 		 if(i<list.size()){
  %>
    <tr>
      <td><%=list.get(i).getBoardNum()%></td>
      <td><a href="freeBoardView.do?boardNum=<%=list.get(i).getBoardNum()%>&boardId=<%=list.get(i).getBoardId()%>"><%=list.get(i).getBoardTitle() %></a></td>
      <td><%= list.get(i).getPostDate() %></td>
      <td><%= list.get(i).getUserId() %></td>
      <td><%= list.get(i).getHits() %></td>
      <td><%= list.get(i).getReportCount() %></td>
    </tr>
    <%
    }}
    %>
</table>
<div>
<div align="right"><a href="freeBoardWriteForm.do"><button type="button" class="btn btn-success">게시글 등록</button></a>

</div>
</div> 
</div>
<% if(searchCategory==null || searchInput==null) {%>
<ul class="pagination">
<li class="page-item"><a class="page-link" href="freeBoard.do?pageno=1">[맨앞으로]</a></li>
<li class="page-item"><a class="page-link" href="freeBoard.do?pageno=<%=prev_pageno %>">[이전]</a></li>
<%for(int i =page_sno;i<=page_eno;i++){%>
	
		<%if(pageno == i){ %>
			<li class="page-item active"><a class="page-link" href="freeBoard.do?pageno=<%=i %>"><%=i %></a></li>
		<%}else{ %>
			<li class="page-item"><a class="page-link" href="freeBoard.do?pageno=<%=i %>"><%=i %>
	</a> </li>
		<%} %>
<%} %>
 
<li class="page-item"><a class="page-link" href="freeBoard.do?pageno=<%=next_pageno%>" >[다음]</a></li>
<li class="page-item"><a class="page-link" href="freeBoard.do?pageno=<%=total_page %>">[맨뒤로]</a></li>
</ul>
<%} else { %>
<ul class="pagination">
<li class="page-item"><a class="page-link" href="searchBoard.do?searchCategory=<%=searchCategory%>&searchInput=<%=searchInput%>&pageno=1">[맨앞으로]</a></li>
<li class="page-item"><a class="page-link" href="searchBoard.do?searchCategory=<%=searchCategory%>&searchInput=<%=searchInput%>&pageno=<%=prev_pageno %>">[이전]</a></li> 
<%for(int i =page_sno;i<=page_eno;i++){%>
	
		<%if(pageno == i){ %>
			<li class="page-item"><a class="page-link" href="searchBoard.do?searchCategory=<%=searchCategory%>&searchInput=<%=searchInput%>&pageno=<%=i %>"><%=i %></a></li>
		<%}else{ %>
			<li class="page-item"><a class="page-link" href="searchBoard.do?searchCategory=<%=searchCategory%>&searchInput=<%=searchInput%>&pageno=<%=i %>"><%=i %>
	</a> </li>
		<%} %>
<%} %>
 
<li class="page-item"><a class="page-link" href="searchBoard.do?searchCategory=<%=searchCategory%>&searchInput=<%=searchInput%>&pageno=<%=next_pageno%>" >[다음]</a></li>
<li class="page-item"><a class="page-link" href="searchBoard.do?searchCategory=<%=searchCategory%>&searchInput=<%=searchInput%>&pageno=<%=total_page %>">[맨뒤로]</a></li>

<%} %>

<form name="searchBoardForm">
<div style="margin: auto" class="form-group" style="width: 1200px;" align="center">
<div style="margin-right: 10%;float:right;">
<button type="button" class="btn btn-outline-primary" onclick="search();">검색</button>
</div>
<div style="float:right;margin-right: 1%;width: 150px;">
       <input class="form-control form-control-sm" type="text" id="searchInput" name="searchInput">
</div>
<div style="margin-right: 1%;width: 150px; float:right ;">
<select class="form-control form-control-sm" id="searchCategory" name="searchCategory">
<option>검색 조건</option>
<option>제목</option>
<option>내용</option>
<option>제목+내용</option>
<option>아이디</option>
</select>
</div>

</div>
</form>
</body>
</html>