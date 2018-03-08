<%@page import="com.fivefingers.outfrog.model.dto.Contest"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기 공모</title>
<link type="text/css" rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<link type="text/css" rel="stylesheet" href="resources/css/view.css">
<link type="text/css" rel="stylesheet" href="resources/css/company.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>

<div class="header">
		<jsp:include page="/WEB-INF/views/header.jsp" flush = "false"/>
	</div>
<%
ArrayList<Contest> list = (ArrayList<Contest>)request.getAttribute("topContest");
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("YYYY년MM월dd일");
String today = formatter.format(new java.util.Date());
%>
<%
if(!list.isEmpty()) {
   
   for(int i=0;i<list.size();i++){
      if(today.compareTo((String)list.get(i).getDueDate())>0){
         list.remove(i);
         i--;
      }
   }
   }
%> 
<div style="width:80%;margin:auto;color: black">
   <table class="table table-bordered">
   <tr><th> 
<img style="width:200px; height:200px" src="resources/image/top10.png" align="left">
</th>
<th style="text-align: center;vertical-align: middle;">
<h4>이곳은 즐겨찾기 수가 가장 많은 공모들이 보여지는 공모랭킹순위 페이지 입니다.</h4>
<h5>다들 자신의 개성을 발휘할 수 있는 공모를 선택하여 승승장구 하시길 바랍니다!!!</h5>
</th>
</tr>
</table>
<div>
   <div style="float: left;">
   </div>
   
   <table class="table table-bordered table-success" border="1" cellspacing="1" style="font-size: 12px;"> 
   <tbody>
 <% if(list != null) {
         for(int i=0;i<list.size();i++) {
        	
            if(i<list.size()){
               if(today.compareTo((String)list.get(i).getDueDate())<=0){
            	   if(i==10)break;
      %>
      <tr>
      <th rowspan="7" style="height:150px;">
      <div>
      <a href="workListView.do?contestNum=<%=list.get(i).getContestNum()%>"><img class="img_work" alt="공모 포스터 사진" src="${pageContext.request.contextPath}/resources/upload/<%=list.get(i).getContestFile()%>">
      </a></div></th></tr>
   
   <tr>
         <th style="width:20%">즐겨찾기수 </th>
         <th style="width:400px;"><%= list.get(i).getBookmarkCount() %></th>
      </tr>
   <tr>
         <th >제목 </th>
         <th style="width:400px;"><a style="text-decoration:underline ; color:blue;" href="workListView.do?contestNum=<%=list.get(i).getContestNum()%>"> <%= list.get(i).getContestTitle() %></a></th>
      </tr>
      <tr>
         <th >주최 </th>
         <th style="width:300px;"><%= list.get(i).getContestSponsor() %></th>
      </tr>
      <tr>
         <th >분야 </th>
         <th style="width:100px;"><%= list.get(i).getContestField() %></th>
      </tr>      
      <tr>
         <th >시상내역 </th>
         <th style="width:800px;"><%= list.get(i).getContestBenefit() %></th>
      </tr>      
      <tr>
         <th >마감시간 </th>
         <th style="width:100px;"><%= list.get(i).getDueDate() %></th>
      </tr>
<%
               }
               }
            %>
       	 <tr><td style="color: white;background-color: white" colspan="5"></td></tr>
       	 <%
         }
         }
      %>
      </tbody>
		</table>
   
</div>
</div>
<div>
	<jsp:include page="/WEB-INF/views/footer.jsp" flush = "false"/>
</div>
</body>
</html>