<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품리뷰작성</title>
<link rel="stylesheet" href="../CSS/shoppingInsert.css" />
</head>

<body style="overflow-x: hidden">
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:include page="siteHead.jsp" />
	<section>
		<div id="mainBox">
			<center><br><br><br>
			<h1>상품 리뷰</h1>
			</center>
			<form method="post" action="../pages/shoppingInsert2.jsp"
				enctype="multipart/form-data">
				<section>
					<center >
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
											<td><input type=file name="pd_image" required="required"></td>
										</tr>
										</td>
										</tr>
										</center>
									</table> <br> <br>
									</section>
									<center>
										<input class="write" type="submit" value="작성">
									</center>
									</form> <br> <br>
									</div>
									</section> <footer>
										<jsp:include page="siteFooter.jsp" />
									</footer>
</body>
</html>