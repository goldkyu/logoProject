<%@ page language="java" contentType="text/html;charset =utf-8"
pageEncoding="utf-8" %>

<%@page import="java.sql.*" %>
<% 
		String uid = request.getParameter("u_id");
        String pfmtitle = request.getParameter("pfmtitle");
        String pfmcomment = request.getParameter("pfmcomment");
     
        
        System.out.println(uid);
		System.out.println(pfmtitle);
		System.out.println(pfmcomment);
			
        Connection conn = null;
        Statement st = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/melon_music?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false", "root", "okek8277");
            if (conn == null) {
                throw new Exception("데베 연결 없음");
            }
            st = conn.createStatement();
            String command = String.format("update pfm_review set pfm_title = '"+pfmtitle+"', pfm_comment := '"+pfmcomment+"' where u_id = '"+uid+"';", pfmtitle,pfmcomment,uid);
        
            int rowNum = st.executeUpdate(command);
            if(rowNum < 1){
                throw new Exception("데이터 입력 실패");
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
             RequestDispatcher disp = request.getRequestDispatcher("../pages/tkBoardUpdate2.jsp");
            disp.forward(request,response);
            
%>
