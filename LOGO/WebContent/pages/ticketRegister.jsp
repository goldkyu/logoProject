<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="../CSS/ticketRegister.css" />
<title>공연등록</title>
</head>

<body>
 <% request.setCharacterEncoding("utf-8"); %>
	<jsp:include page="siteHead.jsp" />

<section>
<div id="mainBox">
	<h2>공연등록</h2>
	<form action="TicketWritePro.to" method="post" enctype="multipart/form-data">
	
	<table>
	<tr>
	<td>공연번호</td>
	<td><input type="text" name="p_code" ></td>
	</tr>

	<tr>
	<td>공연장명</td>
	<td><input type="text" name="ar_name" ></td>
	</tr>
	
	<tr>
	<td>공연명</td>
	<td><input type="text" name="p_title" ></td>
	</tr>
	
	<tr>
	<td>장르</td>
	<td><input type="text" name="p_genre"></td>
	</tr>
	
	<tr>
	<td>관람등급</td>
	<td><input type="text" name="rating"></td>
	</tr>
	
	<tr>
	<td>공연시간</td>
	<td><input type="text" name="runningtime"></td>
	</tr>
	
	
	<tr>
	<td>공연날짜</td>
	<td><input type="text" name="p_date"></td>
	</tr>
	
	<tr>
	<td>공연가격</td>
	<td><input type="text" name="p_price"></td>
	</tr>
	
	<tr>
	<td>출연자</td>
	<td><input type="text" name="p_cast"></td>
	</tr>
	
	<tr>
	<td>공연이미지</td>
	<td><input type="file" name="p_image"></td>
	</tr>
	
	<tr>
	<td>공연상세정보</td>
	<td><input type="file" name="p_info"></td>
	</tr>
	
	</table>
		<input type="submit" value="등록">&nbsp;&nbsp;
		<input	type="reset" value="다시쓰기" />
	</form>
</div>
</section>

<footer>
	<jsp:include page="siteFooter.jsp" />
</footer>

</body>
</html>