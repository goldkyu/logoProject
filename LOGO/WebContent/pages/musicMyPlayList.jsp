<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="musicHead.jsp"></jsp:include>
	<section style="width: 1000px; margin: 0 auto; margin-top: 200px;">
		<form action="musicPlayListCreate.mu" method="post">
			<input type="text" name="pl_name" placeholder="플레이리스트 이름" /> <input
				type="submit" value="확인">
		</form>
		<div></div>
	</section>

</body>
</html>