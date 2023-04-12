<%@page import="vo.Music"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("앨범페이지"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGO</title>
</head>
<body>
<% ArrayList<Music> musicList = (ArrayList<Music>)request.getAttribute("musics"); %>
<jsp:include page="musicHead.jsp"/>
<section style="margin-top: 200px;">
	<div>
	<img alt="" src="../albums/<%= musicList.get(0).getALBUM_PHOTO()%>" style="width: 300px; height: 300px;">
	
	</div>
	<div>
		<% for(Music m : musicList){
			%>
			<p><%= m.getMUSIC_TRACK_NUM() %> | <%= m.getMUSIC_NAME() %> | <%= m.getMUSIC_PLAYTIME() %></p>
		<% } %>
	</div>
</section>

</body>
</html>