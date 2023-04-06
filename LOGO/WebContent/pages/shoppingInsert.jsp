<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품리뷰작성</title>
<link rel="stylesheet" href="../CSS/shoppingInsert.css" />
</head>
<!--  -->
<body style="overflow-x: hidden">
	<jsp:include page="siteHead.jsp" />
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<h1>상품 리뷰</h1>
	<form method="post" action="../pages/shoppingInsert2.jsp"
		enctype="multipart/form-data">
		<section>
			<center>
				<table style="padding-top: 50px" align=center width=700 border=0
					cellpadding=2>
					<tr>
						<td bgcolor=white>
							<table class="table2">
								<tr>
									<td>작성자</td>
									<td><input type=text name="u_id" size=20></td>
								</tr>
								<tr>
									<td>제목</td>
									<td><input type=text name="pd_title" size=60></td>
								</tr>
								<tr>
									<td>내용</td>
									<td><textarea name="pd_comment" cols=85 rows=15></textarea></td>
								</tr>
								<tr>
									<td>파일첨부</td>
									<td><input type=file name="pd_image"
										required="required"></td>
								</tr>
								</td>
								</tr>
								</center>
							</table> <br> <br>
							</section>
							<center>
								<input class="write" type="submit" value="작성">
							</center>
							</form> <br> <br> <footer>
								<jsp:include page="siteFooter.jsp" />
							</footer>
</body>
</html>