<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../CSS/shoppingProduct.css" />
<title>상품등록</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:include page="siteHead.jsp" />

	<section>
		<div id="mainBox">
			<center>
				<h2>상품글등록</h2>
				<form action="../pages/shoppingProductWrite.sh" method="post"
					enctype="multipart/form-data" name="">
					<table>
						<tr>
							<td><label>상품번호</label></td>
							<td><input type="text" name="Pd_number" id=""
								required="required" /></td>
						</tr>
						<tr>
							<td><label>상품이름</label></td>
							<td><input type="" name="pd_name" id="" required="required" /></td>
						</tr>
						<tr>
							<td><label for="">상품가격</label></td>
							<td><input type="text" name="pd_price" id=""
								required="required" /></td>
						</tr>
						<tr>
							<td><label for="">수량</label></td>
							<td><input type="text" name="pd_amount" id=""
								required="required" /></td>
						</tr>
						<tr>
							<td><label for="">상품사진</label></td>
							<td><input type="file" name="pd_image" id=""
								required="required" /></td>
						</tr>
						<tr>
							<td><label for="">상품상세정보</label></td>
							<td><textarea id="" name="pd_detail" cols="40" rows="15"
									required="required"></textarea></td>
						</tr>
						<tr>
							<td><label for="">조회수</label></td>
							<td><input type="text" name="count" id=""
								required="required" /></td>
						</tr>
						<tr>
							<td><label for="">배송비</label></td>
							<td><input type="text" name="charge" id=""
								required="required" /></td>
						</tr>
						</center>
					</table>
					<input type="submit" value="등록">&nbsp;&nbsp; <input
						type="reset" value="다시쓰기">
				</form>
		</div>
	</section>

	<footer>
		<jsp:include page="siteFooter.jsp" />
	</footer>

</body>
</html>