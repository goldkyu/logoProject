<%@page import="vo.ShoppingProduct"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../CSS/shoppingProductList.css" />
<title>Insert title here</title>
</head>

<%
	String nowPage = (String) request.getAttribute("PAGE");
	ShoppingProduct shVO = (ShoppingProduct) request.getAttribute("SPVO");
%>
<body>
<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:include page="siteHead.jsp" />

	<section>
		<div id="mainBox">
	<h2>��������</h2>


	<img src="../file/<%=shVO.getPd_image()%>" width="150" height="250">
	<br>��ǰ�� :<%=shVO.getPd_name()%>
	<br> ��ǰ���� :<%=shVO.getPd_price()%>
	<br>���η� :<%=shVO.getDiscount()%>
	<br>��ۺ� :<%=shVO.getCharge()%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<img src="../file/<%=shVO.getPd_image()%>" width="500" height="750">
	<br>��ǰ������ :<%=shVO.getPd_detail()%>

	<section>
		<%-- <a
			href="boardReplyForm.bo?board_num=<%=shVO.getPd_number()%>&page=<%=nowPage%>">
			[�亯] </a> --%>
		<a	href="../pages/shoppingModifyForm.sh?Pd_number=<%=shVO.getPd_number()%>">[����] </a> 
		<a	href="../pages/shoppingDeleteForm.sh?Pd_number=<%=shVO.getPd_number()%>&page=<%=nowPage%>">	[����] </a>
		
		<a  href="../pages/shoppingProductList.sh?nowPage=<%=nowPage%>">[���]</a>&nbsp;&nbsp;
		
	</section>
		</div>
	</section>
<footer>
   <jsp:include page="siteFooter.jsp" />
</footer>
</body>
</html>