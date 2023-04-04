<%@ page language="java" contentType="text/html;charset =utf-8"
pageEncoding="utf-8" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>LOGO POST</title>
    <link rel="stylesheet" href="../CSS/board.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap"
        rel="stylesheet">
  </head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <body style="overflow-x: hidden">
    <% request.setCharacterEncoding("utf-8"); %>
    
    
    <jsp:include page="siteHead.jsp"/>
    <section>
    <article id="wrapper">

        <!-- 페이지 왼쪽에 떠있는 로그인상태/글쓰기/전체 글 보기/내 글 보기 버튼 -->
        <jsp:include page="boardFix.jsp" />

        <!-- 게시판 -->
        <div id="board">
            <div id="board-title"> <h1 style="font-size: 70px; text-align: center; padding-bottom: 30px;">EVENT</h1>  </div>
            
            <!-- BoardSystem 패키지의 모든 클래스 import-->
            <%@ page import="BoardSystem.*" %>
            <%@ page import="java.util.ArrayList" %>
            <table id="board-table">
                <th>NO.</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            
            <jsp:useBean id="board" class="BoardSystem.BoardDAO">
            <!-- BoardDAO board = new BoardDAO();-->
                <%
                
                {
                    ArrayList<Board> posts = board.showPost();
                    // 페이지에서 보여줄 post들을 저장하는 ArrayList
                    for(Board post : posts){
                        int pid = post.getPid();
                        %>
                        <tr>
                        <td><%= post.getPid() %></td>
                        <td><a href="boardPost.jsp?pid=<%= pid %>"><%= post.getPname() %></a></td>
                        <!-- 각 Post별 페이지는 url 뒤에 ?pid=숫자 형태입니다. -->
                        <td><%= post.getUid() %></td>
                        <td><%= post.getPdate() %></td>
                    </tr>
                        <%
                        }
                    }
                %>
            </jsp:useBean>
        </table>
        <div id="board-search">
            <!-- 검색을 위한 서브페이지 boardSearch.jsp로 보내는 form-->
            <form action="boardSearch.jsp">
            <select name="category" id="">
                <option value="1">제목</option>
                <option value="2">유저 ID</option>
                <option value="3">제목 + 내용</option>
            </select>
            <input type="text" name="keyword" id="search-text">
            <input type="submit" name="" id="search-btn" value="검색">
            </form>
        </div>
        </div>
        
    </article>
    </section>
    <jsp:include page="siteFooter.jsp"/>
    

  </body>
</html>