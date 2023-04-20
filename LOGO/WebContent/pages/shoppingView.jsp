<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
<link rel="stylesheet" href="../CSS/shoppingView.css"/>
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
		String imgName = (String) request.getAttribute("PD_IMAGE");

		String filename1 = request.getParameter("filename1");
		String origfilename1 = request.getParameter("origfilename1");
		String real = "C:\\Users\\naye\\git\\logoProject\\LOGO\\WebContent\\file";
		File viewFile = new File(real + "\\" + imgName);
	%>

	<form method="get">
		<section>
			
				<table>
					<tr>
						<td bgcolor=white>
						<center>
							<table class="table2">
								<tr>

									<td>작성자</td>
									<td name="u_id" size=20>${U_ID}</td>
								</tr>
								<tr>
									<td>제목</td>
									<td name="title" size=60>${PD_TITLE}</td>
								</tr>
								<tr>
									<td colspan="6">${PD_COMMENT}<br><br> <img
										src="../file/<%=imgName%>" width="250px" height="200px"><br>
										<br>
								</tr>
								<%-- <tr>
									<td>내용</td>
									<td name="comment" cols=85 rows=15>${PD_COMMENT}</td>
								</tr> --%>
								
								</td>
								</tr>

								</center>
							</table> <br> <br>
							</section>
							<center>
								<input class="write" type="button" value="수정"
									onclick="location.href='../pages/shoppingView2.jsp?Pd_id=${PD_ID}'">
								<input class="write" type="button" name="" id=""
									value="돌아가기"
									onclick="location.href='../pages/shoppinghits.jsp?Pd_id=${PD_ID}'">

							</center>
							</form> <br> <br> <footer>
								<jsp:include page="siteFooter.jsp" />
							</footer>
</body>
</html>