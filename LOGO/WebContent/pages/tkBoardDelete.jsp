<%@ page language="java" contentType="text/html;charset =utf-8"
pageEncoding="utf-8" %>
<%@ page import="ticketSystem.*" %>


<jsp:useBean id="dao" class="ticketSystem.TkBoardDAO" />
  
    <%
    String pfm_id = request.getParameter("pfm_id");
    System.out.print(pfm_id);
    dao.tkdelete(pfm_id);
        

    %>
     <script language=javascript> 
   self.window.alert("삭제완료되었습니다.");
    location.href="../pages/tkBoard.jsp";
</script>