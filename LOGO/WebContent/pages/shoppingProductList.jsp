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
					if (pageList != null) {
				%>
				<%
					for (int i = 0; i < pageList.size(); i++) {
				%>
				<thead>
					<input type="hidden" name="Pd_number"
						value="<%=pageList.get(i).getPd_number()%>" />
					<tr>
						<td><a
							href="../pages/shoppingDetail.sh?Pd_number=<%=pageList.get(i).getPd_number()%>">
								<img src="../file/<%=pageList.get(i).getPd_image()%>"
								width="150" height="250"></td>
					</tr>
					<tr>
						<td>상품이름</td>
						<td><%=pageList.get(i).getPd_name()%></td>
					</tr>
					<tr>
						<td>상품가격</td>
						<td><%=pageList.get(i).getPd_price()%></td>
					</tr>
					<tr>
						<td>할인률</td>
						<td><%=pageList.get(i).getDiscount()%></td>
					</tr>
				<thead>
					<%
						}
					%>
				
			</table>

			<section>
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
		</div>
	</section>
	
	<footer>
		<jsp:include page="siteFooter.jsp" />
	</footer>

</body>

</html>