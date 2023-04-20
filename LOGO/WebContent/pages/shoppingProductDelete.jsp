<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%
	String pd_number = (String) request.getAttribute("Pd_number");
	String nowPage = (String) request.getAttribute("page");
%>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<script language=javascript>
		self.window.alert("삭제완료되었습니다.");
		location.href = "../pages/shoppingProductList.sh";
	</script>
</body>
</html>