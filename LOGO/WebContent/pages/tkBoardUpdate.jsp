<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="../CSS/tkBoardWrite.css" />
</head>
<body>
	<jsp:include page="siteHead.jsp" />
	<% request.setCharacterEncoding("utf-8"); %>
	
	request.getAttribute("ID");
	request.getAttribute("TITLE");
	request.getAttribute("CONTENT");

<section>
<div id="mainBox">
 <div class="page-title">
	   <div class="container">
            <h3>관람후기</h3>
        </div>
  	</div>
  	
<form method="get" action="../pages/tkBoardUpdatedb.jsp">
	<table>
		
		<tr>
		<td style="width:100px", bgcolor="#F6F6F6">아이디</td>
		<td><input type=text name=u_id class="textbox" value="${ID}"></td>
		</tr>
		
		<tr>
		<td bgcolor="#F6F6F6">제목</td>
		<td><input type=text name=pfmtitle class="textbox01" value="${TITLE}"></td>
		</tr>
		
		<tr>
		<td bgcolor="#F6F6F6">내용</td>
		<td><textarea name=pfmcomment cols=140 rows=25 >${CONTENT}</textarea></td>
		</tr>
	</table>
	<div class="btn">
	<input type="submit" value="수정" class="write">
	<input type="button" value="삭제" class="write" onclick="location.href='../pages/tkBoardDelete.jsp?u_id=${ID}'">
	</div>
</section>	

<footer>
	<jsp:include page="siteFooter.jsp" />
</footer>

</body>
</html>