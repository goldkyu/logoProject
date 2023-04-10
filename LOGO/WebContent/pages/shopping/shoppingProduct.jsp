<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품등록</title>
</head>
<body>
	<h2>상품글등록</h2>
	<form action=".so" method="get"
			enctype="multipart/form-data" name="">
	<table>
		<tr>
			<td><label>상품번호</label></td>
			<td><input type="text" name="pd_number" id=""
				required="required" /></td>
		</tr>
		<tr>
			<td><label>상품이름</label></td>
			<td><input type="" name="pd_name" id="" required="required" /></td>
		</tr>
		<tr>
			<td><label for="">상품사진</label></td>
			<td><input type="file" name="pd_image" id="" required="required" /></td>
		</tr>
		<tr>
			<td><label for="">상품상세정보</label></td>
			<td><textarea id="" name="pd_detail" cols="40" rows="15"
					required="required"></textarea></td>
		</tr>
	</table>
	<input type="submit" value="등록">&nbsp;&nbsp;
	<input type="reset" value="다시쓰기" />
	</form>
</body>
</html>