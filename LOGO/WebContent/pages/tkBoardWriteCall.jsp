<%@ page language="java" contentType="text/html;charset =utf-8"
	pageEncoding="utf-8"%>

<%@page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="write" class="ticketSystem.TkBoardDAO" />


<%
	Connection conn = null;
	Statement st = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/melon_music", "root", "okek8277");
		
		if (conn == null) {
			throw new Exception("연결 없음");
		}
		String Pfm_id = request.getParameter("Pfm_id");
		st = conn.createStatement();
		ResultSet rs = st.executeQuery("select * from pfm_review WHERE pfm_id = '"+Pfm_id+"';");
		
		while (rs.next()) {
			String u_id = rs.getString("u_id");
			String pfm_title = rs.getString("pfm_title");
			String pfm_comment = rs.getString("pfm_comment");


			request.setAttribute("ID", u_id);
			request.setAttribute("TITLE", pfm_title);
			request.setAttribute("CONTENT", pfm_comment);
			
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

	RequestDispatcher disp = request.getRequestDispatcher("../pages/tkBoardUpdate.jsp");
	disp.forward(request, response);
%>









