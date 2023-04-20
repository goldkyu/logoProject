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
<title>��ǰ����Ʈ</title>
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
			<h2>��ǰ����Ʈ</h2>

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
						<td>��ǰ�̸�</td>
						<td><%=pageList.get(i).getPd_name()%></td>
					</tr>
					<tr>
						<td>��ǰ����</td>
						<td><%=pageList.get(i).getPd_price()%></td>
					</tr>
					<tr>
						<td>���η�</td>
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
				[����]&nbsp;
				<%
					} else {
				%>
				<a href="../pages/shoppingProductList.sh?page=<%=nowPage - 1%>">[����]</a>&nbsp;

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
				[����]
				<%
					} else {
				%>
				<a href="../pages/shoppingProductList.sh?page=<%=nowPage + 1%>">[����]</a>
				<%
					}
				%>
			</section>
			<%
				} else {
			%>
			<section id="emptyArea">��ϵ� ���� �����ϴ�.</section>
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