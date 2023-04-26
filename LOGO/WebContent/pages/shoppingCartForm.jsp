<%@page import="vo.ShoppingCart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../CSS/shoppingCartForm.css" />
<title>Insert title here</title>
</head>

<% ShoppingCart sCart = (ShoppingCart) request.getAttribute("SCVO"); %>

<body>
<h2>장바구니 페이지</h2>

<body>
    <section class="cart">
        <div class="cart__information">
            <ul>
                <li>장바구니 상품은 최대 30일간 저장됩니다.</li>
                <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
                <li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기 바랍니다.</li>
            </ul>
        </div>
        <table class="cart__list">
            <form>
                <thead>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td colspan="2">상품명</td>
                        <td>수량</td>
                        <td>상품금액</td>
                        <td>배송비</td>
                        <td>취소</td>
                    </tr>
                </thead>
                       
                <tbody>
                    <tr class="cart__list__detail">
                        <td><input type="checkbox"></td>
                        <td><img src="../file/" ></td>
                        <td><a href="#">누르면 상세페이지로 넘어가는 곳</a><span class="cart__list__smartstore"></span>
                            <p>상품이름이 뜨는 곳</p>
                            <sapn class="price">상품가격이 뜨는곳</sapn>
                           <!--  <span style="text-decoration: line-through; color: lightgray;">119,000</span> -->
                        </td>
                        
                        <td class="cart__list__option">
                            <input type=hidden name="sell_price" value="상품나오는가격적기!"> 
                            <input class="cart__list__optionbtn" type="button" value=" + " onclick="add();"> 
							<input class="cart__list__optionbtn" type="text" name="amount" value="1" size="1" onchange="change();">
							<input class="cart__list__optionbtn" type="button" value=" - " onclick="del();"> 
							<input type="hidden" name="sum" size="11" readonly>
							<input class="cart__list__optionbtn" type="button" value=" 적용" onclick="ok();">               
                        </td>
                        
                        <td><span class="price">상품가격적는곳</span></td>
                        
                        
                        <td>[기본배송]조건</td>
                        <td><input class="cart__list__optionbtn" type="button" value="DELETE" onclick="del2();"> </td>
                    </tr>                   
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
            <button class="cart__bigorderbtn left">쇼핑 계속하기</button>
            <button class="cart__bigorderbtn right">주문하기</button>
        </div>
    </section>
</body>








</body>
</html>