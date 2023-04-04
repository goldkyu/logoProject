<!-- JSP 코드블럭 -->
<%@ page language="java" contentType="text/html;charset =utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" href="../CSS/header.css" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
	rel="stylesheet">

</head>

<body>
	<%
	request.setCharacterEncoding("utf-8");
	%>
	<header>
		<div id="mainHeader">

			<div id="leftNav">
				<ul>
					<li><a href="ticketmain.jsp">ticket</a></li>
					<li><a href="shoppingMain.html">shopping</a></li>
					<li><a href="musicMain.jsp">Music</a></li>
				</ul>

			</div>
			<div id="rightNav">
				<ul>
					<%
					if (session.getAttribute("userID") == null) {
					%>
					<li><a href="login.jsp?from=<%=request.getRequestURL()%>">LogIn</a></li>
					<li><a href="join.jsp">Join</a></li>
					<%
					} else {
					%>
					<li><a href="#"><%=session.getAttribute("userID")%> </a></li>
					<li><a href="logOut.jsp">LogOut</a></li>
					<%
					}
					%>
				</ul>
			</div>

			<form>
				<div id="logo">
					<a href="index.jsp">LOGO</a>
				</div>
				<div class="search-bar">
					<input type="text" id="search" /> <a href=#><img id="find-btn"
						src="../image/find.png" alt=""></a>
				</div>
			</form>

			<div class="slideshow-container">
				<div class="slide">
					<img src="../image/headslide1.jpg" alt="#">
				</div>
				<div class="slide">
					<img src="../image/headslide2.jpg" alt="#">
				</div>
				<div class="slide">
					<img src="../image/headslide3.jpg" alt="#">
				</div>
			</div>
		</div>


	</header>

</body>
<script>

const slides = $('.slideshow-container .slide');
let currentSlide = 0;

setInterval(() => {
	slides.eq(currentSlide).fadeOut(5000, function () {
        $(this).removeClass('active');
    });
  currentSlide = (currentSlide + 1) % slides.length;
  
  slides.eq(currentSlide).fadeIn(5000, function () {
      $(this).addClass('active');
  });
}, 5000);</script>
</html>