<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../CSS/tkBoardWrite.css" />
</head>
<body>
	<jsp:include page="siteHead.jsp" />
	<% request.setCharacterEncoding("utf-8"); %>

<section>
<div id="mainBox">
 <div class="page-title">
	   <div class="container">
            <h3>관람후기</h3>
        </div>
  	</div>
  	
  	
<form method="post" action="tkBoardProc.jsp" enctype="multipart/form-data">
	<table>
		
		<tr>
		<td style="width:100px", bgcolor="#F6F6F6" >아이디</td>
		<td><input type=text name=u_id class="textbox"></td>
		</tr>
	
		<tr>
		<td bgcolor="#F6F6F6" >제목</td>
		<td><input type=text name=pfm_title class="textbox01"></td>
		</tr>
		
		<tr>
		<td bgcolor="#F6F6F6">내용</td>
		<td><textarea name=pfm_comment cols=140 rows=25 ></textarea></td>
		</tr>
		
		<tr>
		<td bgcolor="#F6F6F6">파일</td>
		<td><input type=file name=file ></td>
		</tr>
		
	</table>
	<div class="btn">
	<input type="button" value="취소" class="write" onclick="location.href='tkBoard.jsp' "> 
	<input type="submit" value="등록" class="write">
	</div>
</form>
</div>
</section>	

<footer>
	<jsp:include page="siteFooter.jsp" />
</footer>

</body>
</html>