<%@ page language="java" contentType="text/html;charset =utf-8"
pageEncoding="utf-8" %>
<%@ page import="BoardSystem.*" %>
<jsp:useBean id="dao" class="shopping.ShoppingBoardDAO" />
  
    <%
    String pd_id = request.getParameter("Pd_id");
	System.out.println(pd_id);
    dao.countUpdate(pd_id);

        /* response.sendRedirect("../pages/shoppingBoard.jsp"); */
    %>
     <script language=javascript> 
  /*  self.window.alert("조회수추가."); */
    location.href="../pages/shoppingBoard.jsp";
</script>