<%@ page language="java" contentType="text/html;charset =utf-8"
pageEncoding="utf-8" %>
<%@page import="java.sql.*" %>
<%
        //session 속성은 String으로 형 변환
        String id = (String)session.getAttribute("userID");
        Connection conn = null;
        Statement st = null;
        String uid = "";
        String userName = "";
        String uBirth = "";
        String uEmail = "";
        String uAddr = "";
        String uJoin = "";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/melon_music", "root", "okek8277");
            if (conn == null) {
                throw new Exception("데베 연결 없음");
            }
            st = conn.createStatement();

            ResultSet rs = st.executeQuery("select * from u_information where u_id = '" + id + "';");
            if (rs.next()) {
                userName = rs.getString("u_name");
                uid = rs.getString("u_id");
                uEmail = rs.getString("u_email");
            }
        }
        finally{
            try {
                st.close();
            } catch (Exception ignored) {
            }
        }try {
            conn.close();
        } catch (Exception ignored) {
        }

        %>

        <!-- 페이지 왼쪽에 떠있는 로그인상태/글쓰기/전체 글 보기/내 글 보기 버튼 -->
        <div id="fixed-box">
            <% if (uid.equals("")) { %>
            <!-- 로그인 되어있는 상태를 Session Attribute("userID")의 유무로 구별합니다. -->
            <p>Guest Login</p>
            <p><a href="login.jsp?from=<%= request.getRequestURL() %>" style="color: whitesmoke;">Log In</a></p>
            <div class="myPost">
                <a href="board.jsp"><button style="width: 200px;">전체 글</button></a>
                
            </div>
                
            <% } else { %> 
            <p>Now Online</p>
            <p><%= uid %> </p>
            <div class="myPost">
                <a href="board.jsp"><button>전체 글</button></a><a href="boardSearch.jsp?category=0&pname=<%= uid %>"><button>내 글</button></a>
            </div>
            <a href="boardCreate.jsp"><img id="write-img" src="../image/pen.png" alt=""></a>
            <% } %>
        </div>