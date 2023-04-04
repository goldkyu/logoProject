
<%@ page language="java" contentType="text/html;charset =utf-8"
pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.*" %>

<html>
  <head>
    <meta charset="utf-8" />
    <title>LOGO POST</title>
    <link rel="stylesheet" href="../CSS/board.css"/>
    <link rel="stylesheet" href="../CSS/boardCreate.css"/>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap"
        rel="stylesheet">
  </head>

  <body style="overflow-x: hidden;">
    <% request.setCharacterEncoding("utf-8"); %>
    <%@ page import="BoardSystem.*" %>
    
    <jsp:useBean id="dao" class="BoardSystem.BoardDAO">
      <!-- BoardDAO dao = new BoardDAO(); -->
        <%
            String pid = request.getParameter("pid");
            Board b = dao.showContent(Integer.parseInt(pid));
        %>
      
    <!-- 기본 골자는 boardCreate와 같으나, 기본값으로 원래 입력되어있던 값들을 가져옵니다.-->
    <jsp:include page="siteHead.jsp"/>
    <section>
        <article id="wrapper">
          <jsp:include page="boardFix.jsp" />
        <div id="board">
        <form action="boardUpdating.jsp"enctype="multipart/form-data" method="post">
            <input type="hidden" name="pid" id="" value="<%= pid %>">
            <select name="bid" id="bid">
                <option value="1" selected>유저 게시판</option>
            </select>
            
            <input type="text" name="pname" id="pname" placeholder="" value="<%= b.getPname() %>" maxlength="30">
            <textarea name="content" id="content" cols="30" rows="10"><%= b.getContent() %></textarea>
            <input type="file" name="file" >
            <input type="submit" value="작성 완료" name="" id="submit-btn">
      <!-- 업데이트용 서브페이지 boardUpdating.jsp로 전송합니다.-->
        </form>
</div>
    </article>
    </section>
    <jsp:include page="siteFooter.jsp"/>
</jsp:useBean>
  </body>
</html>