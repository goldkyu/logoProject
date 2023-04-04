<%@ page language="java" contentType="text/html;charset =utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.*"%>

<html>
<head>
<meta charset="utf-8" />
<title>LOGO POST</title>
<link rel="stylesheet" href="../CSS/board.css" />
<link rel="stylesheet" href="../CSS/boardCreate.css" />
<link rel="stylesheet" href="../CSS/boardPost.css" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
</head>

<body style="overflow-x: hidden">
	<%
	request.setCharacterEncoding("utf-8");
	%>
	<%@ page import="BoardSystem.*"%>
	<jsp:include page="siteHead.jsp" />
	<section style="margin-top: 170px">
		<jsp:include page="boardFix.jsp" />
		<div id="board">
			<jsp:useBean id="dao" class="BoardSystem.BoardDAO">
				<!-- BoardDAO dao = new BoardDAO(); -->
				<%
				String pid = request.getParameter("pid");
				Board post = dao.showContent(Integer.parseInt(pid));

				// 유저가 선택한 게시글의 pid를 가져와, showContent메소드를 사용합니다.
				%>
				<!-- pid는 String 형태이기 때문에, parseInt로 int 형변환을 해줍니다.-->

				<p id="post-title"><%=post.getPname()%></p>
				<div id="post-info">
					<p id="post-date"><%=post.getPdate()%></p>
					<p id="post-user"><%=post.getUid()%></p>
				</div>
				<div id="post-content">

					<p>
						<img id="post-image" src="../file/<%=post.getFile()%>" alt="">
					</p>
					<p><%=post.getContent()%></p>


				</div>
				<%
				if (post.getUid().equals(session.getAttribute("userID"))) {
				%>
				<!-- 삭제와 수정 서브 페이지는 모두 request Parameter로 pid를 다시 가져갑니다.-->
				<button class="post-btn"
					onclick="location.href='boardDelete.jsp?pid=<%=pid%>';">
					삭제</button>
				<button class="post-btn"
					onclick="location.href='boardUpdate.jsp?pid=<%=pid%>';">
					수정</button>
				<%
				}
				%>
			</jsp:useBean>
		</div>
	</section>
	<jsp:include page="siteFooter.jsp" />
</body>
</html>
