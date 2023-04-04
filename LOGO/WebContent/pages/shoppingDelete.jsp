<%@ page language="java" contentType="text/html;charset =utf-8"
pageEncoding="utf-8" %>
<%@ page import="BoardSystem.*" %>
<jsp:useBean id="dao" class="shopping.ShoppingBoardDAO" />
  
    <%
    String u_id = request.getParameter("u_id");
    dao.delete(u_id);
        

        
        

        /* response.sendRedirect("../pages/shoppingBoard.jsp"); */
    %>
     <script language=javascript> 
   self.window.alert("삭제완료되었습니다.");
    location.href="../pages/shoppingBoard.jsp";
</script>