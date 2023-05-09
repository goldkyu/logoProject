<%@page import="vo.TicketInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../CSS/ticketmain.css">
    <title>ticketmain</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js">
</script>

<script>
  jQuery(document).ready(function ($) {

    var slideCount = $('#slider ul li').length;
    var slideWidth = $('#slider ul li').width();
    var slideHeight = $('#slider ul li').height();
    var sliderUlWidth = slideCount * slideWidth;
    
    $('#slider').css({ width: slideWidth, height: slideHeight });
    
    $('#slider ul').css({ width: sliderUlWidth, marginLeft: - slideWidth });
    
    $('#slider ul li:last-child').prependTo('#slider ul');

    function moveLeft() {
        $('#slider ul').animate({
            left: + slideWidth
        }, 200, function () {
            $('#slider ul li:last-child').prependTo('#slider ul');
            $('#slider ul').css('left', '');
        });
    };

    function moveRight() {
        $('#slider ul').animate({
            left: - slideWidth
        }, 200, function () {
            $('#slider ul li:first-child').appendTo('#slider ul');
            $('#slider ul').css('left', '');
        });
    };

    $('a.control_prev').click(function () {
        moveLeft();
    });

    $('a.control_next').click(function () {
        moveRight();
    });

});    


// 탭박스.

$(document).ready(function() {
  $(".tab_title li").click(function() {
    var idx = $(this).index();
    $(".tab_title li").removeClass("on");
    $(".tab_title li").eq(idx).addClass("on");
    $(".tab_cont > div").hide();
    $(".tab_cont > div").eq(idx).show();
  })
});
  
 
</script>

<%
ArrayList<TicketInfo> arr = (ArrayList<TicketInfo>)request.getAttribute("Arr");
%>
<body>
    <% request.setCharacterEncoding("utf-8"); %>
    <jsp:include page="siteHead.jsp"/>
    
    <section>
        <div id="mainBox">
         
          <div id="category">   
              <ul class="menu">
                <li>
                 <a href="../pages/TicketList.to">콘서트</a>
                <ul class="depth_1">
                <li><a href="#">국내뮤지션</a></li>
                <li><a href="#">해외뮤지션</a></li>
                </ul>
                </li>

                <li>
                <a href="#">페스티벌</a>
                <ul class="depth_1">
                <li><a href="#">뮤직페스티벌</a></li>
                <li><a href="#">토크/강연</a></li>
                </ul>
                </li>

                <li>
                <a href="#">전시행사</a>
                </li>

                <li>
                <a href="../pages/tkBoard.jsp">공연관람후기</a>
                </li>

                <li>
                 <a href="../pages/TicketWriteForm.to">My티켓</a>
                </li>
              </ul>
       
          </div>
          <div class="borderline"></div>
            <div>
               <div id="slider">
                <ul>
                  <li><image src="../image/im01.jpg"></li>
                  <li><image src="../image/im02.jpg"></li>
                  <li><image src="../image/im03.jpg"></li>
                  <li><image src="../image/im04.jpg"></li>
                </ul> 
                <a href="#" class="control_next">></a>
               <a href="#" class="control_prev"><</a> 
            </div>
            </div>

            <div>
                <article id="leftranking">
                  <div class="container">
                    <ul class="tab_title">
                        <li class="on">서울재즈페스티벌</li>
                        <li>2023 iKON WORLD TOUR</li>
                        <li>장기하 단독공연 ＂해!＂ </li>
                        <li>LOVESOME 불편한 편의점</li>
                        <li>노을 콘서트 〈Cafe 유월〉</li>
                        <li>PEAK FESTIVAL 2023</li>
                    </ul>
                    <div class="tab_cont">
                     <div class="on"> 
                                             
                         <%-- <a href="../pages/TicketDetail.to?P_code=<%=arr.get(12).getP_code()%>"> --%>
                          <img src="../image/T_banner02.jpg" class="bannerimg">
                          </a>
                   
                    
                        <div> 
                      <%--     <a href="../pages/TicketDetail.to?P_code=<%=arr.get(15).getP_code()%>"> --%>
                          <img src="../image/T_banner03.png" class="bannerimg">
                          </a> 
                        </div>
                        
                        <div> 
                         <%--  <a href="../pages/TicketDetail.to?P_code=<%=arr.get(14).getP_code()%>"> --%>
                          <img src="../image/T_banner04.jpg" class="bannerimg">
                          </a>     
                        </div>
                        <div> 
                          <%-- <a href="../pages/TicketDetail.to?P_code=<%=arr.get(13).getP_code()%>"> --%>
                          <img src="../image/T_banner05.jpg" class="bannerimg">
                          </a>   
                        </div>
                        <div>
                         <%--  <a href="../pages/TicketDetail.to?P_code=<%=arr.get(2).getP_code()%>"> --%>
                          <img src="../image/T_banner06.png" class="bannerimg">
                          </a> 
                        </div>
                        <div>
                      <%--    <a href="../pages/TicketDetail.to?P_code=<%=arr.get(0).getP_code()%>"> --%>
                          <img src="../image/T_banner07.jpg" class="bannerimg">
                          </a> 
                        </div>
                    </div>    
                    </div>

                </div>
               </article>
                <article id="rightranking"> 
                
                  <div class="ranking_image">
                   <img src="../image/ranking_tt.png">
                    </div>
                    

                    <div class="ranking_box01">
                     <%--    <a href="../pages/TicketDetail.to?P_code=<%=arr.get(5).getP_code()%>"> --%>
                        <img src="../image/rk_img01.jpg">
                        </a>
                    </div> 

                    <div class="ranking_box02">
                     <%--    <a href="../pages/TicketDetail.to?P_code=<%=arr.get(16).getP_code()%>"> --%>
                        <img src="../image/rk_img02.jpg">
                        </a>
                    </div>   

                    <div class="ranking_box03">
                      <%--   <a href="../pages/TicketDetail.to?P_code=<%=arr.get(14).getP_code()%>"> --%>
                        <img src="../image/rk_img03.jpg">
                        </a>
                    </div>   

                    <div class="ranking_box04">
                   <%-- <a href="../pages/TicketDetail.to?P_code=<%=arr.get(10).getP_code()%>"> --%>
                        <img src="../image/rk_img04.gif">
                        </a>
                    </div>     

                    <div class="ranking_text01">
                        BoA 20th Anniversary Live<br>
                        2023.03.11 ~ 2023.03.12
                    </div> 

                    <div class="ranking_text02">
                   	     NEW HOPE CLUB LIVE IN SEOUL<br>
                        2023.04.23 ~ 2023.04.23
                    </div>  

                    <div class="ranking_text03">
                                                 장기하단독공연＂해!＂ <br>
                        2023.04.21 ~ 2023.04.30
                    </div>     
                    
                    <div class="ranking_text04">
                                                나탈리 카르푸셴코 사진전 <br>
                        2022.12.23 ~ 2023.05.07
                    </div>     

                </article>
            </div>

            <div class="text01"> TICKET OPEN </div>

            <div id="imagesection">
                <article class="imagebox01">
                    <a href="../pages/TicketDetail.to?P_code=<%=arr.get(0).getP_code()%>">
                    <image src="../file/<%= arr.get(0).getP_image() %>">
                    </a>    
                </article>
                <article class="imagebox02">
                    <a href="../pages/TicketDetail.to?P_code=<%=arr.get(1).getP_code()%>">
                    <image src="../file/<%= arr.get(1).getP_image() %>">
                    </a>    
                    </a> 
                </article>   
                <article class="imagebox03">
                     <a href="../pages/TicketDetail.to?P_code=<%=arr.get(2).getP_code()%>">
                    <image src="../file/<%= arr.get(2).getP_image() %>">
                    </a> 
                </article>
                <article class="imagebox04">
                    <a href="../pages/TicketDetail.to?P_code=<%=arr.get(3).getP_code()%>">
                    <image src="../file/<%= arr.get(3).getP_image() %>">
                    </a>
                </article>

            </div>

            <div id="textsection">
                <article class="textbox01">
                    <a href="#">
                    <h4><%= arr.get(0).getP_title() %></h4>
                     <%= arr.get(0).getP_date() %><br>
                    <%= arr.get(0).getAr_name() %>
                    </a>  
                </article>
                <article class="textbox02">
                   <a href="#">
                    <h4><%= arr.get(1).getP_title() %></h4>
                     <%= arr.get(1).getP_date() %><br>
                    <%= arr.get(1).getAr_name() %>
                    </a>  
                </article>
                <article class="textbox03">
                   <a href="#">
                    <h4><%= arr.get(2).getP_title() %></h4>
                     <%= arr.get(2).getP_date() %><br>
                    <%= arr.get(2).getAr_name() %>
                    </a>  
                </article>
                <article class="textbox04">
                    <a href="#">
                    <h4><%= arr.get(3).getP_title() %></h4>
                     <%= arr.get(3).getP_date() %><br>
                    <%= arr.get(3).getAr_name() %>
                    </a>  
                </article>
            </div>

            <div class="text02"> CONCERT & FESTIVAL</div>

            <div id="imagesection">
                <article class="imagebox01">
                    <a href="../pages/TicketDetail.to?P_code=<%=arr.get(4).getP_code()%>">
                    <image src="../file/<%= arr.get(4).getP_image() %>">
                    </a>
                </article>
                <article class="imagebox02">
                    <a href="../pages/TicketDetail.to?P_code=<%=arr.get(5).getP_code()%>">
                    <image src="../file/<%= arr.get(5).getP_image() %>">
                    </a>
                </article>
                <article class="imagebox03">
                   <a href="../pages/TicketDetail.to?P_code=<%=arr.get(6).getP_code()%>">
                   <image src="../file/<%= arr.get(6).getP_image() %>">
                    </a>
                </article>
                <article class="imagebox04">
                    <a href="../pages/TicketDetail.to?P_code=<%=arr.get(7).getP_code()%>">
                    <image src="../file/<%= arr.get(7).getP_image() %>">
                    </a>
                </article>

            </div>

            <div id="textsection">
                <article class="textbox01">
                     <a href="#">
                    <h4><%= arr.get(4).getP_title() %></h4>
                     <%= arr.get(4).getP_date() %><br>
                    <%= arr.get(4).getAr_name() %>
                    </a>  
                </article>
                <article class="textbox02">
                      <a href="#">
                    <h4><%= arr.get(5).getP_title() %></h4>
                     <%= arr.get(5).getP_date() %><br>
                    <%= arr.get(5).getAr_name() %>
                    </a>  
                </article>
                <article class="textbox03">
                   <a href="#">
                    <h4><%= arr.get(6).getP_title() %></h4>
                     <%= arr.get(6).getP_date() %><br>
                    <%= arr.get(6).getAr_name() %>
                    </a>  
                </article>
                 <article class="textbox04">
                   <a href="#">
                    <h4><%= arr.get(7).getP_title() %></h4>
                     <%= arr.get(7).getP_date() %><br>
                    <%= arr.get(7).getAr_name() %>
                    </a>  
                </article>
            </div>

              <div class="text02"> EXHIBITION </div>

            <div id="imagesection">
                <article class="imagebox01">
                    <a href="../pages/TicketDetail.to?P_code=<%=arr.get(8).getP_code()%>">
                     <image src="../file/<%= arr.get(8).getP_image() %>">
                    </a>
                </article>
                <article class="imagebox02">
                   <a href="../pages/TicketDetail.to?P_code=<%=arr.get(9).getP_code()%>">
                   <image src="../file/<%= arr.get(9).getP_image() %>">
                    </a>
                </article>
                <article class="imagebox03">
                   <a href="../pages/TicketDetail.to?P_code=<%=arr.get(10).getP_code()%>">
                   <image src="../file/<%= arr.get(10).getP_image() %>">
                    </a>
                </article>
                <article class="imagebox04">
                  <a href="../pages/TicketDetail.to?P_code=<%=arr.get(11).getP_code()%>">
                  <image src="../file/<%= arr.get(11).getP_image() %>">
                    </a>
                </article>

            </div>

            <div id="textsection">
                <article class="textbox01">
                    <a href="#">
                     <h4><%= arr.get(8).getP_title() %></h4>
                     <%= arr.get(8).getP_date() %><br>
                    <%= arr.get(8).getAr_name() %>
                    </a>  
                </article>
                <article class="textbox02">
                    <a href="#">
                    <h4><%= arr.get(9).getP_title() %></h4>
                     <%= arr.get(9).getP_date() %><br>
                    <%= arr.get(9).getAr_name() %>
                    </a>  
                </article>
                <article class="textbox03">
                   <a href="#">
                     <h4><%= arr.get(10).getP_title() %></h4>
                     <%= arr.get(10).getP_date() %><br>
                    <%= arr.get(10).getAr_name() %>
                    </a>  
                </article>
                 <article class="textbox04">
                   <a href="#">
                       <h4><%= arr.get(11).getP_title() %></h4>
                     <%= arr.get(11).getP_date() %><br>
                    <%= arr.get(11).getAr_name() %>
                    </a>  
                </article>
            </div>
				
        </div>
    </section>

    <footer>
        <div id="mainFooter">
            <div class="footerInner">
                <div style="float:left;">
                 <b>HOME / </b>
                    COMPANY / 
                    AGREEMENT / 
                    PRIVACY POLICY /
                    GUIDE                                        
                    <p class="address">COPYRIGHT (C) TEAMPROJECT. All Rights Reserved.</p>
                    </div>
                <div class="inner_images">
                    <img src="../image/ico_fb.png">
                    <img src="../image/ico_ist.png" style="margin-left: 10px;">
                    <img src="../image/ico_yt.png" style="margin-left: 10px;">
                </div>
            </div>
            
        </div>
    </footer>
</body>

</html>
