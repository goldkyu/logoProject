<%@ page language="java" contentType="text/html;charset =utf-8"
pageEncoding="utf-8" %>
<%@ page import="java.util.*"%>
<%@page import="vo.TicketInfo"%>

<%
   String p_code = (String) request.getAttribute("P_code");
   String nowPage = (String) request.getAttribute("page");
%>

     <script language=javascript> 
   self.window.alert("삭제완료되었습니다.");
    location.href="../pages/TicketList.to";
</script>
