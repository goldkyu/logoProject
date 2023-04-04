<%@ page language="java" contentType="text/html;charset =utf-8"
pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

  <body style="overflow-x: hidden">
    <% request.setCharacterEncoding("utf-8"); %>
    
    
    <jsp:include page="siteHead.jsp"/>
    <section>
    <article id="wrapper">
        <jsp:include page="boardFix.jsp" />
        <div id="board">
            <%@ page import="BoardSystem.*" %>
            <%@ page import="java.util.ArrayList" %>
            <table id="board-table">
                <th>NO.</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            <jsp:useBean id="board" class="BoardSystem.BoardDAO">
                <!-- 이전 페이지에서 선택한 검색 카테고리가 무엇인지에 따라, 사용되는 메소드가 다릅니다.-->
                <%
                    String keyword = request.getParameter("keyword");
                    if(request.getParameter("category").equals("1")){   // 카테고리 1 - 제목으로 검색
                    ArrayList<Board> posts = board.searchPost(keyword);
                    for(Board post : posts){
                        int pid = post.getPid();
                        %>
                        <tr>
                        <td><%= post.getPid() %></td>
                        <td><a href="boardPost.jsp?pid=<%= pid %>"><%= post.getPname() %></a></td>
                        <td><%= post.getUid() %></td>
                        <td><%= post.getPdate() %></td>
                    </tr>
                        <%
                    }
                }
                else if(request.getParameter("category").equals("2")){   // 카테고리 2 - 유저 ID로 검색
                ArrayList<Board> posts = board.searchPostByUid(keyword);
                    for(Board post : posts){
                        int pid = post.getPid();
                        %>
                        <tr>
                        <td><%= post.getPid() %></td>
                        <td><a href="boardPost.jsp?pid=<%= pid %>"><%= post.getPname() %></a></td>
                        <td><%= post.getUid() %></td>
                        <td><%= post.getPdate() %></td>
                    </tr>
                        <%
                    }
                }
                else if(request.getParameter("category").equals("3")){   // 카테고리 3 - 제목 + 내용으로 검색
                    ArrayList<Board> posts = board.searchPostByCon(keyword);
                        for(Board post : posts){
                            int pid = post.getPid();
                            %>
                            <tr>
                            <td><%= post.getPid() %></td>
                            <td><a href="boardPost.jsp?pid=<%= pid %>"><%= post.getPname() %></a></td>
                            <td><%= post.getUid() %></td>
                            <td><%= post.getPdate() %></td>
                        </tr>
                            <%
                        }
                    }else if(request.getParameter("category").equals("0")){   // 카테고리 0은 검색이 아니고, 좌측 메뉴에서 선택한 '내 글 보기' 옵션 전용입니다.
                        ArrayList<Board> posts = board.searchPostByMyId((String)session.getAttribute("userID"));
                            for(Board post : posts){
                                int pid = post.getPid();
                                %>
                                <tr>
                                <td><%= post.getPid() %></td>
                                <td><a href="boardPost.jsp?pid=<%= pid %>"><%= post.getPname() %></a></td>
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