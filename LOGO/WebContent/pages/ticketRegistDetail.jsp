<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="vo.TicketInfo"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../CSS/ticketRegistDetail.css" />
<title>공연상세정보</title>
</head>
<%
	TicketInfo detailList = (TicketInfo)request.getAttribute("DetailList");
	String nowPage = (String)request.getAttribute("Page");
%>

<body>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:include page="siteHead.jsp" />
<section>
<div id="mainBox">

<h3>상세페이지</h3>

공연명:  <%=detailList.getP_title() %><br>
공연장명: <%=detailList.getAr_name() %><br>
공연가격: <%=detailList.getP_price() %><br>
출연자: <%=detailList.getP_cast() %><br>
장르: <%=detailList.getP_genre() %><br>
관람등급: <%=detailList.getRating() %><br>
공연시간: <%=detailList.getRunningtime() %><br>
공연날짜: <%=detailList.getP_date() %><br>
썸네일: <img src="../file/<%=detailList.getP_image() %>"><br>
상세정보: <img src="../file/<%=detailList.getP_info() %>"><br>


<div>
<a href="../pages/TicketModify.to?P_code=<%=detailList.getP_code() %>">[수정] </a>
<a href="../pages/TicketList.to">[목록]</a>
</div>

</div>
</section>
<footer>
<jsp:include page="siteFooter.jsp" />
</footer>
</body>
</html>