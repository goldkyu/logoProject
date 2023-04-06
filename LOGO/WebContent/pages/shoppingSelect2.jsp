<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
<link rel="stylesheet" href="../CSS/shoppingSelect.css" />
</head>

<body>

	<jsp:include page="siteHead.jsp" />
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<h1>상품 리뷰</h1>
	<% 
		request.getAttribute("U_ID");
		request.getAttribute("PD_TITLE");
		request.getAttribute("PD_COMMENT");
		request.getAttribute("PD_ID");
		String imgName = (String)request.getAttribute("PD_IMAGE");
		
		System.out.println(imgName);
		
		String filename1=request.getParameter("filename1");
		String origfilename1=request.getParameter("origfilename1");
		String real = "C:\\Users\\naye\\git\\logoProject\\LOGO\\WebContent\\file";
		File viewFile = new File(real+"\\"+imgName);
%>

	<form method="get" action="../pages/shoppingChange.jsp">
		<section>
			<center>
				<table style="padding-top: 50px" align=center width=700 border=0
					cellpadding=2>
					<tr>
						<td bgcolor=white>
							<table class="table2">
								<tr>
									<td>작성자</td>
									<td><input type="text" name="u_id" size=20 value="${U_ID}"></td>
								</tr>
								<tr>
									<td>제목</td>
									<td><input type="text" name="title" size=60
										value="${PD_TITLE}"></td>
								</tr>
								<tr>
									<td>내용</td>
									<td><textarea name="comment" cols=85 rows=15>${PD_COMMENT}</textarea></td>
								</tr>
								<tr>
									<td>파일</td>
									<td colspan="6"><br><br><img src = "../file/<%=imgName%>" width="300px" height="300px"><br><br>
								</tr>
								</td>
								</tr>
						
								</center>
							</table> <br> <br>
							</section>
							<center>
								<input class="write" type="submit" value="수정"> <input
									class="write" type="button" name="delete" id="" value="삭제"
									onclick="location.href='../pages/shoppingDelete.jsp?Pd_id=${PD_ID}'">

							</center>
	</form>
	<br>
	<br>

	<footer>
		<jsp:include page="siteFooter.jsp" />
	</footer>
</body>
</html>
