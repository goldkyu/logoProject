<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<body>
	<jsp:include page="musicHead.jsp"></jsp:include>
	<section style="width: 1000px; margin: 0 auto; margin-top: 200px;">
		<form action="musicPlayListCreate.mu" method="post">
			<input id="pl_name" type="text" name="pl_name"
				placeholder="플레이리스트 이름" /> <input id="pl-btn" type="submit"
				value="확인">
		</form>
		<c:if test="${userID == null }">
		로그인 해주세요~
		</c:if>
		<c:if test="${pl != null }">
			<ul>
				<c:forEach items="${pl }" var="pls">

					<li><a href="mypl.mu?pl_id=${pls.pl_id }&pl_name=${pls.pl_name}"><c:out
								value="${pls.pl_name}" /></a></li>

				</c:forEach>
			</ul>
		</c:if>
		<div></div>
	</section>

</body>

<script type="text/javascript">
	$("#pl-btn").attr("disabled", true);
	$("input[name=pl_name]").keyup(function() {
		$("#pl-btn").attr("disabled", false);
	});

	function nullCheck(val) {

		if (val === null)
			return true;
		if (typeof val === 'string' && val === '')
			return true;
		if (typeof val === 'undefined')
			return true;

		return false;

	}
</script>
</html>