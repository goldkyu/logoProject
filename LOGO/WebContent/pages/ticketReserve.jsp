<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>    
<%@page import="vo.TicketInfo"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예매하기</title>
    <link rel="stylesheet" href="../CSS/ticketReserve.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 

<script type="text/javascript">
$(function () {
    $("#date").datepicker({
        dateFormat:"yy/mm/dd",
        dayNamesMin:["일","월","화","수","목","금","토"],
        monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
        onSelect:function(d){
                       
            var arr=d.split("/");
            var year=arr[0];
            var month=arr[1];
            var day=arr[2];
            
            $("#year").text(year);
            $("#month").text(month);
            $("#day").text(day);
            
            //요일 가져오기
            //데이터를 먼저 가져오고 (숫자로 넘어옴)
            var date=new Date($("#date").datepicker({dateFormat:"yy/mm/dd"}).val());
                      
            week=new Array("일","월","화","수","목","금","토");
            $("#mydate").text(week[date.getDay()]);
        }
    });
    
});
</script>

	
<%
TicketInfo reserv = (TicketInfo)request.getAttribute("Reserv");
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
	
 <% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="siteHead.jsp" />


<section>
  <div id="mainBox">
	<form name="form" method="post" action="TicketReserveCheck.to">
	<article id="center">
	 	<article class="stage"><image src="../image/stage01.png"> </article>
	 	<article class="tkseat">
	 	<br>
	 	<p style="padding : 15px; word-spacing: 5px; margin-left : 55px;">
	 	공연일 : <input type="text" id="date"> 
	 	공연시간 :
 		<select id="change" onchange="handleOnChange(this)">
 		<option value=""></option>
		<option value=""><%= reserv.getRunningtime() %></option>
  		</select> 
  		관람인원/매수 : 
  		<input type="text" name="amount" value="1" size="1" onchange="change();">
		<input type="button" value=" + " onclick="add();">
		<input type="button" value=" - " onclick="del();"><br>
		<input type="hidden" name="sum" size="11" readonly>
 		</p>
		
 <div class="theatre">
      <div class="cinema-seats left">
        <div class="cinema-row row-1">
          <h1 class="rows"></h1>
          <div class="columns">A</div>
          <div class="columns">B</div>
          <div class="columns">C</div>
          <div class="columns">D</div>
          <div class="columns">E</div>
          <div class="columns">F</div>
          <div class="columns">G</div>
        </div>
        
        <div class="cinema-row row-1">
          <h1 class="rows">1</h1>
          <div class="seat A1"></div>
          <div class="seat B1"></div>
          <div class="seat C1"></div>
          <div class="seat D1"></div>
          <div class="seat E1"></div>
          <div class="seat F1"></div>
          <div class="seat G1"></div>
        </div>

        <div class="cinema-row row-2">
          <h1 class="rows">2</h1>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
        </div>

        <div class="cinema-row row-3">
          <h1 class="rows">3</h1>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
        </div>

        <div class="cinema-row row-4">
          <h1 class="rows">4</h1>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
        </div>

        <div class="cinema-row row-5">
          <h1 class="rows">5</h1>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
        </div>
 <div class="cinema-row row-6">
          <h1 class="rows">6</h1>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
        </div>

        <div class="cinema-row row-7">
          <h1 class="rows">7</h1>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
        </div>
      </div>

      <div class="cinema-seats right">
        <div class="cinema-row row-1">
          <h1 class="rows">8</h1>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
        </div>

        <div class="cinema-row row-2">
          <h1 class="rows">9</h1>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
        </div>

        <div class="cinema-row row-3">
          <h1 class="rows">10</h1>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
        </div>

        <div class="cinema-row row-4">
          <h1 class="rows">11</h1>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
        </div>

        <div class="cinema-row row-5">
          <h1 class="rows">12</h1>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
        </div>

        <div class="cinema-row row-6">
          <h1 class="rows">13</h1>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
        </div>

        <div class="cinema-row row-7">
          <h1 class="rows">14</h1>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
          <div class="seat"></div>
        </div>
      </div>
    </div>

   </article>
   
   <article class="tkleft">
   <input type=hidden value="<%=reserv.getP_code() %>" name="p_code"> 
   
   <img src="../file/<%= reserv.getP_image() %>" style="width:260px">
   <br>
   <hr><br>
   <p><h3>[선택내역]</h3></p><br>
   <b><h4><%= reserv.getP_title() %></h4></b><br>
   <p>날짜 : <span id="year" name="reservedate"></span>
		   <span id="month" name="reservedate"></span>
		   <span id="day" name="reservedate"></span>
		   <span id="mydate" name="reservedate"></span>
   </p><br>
		   
   <p>시간: <span id="result"></span></p><br>
   <p>좌석</p>
   <div>
   
      <h1 class="booked" name="tickets"></h1>
      <h1 class="seatsbooked" name="seats"></h1>
            
   </div>
   
   	    
    <script src="../js/ticketReserve.js"  charset="UTF-8"></script>
   
    <div>티켓금액 : <%= Integer.parseInt(reserv.getP_price()) %>원</div>
    <input type=hidden name="sell_price" value="<%= Integer.parseInt(reserv.getP_price()) %>"> 
	<br>
		총 금액 : <type id="my_sum" name="p_price"></type>원				
	
   </article>
   <article>
   <input type="submit" value="선택완료" class="write">
   </article>
   </form>
   </article>
</div>
</section>
<footer>
<jsp:include page="siteFooter.jsp" />
</footer>
    
</body>
</html>