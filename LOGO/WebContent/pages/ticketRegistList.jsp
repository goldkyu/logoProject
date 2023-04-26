<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="vo.TicketInfo"%>
<%@page import="vo.TicketPageInfo"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../CSS/ticketRegistList.css" />
<title>공연등록리스트</title>
</head>

<%
	ArrayList<TicketInfo> articleList = (ArrayList<TicketInfo>) request.getAttribute("ArticleList");
	TicketPageInfo pageInfo = (TicketPageInfo) request.getAttribute("PageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getNowPage();
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
			<div class="text01">TICKET</div>
			<table class="container">
			
 			
				<%
					if (articleList != null && listCount > 0) {
				%>


				<%
					for (int i = 0; i < articleList.size(); i++) {
						
				%>
				
				
				<td>
				<th>
				<a href="../pages/TicketDetail.to?P_code=<%=articleList.get(i).getP_code()%>">
						<img src="../file/<%=articleList.get(i).getP_image() %>"></a><br><br>
						<%=articleList.get(i).getP_title()%><br>
						<%=articleList.get(i).getP_date()%><br>
						<%=articleList.get(i).getAr_name()%><br><br><br>
 				</th>
				</td>


				<%if(i % 4 == 3) {out.println("</tr><tr>");} %>
				
				<%
					}
				%>
				
			</table>

			<div>
			<center>
				<%
					if (nowPage <= 1) {
				%>
				[이전]&nbsp;
				<%
					} else {
				%>
				<a href="../pages/TicketList.to?page=<%=nowPage - 1%>">[이전]</a>&nbsp;
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
				<a href="../pages/TicketList.to?page=<%=a%>">[<%=a%>]</a>&nbsp;
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
				<a href="../pages/TicketList.to?page=<%=nowPage + 1%>">[다음]</a>
				<%
					}
				%>
			</center>	
			</div>
			<%
				} else {
			%>
			<dvi>등록된 글이 없습니다
		</div>
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