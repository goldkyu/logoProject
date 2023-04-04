<%@page import="java.util.Enumeration"%>
<%@page import="org.apache.taglibs.standard.tag.el.fmt.ParseDateTag"%>
<%@page
	import="org.apache.taglibs.standard.tag.common.fmt.ParseDateSupport"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="writing" class="shopping.ShoppingBoardDAO" />

	<%
		String uploadPath = request.getRealPath("/file");

		int size = 10 * 1024 * 1024;
		
		String filename1 = "11";
		String filename2 = "22";
		String origfilename1 = "33";
		String origfilename2 = "44";

		String u_id = null;
		String pd_title = null;
		String pd_comment = null;
		String date = null;
		String pd_image = null;
		String pd_id = null;

		try {
			
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8",
					new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();
			String file1 = (String) files.nextElement();
			filename1 = multi.getFilesystemName(file1);
			origfilename1 = multi.getOriginalFileName(file1);

			u_id = multi.getParameter("u_id");
			pd_title = multi.getParameter("pd_title");
			pd_comment = multi.getParameter("pd_comment");
			date = multi.getParameter("date");
			pd_image = origfilename1;
			pd_id = multi.getParameter("pd_id");

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		writing.reviewInsert(u_id, pd_title, pd_comment, pd_image);

		request.setAttribute("ID", u_id);
		request.setAttribute("TITLE", pd_title);
		request.setAttribute("CONTENT", pd_comment);
		request.setAttribute("PD_ID", pd_id);
	%>

	<form method="post" action="../pages/shoppingBoard.jsp">

		<script language=javascript>
			self.window.alert("입력한 글을 저장하였습니다.");
			location.href = "../pages/shoppingBoard.jsp";
		</script>

	</form>
</body>
</html>