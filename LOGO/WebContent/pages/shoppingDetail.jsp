<%@page import="vo.ShoppingDetail"%>
<%@page import="vo.ShoppingProduct"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../CSS/shoppingDetail.css" />
<title>Insert title here</title>
</head>

<%
	String nowPage = (String) request.getAttribute("PAGE");
	ShoppingProduct shVO = (ShoppingProduct) request.getAttribute("SPVO");
	ShoppingDetail sdVO = (ShoppingDetail) request.getAttribute("SDVO");
%>

<body onload="init();">
	<script language="JavaScript">
		var sell_price;
		var amount;

		function init() {
			sell_price = document.form.sell_price.value;
			amount = document.form.amount.value;
			document.form.sum.value = sell_price;
			change();
		}

		function add() {
			hm = document.form.amount;
			hm.value++;

			var sum_ = parseInt(hm.value) * sell_price;
			document.getElementById("my_sum").innerHTML = sum_;
		}

		function del() {
			hm = document.form.amount;
			if (hm.value > 1) {
				hm.value--;
				var sum_ = parseInt(hm.value) * sell_price;
				document.getElementById("my_sum").innerHTML = sum_;
			}
		}

		function change() {
			hm = document.form.amount;

			if (hm.value < 0) {
				hm.value = 0;
			}
			var sum_ = parseInt(hm.value) * sell_price;
			document.getElementById("my_sum").innerHTML = sum_;
		}
	</script>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:include page="siteHead.jsp" />
	<form name="form" method="get">
		<section>
			<div id="mainBox">

				<div id="infobox">
					<article id="leftimege" style="margin-top: 50px;">
						<div>
							<img src="../file/<%=sdVO.getDe_image4()%>" alt="">
						</div>
					</article>

					<article id="rightinfo" style="margin-top: 50px;">

						<div class="item_condition">

							<div style="font-size: 30px;">
								<span><%=shVO.getPd_name()%></span>
							</div>
						</div>
						<br>
						<div class="item_condition">
							<div class="condition_state01">
								<span><b>가격</b></span>
							</div>
							<div class="condition_state02">
								<span><%=shVO.getPd_price()%>원</span>
							</div>
						</div>
						<div class="item_condition">
							<div class="condition_state01">
								<span><b>배송비</b></span>
							</div>
							<div class="condition_state02">
								<span><%=shVO.getCharge()%></span>
							</div>
						</div>

						<div class="item_condition">
							<div class="condition_state01">
								<span><b>배송방법</b></span>
							</div>
							<div class="condition_state02">
								<span>택배</span>
							</div>
						</div>
						<div class="item_condition1">
							<div class="condition_state03">
								<span><%=shVO.getPd_name()%></span>
							</div>
							<div class="condition_state03">
								<span><%=shVO.getPd_price()%> 원</span>
							</div>
							<div class="condition_state04">
								<input type=hidden name="sell_price"
									value="<%=shVO.getPd_price()%>"> <input type="text"
									name="amount" value="1" size="1" onchange="change();">
								<input type="button" value=" + " onclick="add();"> <input
									type="button" value=" - " onclick="del();"><br> <input
									type="hidden" name="sum" size="11" readonly>
	</form>
	</div>
	</div>
	<div style="margin-left: 450px; margin-top: 10px;">
		총 상품 금액 :
		<type id="my_sum"></type>
		원
	</div>
	<div class="find-btn">
		<button type="button" value="BUYNOW" class="write" onclick="">BUY
			NOW</button>
		<br>
		<button type="button" value="CART" class="write1"
			onclick="location.href='../pages/shoppingCartForm.sh?Pd_number=<%=shVO.getPd_number()%>'">CART</button>
		<a
			href="../pages/shoppingCartForm.sh?Pd_number=<%=shVO.getPd_number()%>"></a>
		<button type="button" value="WISHLIST" class="write1" onclick=""
			style="margin-right: 10px;">WISH LIST</button>
	</div>
	</article>
	</div>

	</div>
	<br>
	<br>
	<br>
	<br>

	<div class="text01">상세정보</div>
	<hr>
	<center>
		<br> <br> <type style="color:red;"> *실제 제품의 색상은 사용자의 모니터 설정 및 환경에 따라 약간씩 차이가 있을 수
		있습니다.<br> The actual of the item could be differed from the
		set-up of monitor and the condition of the user.</type>
		<br> <br><div id="infodetailbox">
			<input type="hidden" name="Pd_number"
				value="<%=sdVO.getPd_number()%>" /> <img
				src="../file/<%=sdVO.getDe_image1()%>"> <img
				src="../file/<%=sdVO.getDe_image2()%>"> <img
				src="../file/<%=sdVO.getDe_image3()%>">
		</div>









	</center>
	<section>
		<%-- <a
			href="boardReplyForm.bo?board_num=<%=shVO.getPd_number()%>&page=<%=nowPage%>">
			[답변] </a>  --%>
		<%-- <a
					href="../pages/shoppingModifyForm.sh?Pd_number=<%=shVO.getPd_number()%>">[수정]
				</a> <a
					href="../pages/shoppingDeleteForm.sh?Pd_number=<%=shVO.getPd_number()%>&page=<%=nowPage%>">
					[삭제] </a> <a
					href="../pages/shoppingProductList.sh?nowPage=<%=nowPage%>">[목록]</a>&nbsp;&nbsp;
				</center> --%>
	</section>
	</div>
	</section>
	<%-- <footer>
		<jsp:include page="siteFooter.jsp" />
	</footer> --%>
</body>
</html>