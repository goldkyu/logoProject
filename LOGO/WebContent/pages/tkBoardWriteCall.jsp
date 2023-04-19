<%@ page language="java" contentType="text/html;charset =utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.util.*"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="write" class="ticketSystem.TkBoardDAO" />


<%

	String path = "file";
	
	int size = 10 * 1024 * 1024;
	
	String filename1 = "11";
	String filename2 = "22";
	String origfilename1 = "33";
	String origfilename2 = "44";


	Connection conn = null;
	Statement st = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/melon_music", "root", "1234");
		
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
			String pfm_id = rs.getString("pfm_id");
			String image = rs.getString("image");


			request.setAttribute("ID", u_id);
			request.setAttribute("TITLE", pfm_title);
			request.setAttribute("CONTENT", pfm_comment);
			request.setAttribute("PFMID", pfm_id);
			request.setAttribute("IMAGE", image);
			
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
%>

<html>
<body>
<form name="tkBoardUpdate.jsp" action="tkBoardUpdate.jsp" method="post">
	<input type="hidden" name="filename1" value="<%=filename1%>">
	<input type="hidden" name="origfilename1" value="<%=origfilename1%>">
</form>
<a href="#" onclick="javascript:tkBoardUpdate.jsp.submit()"></a>
</body>
</html>


<%
	RequestDispatcher disp = request.getRequestDispatcher("tkView.jsp");
	disp.forward(request, response);
%>









