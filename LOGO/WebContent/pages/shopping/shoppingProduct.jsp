<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ǰ���</title>
</head>
<body>
	<h2>��ǰ�۵��</h2>
	<form action=".so" method="get"
			enctype="multipart/form-data" name="">
	<table>
		<tr>
			<td><label>��ǰ��ȣ</label></td>
			<td><input type="text" name="pd_number" id=""
				required="required" /></td>
		</tr>
		<tr>
			<td><label>��ǰ�̸�</label></td>
			<td><input type="" name="pd_name" id="" required="required" /></td>
		</tr>
		<tr>
			<td><label for="">��ǰ����</label></td>
			<td><input type="file" name="pd_image" id="" required="required" /></td>
		</tr>
		<tr>
			<td><label for="">��ǰ������</label></td>
			<td><textarea id="" name="pd_detail" cols="40" rows="15"
					required="required"></textarea></td>
		</tr>
	</table>
	<input type="submit" value="���">&nbsp;&nbsp;
	<input type="reset" value="�ٽþ���" />
	</form>
</body>
</html>