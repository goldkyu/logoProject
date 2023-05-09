<%@page import="java.util.ArrayList"%>

<%@page import="vo.ShoppingCart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../CSS/shoppingCartForm.css" />
<title>Insert title here</title>
</head>

<% ArrayList<ShoppingCart> cart = (ArrayList<ShoppingCart>) request.getAttribute("cart");

%>




<body onload="init();">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
    <script>
    $(function(){
        //전체선택 체크박스 클릭
        $("#check_all").click(function(){
            //전체선택 체크박스가 체크된상태일경우
            if($("#check_all").prop("checked")) {
                //input type 이 checkbox인 경우 전부 선택
                $("input[type=checkbox]").prop("checked",true);
            } else {
                //input type 이 checkbox인 경우 전부 해제
                $("input[type=checkbox]").prop("checked",false);
            }
        })
    })
 </script>

	<!-- <script language="JavaScript">
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
	</script> -->
	
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:include page="siteHead.jsp" />
	
	<form name="form" method="get">
		<section>
			<div id="mainBox">
			
			
			<center><br><br><h1>CART</h1> </center>
				<section class="cart">
					<div class="cart__information">
						<ul>
							<li>장바구니 상품은 최대 30일간 저장됩니다.</li>
							<li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
							<li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해
								주시기 바랍니다.</li>
						</ul>
					</div>
					<table class="cart__list">

						<thead>
							<tr>
								<td><input type="checkbox" id="check_all"></td>
								<td colspan="2">상품명</td>
								<td>수량</td>
								<td>상품금액</td>
								<td>배송비</td>
								<td>취소</td>
							</tr>
						</thead>
				
							<form name="form" method="get">
							<tbody>
								<%
									for (ShoppingCart c : cart) {
								%>
								<tr class="cart__list__detail">
									     <td><input type="checkbox"></td>
									<td><a href="../pages/shoppingDetail.sh?Pd_number=<%=c.getPd_number()%>">
									<img src="../file/<%=c.getImage()%>"> </a> </td>
									<td><a href="../pages/shoppingDetail.sh?Pd_number=<%=c.getPd_number()%>">
									<span class="cart__list__smartstore"></span><p><%=c.getPd_name()%></a>
									</p> <span class="price"><%=c.getPrice()%></sapn> 
									</td>

									<td class="cart__list__option">
									<input type=hidden name="sell_price" value="<%=c.getPrice()%>"> 
									<input class="cart__list__optionbtn" type="button" value=" + " onclick="add();"> 
									<input class="cart__list__optionbtn" type="text" name="amount" value="1" size="1" onchange="change();">
									<input class="cart__list__optionbtn" type="button" value=" - " onclick="del();"> 
									<input type="hidden" name="sum" size="11" readonly> 
									<input class="cart__list__optionbtn" type="button" value=" 적용"	onclick="ok();"></td>

									<td></type><span class="price"><%=c.getPrice()%></span></td>
<!-- <type id="my_sum"> -->

									<td>[기본배송]조건</td>
									<td colspan="3"><button class="cart__list__optionbtn" onclick="del();"> DELETE</button></td>

								</tr>
								<%
									}
								%>
							</tbody>
							 <tfoot>
                    <tr>
                        <td colspan="3"><input type="checkbox"> <button class="cart__list__optionbtn">선택상품 삭제</button>
        
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tfoot>
						</form>
					</table>
					<div class="cart__mainbtns">
						<button class="cart__bigorderbtn left"> <a href="../pages/shoppingProductList.sh" style = "text-decoration:none;">
						쇼핑 계속하기</a></button>
						<button class="cart__bigorderbtn right">주문하기</button>
					</div>
				</section>
	
</body>
</html>