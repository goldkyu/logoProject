<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.apache.taglibs.standard.tag.el.fmt.ParseDateTag"%>
<%@page import="org.apache.taglibs.standard.tag.common.fmt.ParseDateSupport"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="in" class="ticketSystem.TkBoardDAO" />

<%

		String uploadPath = request.getRealPath("/file");
		
		int size = 10 * 1024 * 1024;
		
		String filename1 = "";
		String filename2 = "";
		String origfilename1 = "";
		String origfilename2 = "";
		
		String u_id = null;
		String pfm_title = null;
		String pfm_comment = null;
		String date = null;
		String image = null;
		
		try{
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8",
					new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();
			String file1 = (String) files.nextElement();
			filename1 = multi.getFilesystemName(file1);
			origfilename1 = multi.getOriginalFileName(file1);
			
		u_id = multi.getParameter("u_id");
		pfm_title = multi.getParameter("pfm_title");
		pfm_comment = multi.getParameter("pfm_comment");
		date = multi.getParameter("date");
		image  = origfilename1;
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	 	in.boardInsert(u_id, pfm_title, pfm_comment, image);

	 	request.setAttribute("ID", u_id);
		request.setAttribute("TITLE", pfm_title);
		request.setAttribute("CONTENT", pfm_comment);
		request.setAttribute("IMAGE", image);
		
	%>
	
	<form method="post" action="../pages/tkBoard.jsp">

		<script language=javascript>
			self.window.alert("입력한 글을 저장하였습니다.");
			location.href = "../pages/tkBoard.jsp";
		</script>

	</form>

</body>
</html>