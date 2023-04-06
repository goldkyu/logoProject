<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html;charset =utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="writing" class="shopping.ShoppingBoardDAO" />
<%
	//String uploadPath = request.getRealPath("/WebContent/files");


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
		//localhost:3306/테이블 이름, root, 비밀번호
		if (conn == null) {
			throw new Exception("데베 연결 없음");
		}
		String Pd_id = request.getParameter("Pd_id");
		
		st = conn.createStatement();
		ResultSet rs = st.executeQuery("select * from pd_review WHERE pd_id = '" + Pd_id + "';");
		String pd_image = null;
		String u_id = null;
		while (rs.next()) {
			u_id = rs.getString("u_id");
			String pd_title = rs.getString("pd_title");
			String pd_comment = rs.getString("pd_comment");
			pd_image = rs.getString("pd_image");

			request.setAttribute("U_ID", u_id);
			request.setAttribute("PD_TITLE", pd_title);
			request.setAttribute("PD_COMMENT", pd_comment);
			request.setAttribute("PD_IMAGE", pd_image);
			request.setAttribute("PD_ID",Pd_id);
			

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
<form name="shoppingSelect2.jsp" action="shoppingSelect2.jsp" method="post">
	<input type="hidden" name="filename1" value="<%=filename1%>">
	<input type="hidden" name="origfilename1" value="<%=origfilename1%>">
</form>
<a href="#" onclick="javascript:shoppingSelect2.jsp.submit()"></a>
</body>
</html>


<%	RequestDispatcher disp = request.getRequestDispatcher("../pages/shoppingView.jsp");
disp.forward(request, response); %>




