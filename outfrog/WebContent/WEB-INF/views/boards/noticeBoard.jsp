<%@page import="com.fivefingers.outfrog.model.dto.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지게시판</title>
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
ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("noticeBoardList");
%>
<%
	int pageno = toInt(request.getParameter("pageno"));
	if(pageno<1){//현재 페이지
		pageno = 1;
	}
	
	int total_record = 0;			//총 레코드 수
	int page_per_record_cnt = 0;   //페이지 당 레코드 수
	int group_per_page_cnt =0;     //페이지 당 보여줄 번호 수[1],[2],[3],[4],[5]
//	  [6],[7],[8],[9],[10]	
		
		
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


<div style="width:80%;margin:auto">
<table class="table table-striped table-hover table-bordered">
  <thead class="thead-dark">
  
    <tr>
   
      <th colspan="2">
       <h3>공지게시판</h3>
 
    </th>
    </tr>
  </thead>
  <thead class="thead-dark">
    <tr>
      <th width="170px">게시글번호</th>
      <th width="450px">제목</th>
      <th width="150px">작성날짜</th>
      <th width="150px">작성자</th>
      <th width="100px">조회수</th>
    </tr>
  </thead>
  <tbody>
  <% for(int i=(page_per_record_cnt)*(pageno)-(page_per_record_cnt);i<(page_per_record_cnt)*(pageno);i++){ 
	 		 if(i<list.size()){
  %>
    <tr>
      <td><%=list.get(i).getBoardNum()%></td>
      <td><a href="noticeBoardView.do?boardNum=<%=list.get(i).getBoardNum()%>&boardId=<%=list.get(i).getBoardId()%>"><%=list.get(i).getBoardTitle() %></a></td>
      <td><%= list.get(i).getPostDate() %></td>
      <td><%= list.get(i).getUserId() %></td>
      <td><%= list.get(i).getHits() %></td>
    </tr>
    <%
    }}
    %>
</table>
</div>
<div>
<%if(session.getAttribute("userGrade").equals("A")){ %>
<div align="right"><a href="noticeBoardWriteForm.do"><button type="button" class="btn btn-success">게시글 등록</button></a>
<%} %>
</div>
</div> 
<div align="center"><span><a href="noticeBoard.do?pageno=1">[맨앞으로]</a>
<a href="noticeBoard.do?pageno=<%=prev_pageno %>">[이전]</a> 
<%for(int i =page_sno;i<=page_eno;i++){%>
	[
		<%if(pageno == i){ %>
			<%=i %>
		<%}else{ %>
			<a href="noticeBoard.do?pageno=<%=i %>"><%=i %>
	</a> 
		<%} %>
	]
<%--	콤마	 --%>	
	<%if(i<page_eno){ %>
		,
	<%} %>
<%} %>
 
<a href="noticeBoard.do?pageno=<%=next_pageno%>" >[다음]</a>
<a href="noticeBoard.do?pageno=<%=total_page %>">[맨뒤로]</a>
	</span></div>



<div style="margin: auto" class="form-group" style="width: 150px;" align="right">
<div style="margin-right: auto;width: 150px; float:right ;">
<select class="form-control form-control-sm" id="serachCategory">
<option>검색 조건</option>
<option>제목</option>
<option>아이디</option>
<option>제목+아이디</option>
</select>
</div>
<div style="float:right;width: 150px;">
       <input class="form-control form-control-sm" type="text" id="searchInput">
</div>
<br><br>
<div style="margin: auto">
<button type="button" class="btn btn-outline-primary">검색</button>
</div>
</div>




</body>
</html>