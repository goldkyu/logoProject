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

<%
TicketInfo reserv = (TicketInfo)request.getAttribute("Reserv");
%>
<body>
 <% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="siteHead.jsp" />

<section>
  <div id="mainBox">
	<article id="center">
	 	<article class="stage"><image src="../image/stage01.png"> </article>	
		<article class="tkseat">
		
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
   <img src="../file/<%= reserv.getP_image() %>" style="width:260px">
   <br>
   <hr><br>
   <p><h3>[선택내역]</h3></p><br>
   <b><h4><%= reserv.getP_title() %></h4></b><br>
   <p>날짜 : <%= reserv.getP_date() %> </p><br>
   <p>시간 : <%= reserv.getRunningtime() %></p><br>
   <p>좌석</p>
    <div>
      <h1 class="booked"></h1>
      <h1 class="seatsbooked"></h1>
    </div>
   
    
    <script src="../js/ticketReserve.js"  charset="UTF-8"></script>
    
     <div class="price"><%= reserv.getP_price() %></div>
     <input type="button" value="선택완료" class="write">
   </article>
   
   </article>



</div>
</section>
<footer>
<jsp:include page="siteFooter.jsp" />
</footer>
    
</body>
</html>