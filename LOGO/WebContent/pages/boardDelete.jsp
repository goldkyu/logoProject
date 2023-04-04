<%@ page language="java" contentType="text/html;charset =utf-8"
pageEncoding="utf-8" %>
<%@ page import="BoardSystem.*" %>
<jsp:useBean id="dao" class="BoardSystem.BoardDAO">
    <!-- BoardDAO dao = new BoardDAO(); -->
    <%
        // 삭제를 선택한 게시글의 pid를 가져옵니다.
        int pid = Integer.parseInt(request.getParameter("pid"));

        dao.deletePost(pid);

        response.sendRedirect("board.jsp");
    %>
</jsp:useBean>