<%@page import="com.fivefingers.outfrog.model.dto.Contest"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out-frog : 우물 밖 개구리</title>
<link type="text/css" rel="stylesheet" href="resources/css/view.css?ver=1">
<link type="text/css" rel="stylesheet" href="resources/css/company.css">
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
<script type="text/javascript">
function search() {
var searchText = document.getElementById("searchText").value;
if(searchText.trim().length==0) {
   alert("검색어를 입력하세요.");
   return false;
}
return true;
}
</script>

</head>
<body>
<div>
	<jsp:include page="/WEB-INF/views/header.jsp" flush = "false"/>
</div>

<div style="font-size: 30px; margin-top:30px;" align="center">마감된 공모</div>

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
ArrayList<Contest> list = (ArrayList<Contest>)request.getAttribute("allContest");
String contestNum = (String)request.getAttribute("contestNum");
String result = (String)request.getAttribute("result");
String searchContents = (String)request.getAttribute("searchContents");
String contestField = (String)request.getAttribute("contestField");

java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("YYYY년MM월dd일");
String today = formatter.format(new java.util.Date());
if(result != null) { %>
<div style="text-align:center" align="center"><%=result %></div>
<%}
if(!list.isEmpty()) {
	
	for(int i=0;i<list.size();i++){
		if(today.compareTo((String)list.get(i).getDueDate())<=0){
			list.remove(i);
			i--;
		}
	}


	int pageno = toInt(request.getParameter("pageno"));
	if(pageno<1){//현재 페이지
		pageno = 1;
	}
	
	int total_record = list.size();		   //총 레코드 수    if total=27
	int page_per_record_cnt = 5;  //페이지 당 레코드 수
	int group_per_page_cnt =5;     //페이지 당 보여줄 번호 수[1],[2],[3],[4],[5]
//					  									  [6],[7],[8],[9],[10]											
							//if n=6
	int record_end_no = pageno*page_per_record_cnt;			//n*5=30
	int record_start_no = record_end_no-(page_per_record_cnt-1);		//  30 -4 == 26
	if(record_end_no>total_record){      //30>27 true  -> 27=27..
		record_end_no = total_record;
	}
										   //  5.4 + 2>0->1 =6
										   // 27/5 + 27%5    if((pageno+4)<=total_page){ }
	int total_page = total_record / page_per_record_cnt + (total_record % page_per_record_cnt>0 ? 1 : 0);
	if(pageno>total_page){
		pageno = total_page;
	}

	
										//4/5 + 4%5>0-1 => 1
	int group_no = pageno/group_per_page_cnt+( pageno%group_per_page_cnt>0 ? 1:0);
	int page_eno = group_no*group_per_page_cnt;
	int page_sno = page_eno-(group_per_page_cnt-1);
	
	if(page_eno>total_page){
		page_eno=total_page;
	}
	
	int prev_pageno = page_sno-group_per_page_cnt;  // <<  *[이전]* [21],[22],[23]... [30] [다음]  >>
	int next_pageno = page_sno+group_per_page_cnt;	// <<  [이전] [21],[22],[23]... [30] *[다음]*  >>
	if(prev_pageno<1){
		prev_pageno=1;
	}
	if(next_pageno>total_page){
		next_pageno=total_page/group_per_page_cnt*group_per_page_cnt+1;
	}
%>
<div align="center" style="width:1700px; height:300px;">
	<div style=" width:1200px;"> 

	<% if(list != null) {
			for(int i=(page_per_record_cnt)*(pageno)-(page_per_record_cnt);i<(page_per_record_cnt)*(pageno);i++) {
				if(i<list.size()&&list.size()>0){
		%>
		
		<div class="work center">
			<a href="workListView.do?&contestNum=<%=list.get(i).getContestNum()%>">
				<img class="img_work" alt="작품 대표사진" src="${pageContext.request.contextPath}/resources/upload/<%=list.get(i).getContestFile() %>">	
			</a>
			<div class="title" onclick="location.href='workListView.do?&contestNum=<%=list.get(i).getContestNum()%>'">
				<h5 style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;width: 150px;margin: 0 25px auto;"><%= list.get(i).getContestTitle() %></h5>
				<p style="font-size:10px;"> 주최 : <%= list.get(i).getContestSponsor() %><br> 마감일 :  <%=list.get(i).getDueDate() %></p>
			</div>
		</div>
		<%
	       }}}
		%>
	</div>
</div>
<br>
<br>
<div style="clear:both;">
<div>
<% if(!(total_record<1)){ %>
<%if(result==null) {%>
<div style=" margin-top:10px;" align="center">
	<ul class="pagination">
	<%
	if(page_sno!=1){
	 %>
	<li class="page-item"><a class="page-link" href="finishedContest.do?pageno=1">맨앞으로</a></li>
		<li class="page-item "><a class="page-link" href="finishedContest.do?pageno=<%=prev_pageno %>">이전</a></li>
		<%} %>
		
		<%for(int i =page_sno;i<=page_eno;i++){%>
		
			<%if(pageno == i){ %>
			<li class="page-item active"><a class="page-link" href="finishedContest.do?pageno=<%=i %>"><%=i %></a></li>
			<%}else{ %>
				<li class="page-item"><a class="page-link" href="finishedContest.do?pageno=<%=i %>"><%=i %></a></li>
			<%} %>
	
<%-- 콤마 --%>	
<%} %>
	<%
	if(page_eno!=total_page){
	 %>
<li class="page-item"><a class="page-link" href="finishedContest.do?pageno=<%=next_pageno%>" >다음</a></li>
<li class="page-item"><a class="page-link" href="finishedContest.do?pageno=<%=total_page %>">맨뒤로</a></li>
<%} %>
<%} else {%>
<div style=" margin-top:10px;" align="center">
	<ul class="pagination">
	<%
	if(page_sno!=1){
	 %>
	<li class="page-item"><a class="page-link" href="finishedContestSearch.do?searchContest=<%=searchContents%>&pageno=1">맨앞으로</a></li>
		<li class="page-item "><a class="page-link" href="finishedContestSearch.do?searchContest=<%=searchContents%>&pageno=<%=prev_pageno %>">이전</a></li>
		<%} %>
		
		<%for(int i =page_sno;i<=page_eno;i++){%>
		
			<%if(pageno == i){ %>
			<li class="page-item active"><a class="page-link" href="finishedContestSearch.do?searchContest=<%=searchContents%>&pageno=<%=i %>"><%=i %></a></li>
			<%}else{ %>
				<li class="page-item"><a class="page-link" href="finishedContestSearch.do?searchContest=<%=searchContents%>&pageno=<%=i %>"><%=i %></a></li>
			<%} %>
	
<%-- 콤마 --%>	
	
<%} %>
 
	<%
	if(page_eno!=total_page){
	 %>
<li class="page-item"><a class="page-link" href="finishedContestSearch.do?searchContest=<%=searchContents%>&pageno=<%=next_pageno%>" >다음</a></li>
<li class="page-item"><a class="page-link" href="finishedContestSearch.do?searchContest=<%=searchContents%>&pageno=<%=total_page %>">맨뒤로</a></li>
<%} %>

<%} %>
	<%} } %>
	</ul>
	</div>
 	<div class= "pagination" style="font-size:15px;">
 	<form class="form-inline my-2 my-lg-0" id="searchForm2" name="searchForm2" action="finishedContestSearch.do">
      <input type="text" id="searchText" name="searchText" style="size: 100px; margin-right:10px">
      <input class="btn btn-secondary my-2 my-sm-0" type="submit" value="Search" onclick="return search();">
     </form>
   </div>
</div>
</div>
<div style="left:0px;bottom:0px;width:100%;background:#EE7785;color: white;">
	<jsp:include page="/WEB-INF/views/footer.jsp" flush = "false"/>
</div>
</body>
</html>