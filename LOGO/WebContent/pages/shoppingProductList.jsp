<%@page import="vo.PageInfo"%>
<%@page import="vo.ShoppingProduct"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../CSS/shoppingProductList.css" />
<title>상품리스트</title>
</head>
<%
	ArrayList<ShoppingProduct> pageList = (ArrayList<ShoppingProduct>) request.getAttribute("List");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int nowPage = pageInfo.getNowPage();
	int count = 0;
%>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:include page="siteHead.jsp" />

	<section>
		<div id="mainBox">
			<h2>상품리스트</h2>

			<table>
				<%
					if (pageList != null && listCount > 0) {
				%>
				<%
					for (int i = 0; i < pageList.size(); i++) {
				%>
				<input type="hidden" name="Pd_number"
					value="<%=pageList.get(i).getPd_number()%>" />
				<td>
				<th><br> <a
					href="../pages/shoppingDetail.sh?Pd_number=<%=pageList.get(i).getPd_number()%>">
						<img src="../file/<%=pageList.get(i).getPd_image()%>">
				</a><br> <%=pageList.get(i).getPd_name()%><br> <%=pageList.get(i).getPd_price()%>원<br>
				</th>
				</td>
				<%
					if (i % 5 == 4) {
								out.print("</tr><tr>");
							}
				%>

				<%
					}
				%>
			</table>


			<section>
			<center>
				<%
					if (nowPage <= 1) {
				%>
				[이전]&nbsp;
				<%
					} else {
				%>
				<a href="../pages/shoppingProductList.sh?page=<%=nowPage - 1%>">[이전]</a>&nbsp;
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
				<a href="../pages/shoppingProductList.sh?page=<%=a%>">[<%=a%>]
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
				<a href="../pages/shoppingProductList.sh?page=<%=nowPage + 1%>">[다음]</a>
				<%
					}
				%>

			</section>
			<%
				} else {
			%>
			<section id="emptyArea">등록된 글이 없습니다.</section>
			<%
				}
			%>
			</center>
</section>
		</div>
		<br>

	<footer>
		<jsp:include page="siteFooter.jsp" />
	</footer>
</body>
</html>