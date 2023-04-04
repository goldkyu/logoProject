<%@page import="shopping.ShoppingBoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shopping.ShoppingBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑페이지 게시판</title>
<link rel="stylesheet" href="../CSS/shoppingBoard.css" />
</head>
<body style="overflow-x: hidden">
	<jsp:include page="siteHead.jsp" />
	<jsp:useBean id="dto" class="shopping.ShoppingBoardDAO" />
	
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<%
		ArrayList<ShoppingBoardDTO> result = dto.reviewSelect();
	%>
	
	<div id="wrapper">
	<div id="mainBox">
	<section>
		<form method="get" action="../pages/shoppingInsert.jsp">
			<br><h1 style="margin-left: 150px;">REVIEW</h1>
			<br>
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>아이디</th>
						 <th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (ShoppingBoardDTO d : result) {
					%>
					<tr>
						<td><%=d.getPd_id()%></td>
						<td><a href="../pages/shoppingSelect.jsp?Pd_id=<%=d.getPd_id()%>"> <%=d.getPd_title()%></td></a>
						<td><%=d.getU_id()%></td>
						<td><%=d.getDate()%></td>
						<td><%=d.getHits()%></td>

						

					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<br><input style="margin-left: 1250px;"  type="submit" value="글쓰기" class="write">
</section>
		</form></div></div>
		<br>
			<jsp:include page="siteFooter.jsp" />
</body>
</html>
</body>
</html>