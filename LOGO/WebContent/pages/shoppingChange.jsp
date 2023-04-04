<%@ page language="java" contentType="text/html;charset =utf-8"
pageEncoding="utf-8" %>

<%@page import="java.sql.*" %>
<% 
		String id = request.getParameter("u_id");
        String title = request.getParameter("title");
        String comment = request.getParameter("comment");
        
		System.out.println(id);
		System.out.println(title);
		System.out.println(comment);
		
        Connection conn = null;
        Statement st = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/melon_music", "root", "1234");
            if (conn == null) {
                throw new Exception("데베 연결 없음");
            }
            st = conn.createStatement();
            String command = String.format("update pd_review set pd_title = '"+title+"', pd_comment := '"+comment+"' where u_id = '"+id+"';", title,comment,id);
            int rowNum = st.executeUpdate(command);
            if(rowNum < 1){
                throw new Exception("데이터 입력 실패?");
            }
            }finally{
                try {
                    st.close();
                } catch (Exception ignored) {
                }
            }try {
                conn.close();
            } catch (Exception ignored) {
            }
            RequestDispatcher disp = request.getRequestDispatcher("../pages/shoppingChange2.jsp");
            disp.forward(request,response);
            
%>

