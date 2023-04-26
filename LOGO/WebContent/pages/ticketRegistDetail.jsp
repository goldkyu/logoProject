<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="vo.TicketInfo"%>
<%@page import="vo.TicketArena"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../CSS/ticketRegistDetail.css"/>
<title>공연상세정보</title>
</head>
<%
	TicketInfo detailList = (TicketInfo)request.getAttribute("DetailList");
	String nowPage = (String)request.getAttribute("Page");

%>

<body>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:include page="siteHead.jsp" />
<section>
<div id="mainBox">
 <div class="text01"> <%=detailList.getP_title() %></div>
 <div class="text02">
 <%=detailList.getP_date() %>  | 
 <%=detailList.getAr_name() %>
  <a href="#">
 <image src="../image/location.png">
 </a>
 </div>
 <br>
 <hr>
 
 <div id="infobox">
 <article id="leftimege">
     <div><img src="../file/<%=detailList.getP_image() %>"></div>
 </article> 
 
  <article id="rightinfo">
  
     <div class="item_condition">
         <div class="condition_state01">
         <span><b>장르</b></span>
         </div>
       <div class="condition_state02">
         <span><%=detailList.getP_genre() %></span>
       </div>
       </div>
       
       
   	 <div class="item_condition">
      <div class="condition_state01">
           <span><b>공연장</b></span>
        </div>
        <div class="condition_state02">
           <span><%=detailList.getAr_name() %></span>
        </div>
        </div>
        
       <div class="item_condition">
         <div class="condition_state01">
         <span><b>공연기간</b></span>
         </div>
       <div class="condition_state02">
         <span><%=detailList.getP_date() %></span>
       </div>
       </div>
       
        <div class="item_condition">
         <div class="condition_state01">
         <span><b>공연시간</b></span>
         </div>
       <div class="condition_state02">
         <span><%=detailList.getRunningtime() %></span>
       </div>
       </div>
       
         <div class="item_condition">
         <div class="condition_state01">
         <span><b>관람연령</b></span>
         </div>
       <div class="condition_state02">
         <span><%=detailList.getRating() %></span>
       </div>
       </div>
       
       <div class="item_condition">
         <div class="condition_state01">
         <span><b>출연자</b></span>
         </div>
       <div class="condition_state02">
         <span><%=detailList.getP_cast() %></span>
       </div>
       </div>
           
      <div class="item_condition">
       <div class="condition_state01">
       <span><b>가격</b></span>
       </div>
       <div class="condition_state02">
       <span><%=detailList.getP_price() %></span>
       </div>
      </div>
              
 </article> 
 </div>
   
 <div>
	<input type="button" value="예매하기" class="write" onclick="">
</div>

 <div class="text01">상세정보</div>
 <hr>
 
<div id="infodetailbox"><img src="../file/<%=detailList.getP_info() %>"></div>



<%-- <div>
<a href="../pages/TicketModify.to?P_code=<%=detailList.getP_code() %>">[수정] </a>
<a href="../pages/TicketList.to">[목록]</a>
</div> --%>

</div>
</section>
<footer>
<jsp:include page="siteFooter.jsp" />
</footer>
</body>
</html>