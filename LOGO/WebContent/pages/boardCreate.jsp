<%@ page language="java" contentType="text/html;charset =utf-8"
pageEncoding="utf-8" %>
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
    <jsp:include page="siteHead.jsp"/>
    <section>
        <article id="wrapper">
          <jsp:include page="boardFix.jsp"/>
        <div id="board">


        <!--  게시판 번호(pid)와 게시 날짜(pdate)는 자바파일 BoardDAO.java에서 처리하기 때문에
              유저가 직접 입력하는 데이터는 게시글 제목, 게시글 내용, 게시판(현재는 유저 게시판밖에 없음) 입니다.-->
        <form action="boardCreating.jsp" enctype="multipart/form-data" method="post">
            <select name="bid" id="bid">
                <option value="1" selected>이벤트</option>
            </select>
            <input type="text" name="pname" id="pname" placeholder="제목" maxlength="30">
            <textarea name="content" id="content" cols="30" rows="10"></textarea>
            <input type="file" name="file" >
            <input type="submit" value="작성 완료" name="" id="submit-btn">
        <!-- 입력을 완료하면 자바 메소드를 호출하는 서브페이지 boardCreating.jsp로 전송합니다. -->
        </form>


      </div>
    </article>
    </section>
    <jsp:include page="siteFooter.jsp"/>
  </body>sdsds
</html>