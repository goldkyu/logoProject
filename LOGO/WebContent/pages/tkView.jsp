<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../CSS/tkBoardWrite.css" />
</head>
<body>
	<jsp:include page="siteHead.jsp" />
	<% request.setCharacterEncoding("utf-8"); %>
	
<% 	
	request.getAttribute("ID");
	request.getAttribute("TITLE");
	request.getAttribute("CONTENT");
	request.getAttribute("PFMID");
	String imgName = (String)request.getAttribute("IMAGE");
	
	String filename1=request.getParameter("filename1");
	String origfilename1=request.getParameter("origfilename1");
	String real = "C:\\Users\\Yoo\\git\\logoProject\\LOGO\\logoProject\\LOGO\\WebContent\\file";
	File viewFile = new File(real+"\\"+imgName);
	
%>	

<section>
<div id="mainBox">
 <div class="page-title">
	   <div class="container">
            <h3>관람후기</h3>
        </div>
  	</div>
  	
<form method="get" >
	<table>
		<tr>
		<td width="8%" bgcolor="#F6F6F6">아이디</td>
		<td name=u_id class="textbox">${ID}</td>
		</tr>
		
		<tr>
		<td bgcolor="#F6F6F6">제목</td>
		<td name=pfmtitle class="textbox01">${TITLE}</td>
		</tr>
		
		<tr>
		<td height="280" bgcolor="#F6F6F6">내용</td>
		<td name=pfmcomment cols=140 rows=25 >${CONTENT}</td>
		</tr>
		
		<tr>
		<td bgcolor="#F6F6F6">파일</td>
		<td colspan="6"><img src = "../file/<%=imgName%>" width="200px" height="200px"><br></td>
		</tr>
		
		
	</table>
	<div class="btn">
	<input type="button" value="수정" class="write" onclick="location.href='tkViewdb.jsp?Pfm_id=${PFMID}'">
	<input type="button" value="목록" class="write" onclick="location.href='tkhits.jsp?Pfm_id=${PFMID}'">
	</div>
</section>	

<footer>
	<jsp:include page="siteFooter.jsp" />
</footer>

</body>
</html>