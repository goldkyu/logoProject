
<%@page import="org.apache.taglibs.standard.tag.el.fmt.ParseDateTag"%>
<%@page import="org.apache.taglibs.standard.tag.common.fmt.ParseDateSupport"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		String u_id = request.getParameter("u_id");
		String pd_title = request.getParameter("pd_title");
		String pd_comment = request.getParameter("pd_comment");
		String date = request.getParameter("date");
		writing.reviewInsert(u_id, pd_title, pd_comment);

		request.setAttribute("ID", u_id);
		request.setAttribute("TITLE", pd_title);
		request.setAttribute("CONTENT", pd_comment);
		
	%>
	<form method="post" action="../pages/shoppingBoard.jsp">

		<script language=javascript>
			self.window.alert("입력한 글을 저장하였습니다.");
			location.href = "../pages/shoppingBoard.jsp";
		</script>

	</form>
</body>
</html>