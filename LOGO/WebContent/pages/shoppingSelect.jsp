<%@ page language="java" contentType="text/html;charset =utf-8"
	pageEncoding="utf-8"%>

<%@page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="writing" class="shopping.ShoppingBoardDAO" />



<%
	
	Connection conn = null;
	Statement st = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/melon_music", "root", "1234");
		//localhost:3306/테이블 이름, root, 비밀번호
		if (conn == null) {
			throw new Exception("데베 연결 없음");
		}
		String Pd_id = request.getParameter("Pd_id");
		st = conn.createStatement();
		ResultSet rs = st.executeQuery("select * from pd_review WHERE pd_id = '"+Pd_id+"';");
		
		while (rs.next()) {
			String u_id = rs.getString("u_id");
			String pd_title = rs.getString("pd_title");
			String pd_comment = rs.getString("pd_comment");


			request.setAttribute("U_ID", u_id);
			request.setAttribute("PD_TITLE", pd_title);
			request.setAttribute("PD_COMMENT", pd_comment);
			
		}
		
		
	} finally {
		try {
			st.close();
		} catch (Exception ignored) {
		}
	}
	try {
		conn.close();
	} catch (Exception ignored) {
	}

	RequestDispatcher disp = request.getRequestDispatcher("../pages/shoppingSelect2.jsp");
	disp.forward(request, response);
%>








