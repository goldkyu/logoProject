<%@page import="vo.ShoppingProduct"%>
<%@page import="shopping.ShoppingBoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shopping.ShoppingBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../CSS/shoppingMain.css">
<title>쇼핑 메인페이지</title>
</head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script>
	$(function() {
		$("#moreBtn").click(function() {
			$('.box3:hidden').slice(0, 1).slideDown("fast");
			$('.image').slice(0, 5).show();
			$('.image:hidden').slice(0, 5).slideDown("fast");
			if ($('.image:hidden').length == 0) {
				$(this).fadeOut("fast");
			}
			$('html,body').animate({
				scrollTop : $(this).offset().top
			}, 2500);
			return false;
		});
	});
</script>

<% ArrayList<ShoppingProduct> list = (ArrayList<ShoppingProduct>) request.getAttribute("LIST"); %>


<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:include page="siteHead.jsp" />

	<section>
		<div id="mainBox">
			<div id="box">
				<nav id="category">

					<ul>
						<br>
						<li style="margin-left: 430px;"><a href="../pages/shoppingProductList.sh">ALBUM</a>
							<ul>
								<li><a href="#"> CD </a></li>
								<li><a href="#"> DVD </a></li>
								<li><a href="#"> etc. </a></li>
							</ul></li>

						<li style="margin-left: 100px;"><a href="#">PHOTO</a>
							<ul>
								<li><a href="#"> Printed
								</a></li>
								<li><a href="#"> Photo
										Book </a></li>
							</ul></li>

						<li style="margin-left: 100px;"><a href="#">CONCERT</a>
							<ul>
								<li><a href="#"> Official
										Fanlight </a></li>
								<li><a href="#"> Concert
										Goods</a></li>
							</ul></li>

						<li style="margin-left: 100px;"><a href="#">FASHION</a>
							<ul>
								<li><a href="#"> Clothing
								</a></li>
								<li><a href="#"> Acc</a></li>
								<li><a href="#">Jewelry</a></li>
							</ul></li>

						<li style="margin-left: 100px;"><a href="#">CUSTOMIZING</a>
							<ul>
								<li><a href="#"> Phone
										Case </a></li>
								<li><a href="#">Fashion</a></li>
								<li><a href="#"> Acc</a></li>
							</ul></li>
						<li style="margin-left: 100px;"><a
							href="../pages/shoppingBoard.jsp">REVIEW</a></li>
						<li style="margin-left: 100px;"><a
							href="../pages/shoppingProductWriteForm.sh">PRODUCT</a></li>
					</ul>
			</div>
			</nav>
			<!-- 배너 -->
			<div id="banner">
				<div id="banner1">
					<img src="../image/sh-00.jpg">
				</div>
			</div>
			

			<div id="weekly">Weekly Best</div>

			<div class="box1">
				<br>
				<article class="img2-2">
					<input type="hidden" name="Pd_number" value="<%=list.get(0).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(0).getPd_number()%>"> <img src="../image/<%=list.get(0).getPd_image()%>"> <%=list.get(0).getPd_name()%> <br> <%=list.get(0).getPd_price()%>원
					
				</article>
				</a>
				<article class="img2-2">
					<input type="hidden" name="Pd_number" value="<%=list.get(1).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(1).getPd_number()%>"> <img src="../image/<%=list.get(1).getPd_image()%>"> <%=list.get(1).getPd_name()%> <br> <%=list.get(1).getPd_price()%>원
				</article>
				</a>
				<article class="img2-2">
					<input type="hidden" name="Pd_number" value="<%=list.get(2).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(2).getPd_number()%>"> <img src="../image/<%=list.get(2).getPd_image()%>"> <%=list.get(2).getPd_name()%> <br> <%=list.get(2).getPd_price()%>원
				</article>
				</a>
				<article class="img2-2">
					<input type="hidden" name="Pd_number" value="<%=list.get(3).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(3).getPd_number()%>"> <img src="../image/<%=list.get(3).getPd_image()%>"> <%=list.get(3).getPd_name()%> <br> <%=list.get(3).getPd_price()%>원
				</article>
				</a>
				<article class="img2-2">
					<input type="hidden" name="Pd_number" value="<%=list.get(4).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(4).getPd_number()%>"> <img src="../image/<%=list.get(4).getPd_image()%>"> <%=list.get(4).getPd_name()%> <br> <%=list.get(4).getPd_price()%>원
				</article>
				</a>
			</div>

			<div id="All">All Product</div>
			<div class="box1">
				<article class="img2-2">
					<input type="hidden" name="Pd_number" value="<%=list.get(0).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(0).getPd_number()%>"> <img src="../image/<%=list.get(0).getPd_image()%>"> <%=list.get(0).getPd_name()%> <br> <%=list.get(0).getPd_price()%>원
				</article>
				</a>
				<article class="img2-2">
					<input type="hidden" name="Pd_number" value="<%=list.get(1).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(1).getPd_number()%>"> <img src="../image/<%=list.get(1).getPd_image()%>"> <%=list.get(1).getPd_name()%> <br> <%=list.get(1).getPd_price()%>원

				</article>
				</a>
				<article class="img2-2">
					<input type="hidden" name="Pd_number" value="<%=list.get(2).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(2).getPd_number()%>"> <img src="../image/<%=list.get(2).getPd_image()%>"> <%=list.get(2).getPd_name()%> <br> <%=list.get(2).getPd_price()%>원

				</article>
				</a>
				<article class="img2-2">
					<input type="hidden" name="Pd_number" value="<%=list.get(3).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(3).getPd_number()%>"> <img src="../image/<%=list.get(3).getPd_image()%>"> <%=list.get(3).getPd_name()%> <br> <%=list.get(3).getPd_price()%>원 

				</article>
				</a>
				<article class="img2-2">
					<input type="hidden" name="Pd_number" value="<%=list.get(4).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(4).getPd_number()%>"> <img src="../image/<%=list.get(4).getPd_image()%>"> <%=list.get(4).getPd_name()%> <br> <%=list.get(4).getPd_price()%>원

				</article>
				</a>
			</div>

			<div class="box2">
				<article class="img2-2">
					<input type="hidden" name="Pd_number" value="<%=list.get(5).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(5).getPd_number()%>"> <img src="../image/<%=list.get(5).getPd_image()%>"> <%=list.get(5).getPd_name()%> <br> <%=list.get(5).getPd_price()%>원

					
				</article>
				</a>
				<article class="img2-2">
					<input type="hidden" name="Pd_number" value="<%=list.get(6).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(6).getPd_number()%>"> <img src="../image/<%=list.get(6).getPd_image()%>"> <%=list.get(6).getPd_name()%> <br> <%=list.get(6).getPd_price()%>원

				</article>
				</a>
				<article class="img2-2">
					<input type="hidden" name="Pd_number" value="<%=list.get(7).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(7).getPd_number()%>"> <img src="../image/<%=list.get(7).getPd_image()%>"> <%=list.get(7).getPd_name()%> <br> <%=list.get(7).getPd_price()%>원
				</article>
				</a>
				<article class="img2-2">
					<input type="hidden" name="Pd_number" value="<%=list.get(8).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(8).getPd_number()%>"> <img src="../image/<%=list.get(8).getPd_image()%>"> <%=list.get(8).getPd_name()%> <br> <%=list.get(8).getPd_price()%>원
				</article>
				</a>
				<article class="img2-2">
					<input type="hidden" name="Pd_number" value="<%=list.get(9).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(9).getPd_number()%>"> <img src="../image/<%=list.get(9).getPd_image()%>"> <%=list.get(9).getPd_name()%> <br> <%=list.get(9).getPd_price()%>원
					
				</article>
				</a>
			</div>

			<div class="box2">
				<article class="img2-2">
					<input type="hidden" name="Pd_number" value="<%=list.get(10).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(10).getPd_number()%>"> <img src="../image/<%=list.get(10).getPd_image()%>"> <%=list.get(10).getPd_name()%> <br> <%=list.get(10).getPd_price()%>원
				</article>
				</a>
				<article class="img2-2">
					<input type="hidden" name="Pd_number" value="<%=list.get(11).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(11).getPd_number()%>"> <img src="../image/<%=list.get(11).getPd_image()%>"> <%=list.get(11).getPd_name()%> <br> <%=list.get(11).getPd_price()%>원
				</article>
				</a>
				<article class="img2-2">
					<input type="hidden" name="Pd_number" value="<%=list.get(12).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(12).getPd_number()%>"> <img src="../image/<%=list.get(12).getPd_image()%>"> <%=list.get(12).getPd_name()%> <br> <%=list.get(12).getPd_price()%>원
					</article>
				</a>
				<article class="img2-2">
					<input type="hidden" name="Pd_number" value="<%=list.get(13).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(13).getPd_number()%>"> <img src="../image/<%=list.get(13).getPd_image()%>"> <%=list.get(13).getPd_name()%> <br> <%=list.get(13).getPd_price()%>원
				</article>
				</a>
				<article class="img2-2">
					<input type="hidden" name="Pd_number" value="<%=list.get(14).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(14).getPd_number()%>"> <img src="../image/<%=list.get(14).getPd_image()%>"> <%=list.get(14).getPd_name()%> <br> <%=list.get(14).getPd_price()%>원
				</article>
				</a>
			</div>

			<div class="box3">
				<div class="image">
					<article class="img2-2">
						<input type="hidden" name="Pd_number" value="<%=list.get(15).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(15).getPd_number()%>"> <img src="../image/<%=list.get(15).getPd_image()%>"> <%=list.get(15).getPd_name()%> <br> <%=list.get(15).getPd_price()%>원
					</article>
					</a>
				</div>
				<div class="image">
					<article class="img2-2">
						<input type="hidden" name="Pd_number" value="<%=list.get(16).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(16).getPd_number()%>"> <img src="../image/<%=list.get(16).getPd_image()%>"> <%=list.get(16).getPd_name()%> <br> <%=list.get(16).getPd_price()%>원
					</article>
					</a>
				</div>
				<div class="image">
					<article class="img2-2">
						<input type="hidden" name="Pd_number" value="<%=list.get(17).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(17).getPd_number()%>"> <img src="../image/<%=list.get(17).getPd_image()%>"> <%=list.get(17).getPd_name()%> <br> <%=list.get(17).getPd_price()%>원
					</article>
					</a>
				</div>
				<div class="image">
					<article class="img2-2">
						<input type="hidden" name="Pd_number" value="<%=list.get(18).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(18).getPd_number()%>"> <img src="../image/<%=list.get(18).getPd_image()%>"> <%=list.get(18).getPd_name()%> <br> <%=list.get(18).getPd_price()%>원
					</article>
					</a>
				</div>
				<div class="image">
					<article class="img2-2">
						<input type="hidden" name="Pd_number" value="<%=list.get(19).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(19).getPd_number()%>"> <img src="../image/<%=list.get(19).getPd_image()%>"> <%=list.get(19).getPd_name()%> <br> <%=list.get(19).getPd_price()%>원
					</article>
					</a>
				</div>
			</div>

			<div class="box3">
				<div class="image">
					<article class="img2-2">
						<input type="hidden" name="Pd_number" value="<%=list.get(20).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(20).getPd_number()%>"> <img src="../image/<%=list.get(20).getPd_image()%>"> <%=list.get(20).getPd_name()%><br> <%=list.get(20).getPd_price()%>원
					</article>
					</a>
				</div>
				<div class="image">
					<article class="img2-2">
						<input type="hidden" name="Pd_number" value="<%=list.get(21).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(21).getPd_number()%>"> <img src="../image/<%=list.get(21).getPd_image()%>"> <%=list.get(21).getPd_name()%> <br> <%=list.get(21).getPd_price()%>원
					</article>
					</a>
				</div>
				<div class="image">
					<article class="img2-2">
						<input type="hidden" name="Pd_number" value="<%=list.get(22).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(22).getPd_number()%>"> <img src="../image/<%=list.get(22).getPd_image()%>"> <%=list.get(22).getPd_name()%> <br> <%=list.get(22).getPd_price()%>원
					</article>
					</a>
				</div>
				<div class="image">
					<article class="img2-2">
						<input type="hidden" name="Pd_number" value="<%=list.get(23).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(23).getPd_number()%>"> <img src="../image/<%=list.get(23).getPd_image()%>"> <%=list.get(23).getPd_name()%> <br> <%=list.get(23).getPd_price()%>원
					</article>
					</a>
				</div>
				<div class="image">
					<article class="img2-2">
						<input type="hidden" name="Pd_number" value="<%=list.get(24).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(24).getPd_number()%>"> <img src="../image/<%=list.get(24).getPd_image()%>"> <%=list.get(24).getPd_name()%> <br> <%=list.get(24).getPd_price()%>원
					</article>
					</a>
				</div>
			</div>

			<div class="box3">
				<div class="image">
					<article class="img2-2">
						<input type="hidden" name="Pd_number" value="<%=list.get(25).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(25).getPd_number()%>"> <img src="../image/<%=list.get(25).getPd_image()%>"> <%=list.get(25).getPd_name()%> <br> <%=list.get(25).getPd_price()%>원
					</article>
					</a>
				</div>
				<div class="image">
					<article class="img2-2">
						<input type="hidden" name="Pd_number" value="<%=list.get(26).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(26).getPd_number()%>"> <img src="../image/<%=list.get(26).getPd_image()%>"> <%=list.get(26).getPd_name()%> <br> <%=list.get(26).getPd_price()%>원
					</article>
					</a>
				</div>
				<div class="image">
					<article class="img2-2">
						<input type="hidden" name="Pd_number" value="<%=list.get(27).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(27).getPd_number()%>"> <img src="../image/<%=list.get(27).getPd_image()%>"> <%=list.get(27).getPd_name()%> <br> <%=list.get(27).getPd_price()%>원
					</article>
					</a>
				</div>
				<div class="image">
					<article class="img2-2">
						<input type="hidden" name="Pd_number" value="<%=list.get(28).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(28).getPd_number()%>"> <img src="../image/<%=list.get(28).getPd_image()%>"> <%=list.get(28).getPd_name()%> <br> <%=list.get(28).getPd_price()%>원
					</article>
					</a>
				</div>
				<div class="image">
					<article class="img2-2">
						<input type="hidden" name="Pd_number" value="<%=list.get(29).getPd_number()%>" />
					<a href="../pages/shoppingDetail.sh?Pd_number=<%=list.get(29).getPd_number()%>"> <img src="../image/<%=list.get(29).getPd_image()%>"> <%=list.get(29).getPd_name()%> <br> <%=list.get(29).getPd_price()%>원
					</article>
					</a>
				</div>
			</div>

		</div>
		<div>
			<button class="load-more" id="moreBtn">+더보기</button>
		</div>
	</div>
	</section>

	<footer>
		<jsp:include page="siteFooter.jsp" />
	</footer>
</body>

</html>