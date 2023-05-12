<%@page import="vo.Music"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	System.out.println("앨범페이지");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGO</title>
</head>

<style type="text/css">
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.album-info {
	display: flex;
	align-items: center;
	margin: 20px;
}

.album-image {
	width: 200px;
	height: 200px;
	margin-right: 20px;
}

.album-title {
	font-size: 36px;
	font-weight: bold;
	margin: 0;
	padding: 0;
}

.artist-name {
	font-size: 24px;
	margin: 0;
	padding: 0;
}

.release-date {
	font-size: 18px;
	margin: 0;
	padding: 0;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	font-size: 18px;
	font-weight: bold;
}

td {
	font-size: 16px;
}

.play-button {
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 4px;
}
</style>
<body>
	<%
		ArrayList<Music> musicList = (ArrayList<Music>) request.getAttribute("musics");
	%>
	<jsp:include page="musicHead.jsp" />
	<section style="width: 1000px; margin: 0 auto; margin-top: 200px;">
		<div>
			<div class="album-info">
				<img alt="" src="../albums/<%=musicList.get(0).getALBUM_PHOTO()%>"
					class="album-image" style="object-fit: contain;">
				<div class="album-details">
					<h1 class="album-title"><%=musicList.get(0).getALBUM_NAME() %></h1>
					<h2 class="artist-name"><%=musicList.get(0).getARTIST_NAME() %></h2>
					<p class="release-date"><%=musicList.get(0).getMUSIC_DATE() %></p>
				</div>
			</div>
			<table>
				<thead>
					<tr>
						<th>Track Number</th>
						<th>Music Title</th>
						<th>Play Time</th>
						<th>Artist</th>
						<th>Play</th>
					</tr>
				</thead>
				<tbody>


					<c:forEach items="${musics }" var="m">

						<tr>
							<td>${m.MUSIC_TRACK_NUM }</td>
							<td>${m.MUSIC_NAME }</td>
							<td>${m.MUSIC_PLAYTIME }</td>
							<td>${m.ARTIST_NAME }</td>
							<td><button class="play-button music-select" style="background-color: white;"
									data-src="../music/${m.MUSIC_NAME}.mp3">
									<img style="width: 30px; height: 30px;" class="download"
										src="../image/btn_right.png" alt="">
								</button></td>
						</tr>
					</c:forEach>





				</tbody>
			</table>
		</div>
	</section>
</body>
</html>


</body>
</html>