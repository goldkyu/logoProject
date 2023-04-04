<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="org.apache.taglibs.standard.tag.el.fmt.ParseDateTag"%>
<%@page import="org.apache.taglibs.standard.tag.common.fmt.ParseDateSupport"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="in" class="ticketSystem.TkBoardDAO" />

<%
		String u_id = request.getParameter("u_id");
		String pfm_title = request.getParameter("pfm_title");
		String pfm_comment = request.getParameter("pfm_comment");
		String date = request.getParameter("date");
	
	 	in.boardInsert(u_id, pfm_title, pfm_comment);

	 	request.setAttribute("ID", u_id);
		request.setAttribute("TITLE", pfm_title);
		request.setAttribute("CONTENT", pfm_comment);
		
	%>
	<form method="post" action="../pages/tkBoard.jsp">

		<script language=javascript>
			self.window.alert("입력한 글을 저장하였습니다.");
			location.href = "../pages/tkBoard.jsp";
		</script>

	</form>

</body>
</html>