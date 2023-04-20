<%@page import="vo.ShoppingProduct"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="../CSS/shoppingProductList.css" />
<title>Insert title here</title>

<%
	ShoppingProduct spVO = (ShoppingProduct) request.getAttribute("SPVO");
%>
<script type="text/javascript">
	function modifyProduct() {
		modifyform.submit();
	}
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:include page="siteHead.jsp" />

	<section>
		<div id="mainBox">

			<h2>상품등록수정</h2>
			<form action="../pages/shoppingModify.sh" method="post"
				name="modifyform">
				<input type="hidden" name="Pd_number"
					value="<%=spVO.getPd_number()%>" />
				<table>
					<tr>
						<td><label>상품이름</label></td>
						<td><input type="" name="pd_name" id=""
							value="<%=spVO.getPd_name()%>" /></td>
					</tr>
					<tr>
						<td><label for="">상품가격</label></td>
						<td><input type="text" name="pd_price" id=""
							value="<%=spVO.getPd_price()%>" /></td>
					</tr>
					<tr>
						<td><label for="">수량</label></td>
						<td><input type="text" name="pd_amount" id=""
							value="<%=spVO.getPd_amount()%>" /></td>
					</tr>
					<tr>
						<td><label for="">상품사진</label></td>
						<td><input type="file" name="pd_image" id=""
							value="<%=spVO.getPd_image()%>" /></td>
					</tr>
					<tr>
						<td><label for="">상품상세정보</label></td>
						<td><textarea id="" name="pd_detail" cols="40" rows="15"
								required="required"><%=spVO.getPd_detail()%></textarea></td>
					</tr>
					<tr>
						<td><label for="">할인률</label></td>
						<td><input type="text" name="discount" id=""
							value="<%=spVO.getDiscount()%>" /></td>
					</tr>
					<tr>
						<td><label for="">배송비</label></td>
						<td><input type="text" name="charge" id=""
							value="<%=spVO.getCharge()%>" /></td>
					</tr>
					</center>
				</table>
				<section id="">
					<a href="javascript:modifyProduct()">[수정]</a>&nbsp;&nbsp; <a
						href="javascript:history.go(-1)">[뒤로]</a>
				</section>
			</form>

		</div>
	</section>
	<footer>
		<jsp:include page="siteFooter.jsp" />
	</footer>

</body>
</html>