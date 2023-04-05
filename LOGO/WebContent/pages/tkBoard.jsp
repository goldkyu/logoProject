<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ticketSystem.TkBoardDAO"%>
<%@page import="ticketSystem.TkBoardDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<link rel="stylesheet" href="../CSS/tkBoard.css" />
</head>

<body>
  <% request.setCharacterEncoding("utf-8"); %>
	
	<jsp:include page="siteHead.jsp" />
	<jsp:useBean id="dto" class="ticketSystem.TkBoardDAO" />
	<% 
  ArrayList<TkBoardDTO> list = dto.writeSelect();

	
	%>

<section>
<form>
<div id="mainBox">
    <div class="page-title">
    	 <div class="container">
	        <h3>Review</h3>
        </div>
  	</div>
   
  	 <div>
		<input type="button" value="글쓰기" class="write" onclick="location.href='tkBoardWrite.jsp'" >
	</div>
                    
   <div class="container">
       <table class="board-table">
         <thead>
         <tr bgcolor="#F6F6F6">
         <th class="th-num" style="width:100px">번호</th>
         <th class="th-title">제목</th>
         <th class="th-date">아이디</th>
         <th class="th-date">등록일</th>
         <th class="th-date">조회수</th>
         </tr>
         </thead>
	
		 <tbody>
		 <%
		 for (TkBoardDTO b : list) {
		 %>
         <tr>
         <td><%= b.getPfm_id() %></td>
         <td><a href="../pages/tkBoardWriteCall.jsp?Pfm_id=<%=b.getPfm_id() %>"><%= b.getPfm_title() %></td>
         <td><%= b.getU_id() %></td>
         <td><%= b.getDate() %></td>
      	 <td><%= b.getHits() %></td>
      	 </tr>
         <%
		}
		%>
		</tbody>
		</table>
		
		<form action="">
    		<div id="board-search">
     		 <div class="search-wrap">
	 			 <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
      				<button type="submit" class="btn btn-dark">검색</button>
    		  </div>
  			 </div>
  		 </form>
		
			
	</div>

</div>	
</section>
</form>

<footer>
	<jsp:include page="siteFooter.jsp" />
</footer>

</body>
</html>