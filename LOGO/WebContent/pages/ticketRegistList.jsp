<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="vo.TicketInfo"%>
<%@page import="vo.TicketPageInfo"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../CSS/ticketRegistDetail.css" />
<title>공연등록리스트</title>
</head>
<%
	ArrayList<TicketInfo> articleList = (ArrayList<TicketInfo>) request.getAttribute("ArticleList");
	TicketPageInfo pageInfo = (TicketPageInfo) request.getAttribute("PageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
%>

<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:include page="siteHead.jsp" />

	<section>
		<div id="mainBox">
			
			<table>

				<%
					if (articleList != null && listCount > 0) {
				%>

				<%
					for (int i = 0; i < articleList.size(); i++) {
				%>
				
				<tr>
					<td>공연이미지</td>
					<td><a href = "../pages/TicketDetail.to?P_code=<%=articleList.get(i).getP_code()%>">
					<img src="../file/<%=articleList.get(i).getP_image() %>"></td>
				</tr>
				
				<tr>
					<td>공연명</td>
					<td><%=articleList.get(i).getP_title()%></td>
				</tr>
				
				<tr>
					<td>공연날짜</td>
					<td><%=articleList.get(i).getP_date()%></td>
				</tr>
				
				<tr>
					<td>공연장명</td>
					<td><%=articleList.get(i).getAr_name()%></td>
				</tr>

				<%
					}
				%>

			</table>

		<div>
				<%
					if (nowPage <= 1) {
				%>
				[이전]&nbsp;
				<%
					} else {
				%>
				<a href="TicketList.to?page=<%=nowPage - 1%>">[이전]</a>&nbsp;
				<%
					}
				%>

				<%
					for (int a = startPage; a <= endPage; a++) {
							if (a == nowPage) {
				%>
				[<%=a%>]
				<%
					} else {
				%>
				<a href="TicketList.to?page=<%=a%>">[<%=a%>]
				</a>&nbsp;
				<%
					}
				%>
				<%
					}
				%>

				<%
					if (nowPage >= maxPage) {
				%>
				[다음]
				<%
					} else {
				%>
				<a href="TicketList.to?page=<%=nowPage + 1%>">[다음]</a>
				<%
					}
				%>
			</div>
			<%
				} else {
			%>
			<dvi>등록된 글이 없습니다.</div>
			<%
				}
			%>

		</div>
	</section>

	<footer>
		<jsp:include page="siteFooter.jsp" />
	</footer>

</body>
</html>