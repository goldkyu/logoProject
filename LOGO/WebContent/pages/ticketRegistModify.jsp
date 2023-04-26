<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="vo.TicketInfo"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../CSS/ticketRegister.css" />
<title>공연정보수정.</title>

<script type="text/javascript">
	function modifyboard(){
		modifyform.submit();
	}
</script>
	
</head>
<%
	TicketInfo detailList = (TicketInfo)request.getAttribute("DetailList");
	String nowPage = (String)request.getAttribute("page");
%>
<body>
 <% request.setCharacterEncoding("utf-8"); %>
	<jsp:include page="siteHead.jsp" />

<section>
<div id="mainBox">
<h2>등록수정</h2>
	<form action="TicketModifypro.to" method="post" name = "modifyform" enctype="multipart/form-data">
	
	<table>
	<tr>
	<td>공연번호</td>
	<td><input type="hidden" name="p_code" value="<%=detailList.getP_code() %>"></td>
	</tr>

	<tr>
	<td>공연장명</td>
	<td><input type="text" name="ar_name" value="<%=detailList.getAr_name() %>"></td>
	</tr>
	
	<tr>
	<td>공연명</td>
	<td><input type="text" name="p_title" value="<%=detailList.getP_title() %>"></td>
	</tr>
	
	<tr>
	<td>장르</td>
	<td><input type="text" name="p_genre" value="<%=detailList.getP_genre() %>"></td>
	</tr>
	
	<tr>
	<td>관람등급</td>
	<td><input type="text" name="rating" value="<%=detailList.getRating() %>"></td>
	</tr>
	
	<tr>
	<td>공연시간</td>
	<td><input type="text" name="runningtime" value="<%=detailList.getRunningtime() %>"></td>
	</tr>
	
	
	<tr>
	<td>공연날짜</td>
	<td><input type="text" name="p_date" value="<%=detailList.getP_date() %>"></td>
	</tr>
	
	<tr>
	<td>공연가격</td>
	<td><input type="text" name="p_price" value="<%=detailList.getP_price() %>"></td>
	</tr>
	
	<tr>
	<td>출연자</td>
	<td><input type="text" name="p_cast" value="<%=detailList.getP_cast() %>"></td>
	</tr>
	
	<tr>
	<td>공연이미지</td>
	<td><input type="file" name="p_image" value="<%=detailList.getP_image() %>"></td>
	</tr>
	
	<tr>
	<td>공연상세정보</td>
	<td><input type="file" name="p_info" value="<%=detailList.getP_info() %>"></td>
	</tr>
	
	</table>
		<a href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp;
		<a href="javascript:history.go(-1)">[뒤로]</a>
		<a href="../pages/TicketDelete.to?P_code=<%=detailList.getP_code() %>&page=<%=nowPage%>">
			[삭제] </a>
	</form>

</div>
</section>

<footer>
	<jsp:include page="siteFooter.jsp" />
</footer>

</body>
</html>