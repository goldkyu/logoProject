<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ticketSystem.TkBoardDAO"%>
<%@page import="ticketSystem.TkBoardDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
   
    <form action="">
    <div id="board-search">
      <div class="search-wrap">
	  <input id="search" type="search" name="" placeholder="�˻�� �Է����ּ���." value="">
      <button type="submit" class="btn btn-dark">�˻�</button>
      </div>
   </div>
   </form>
                
   <div class="container">
       <table class="board-table">
         <thead>
         <tr bgcolor="#F6F6F6">
         <th class="th-num" style="width:100px">��ȣ</th>
         <th class="th-title">����</th>
         <th class="th-date">���̵�</th>
         <th class="th-date">�����</th>
         <!-- <th class="th-date">��ȸ��</th> -->
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
      <%--    <td><%= b.getHits() %></td> --%>
         </tr>
         <%
		}
		%>
		</tbody>
		</table>
		
		<div>
		<input type="button" value="�۾���" class="write" onclick="location.href='../pages/tkBoardWrite.jsp'" >
		</div>
		
	</div>

</div>	
</section>
</form>

<footer>
	<jsp:include page="siteFooter.jsp" />
</footer>

</body>
</html>