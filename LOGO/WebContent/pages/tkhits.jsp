<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="ticketSystem.*" %>

<jsp:useBean id="dao" class="ticketSystem.TkBoardDAO" />
    
    <%
    String pfm_id = request.getParameter("Pfm_id");
   	dao.hitsUpdate(pfm_id);
        

    %>
     <script language=javascript> 
    location.href="../pages/tkBoard.jsp";
</script>