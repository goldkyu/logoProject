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


// �ǹڽ�

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

<body>
    <% request.setCharacterEncoding("utf-8"); %>
    <jsp:include page="siteHead.jsp"/>
    
    <section>
        <div id="mainBox">
         
          <div id="category">   
              <ul class="menu">
                <li>
                 <a href="#">�ܼ�Ʈ</a>
                <ul class="depth_1">
                <li><a href="#">����������</a></li>
                <li><a href="#">�ؿܹ�����</a></li>
                </ul>
                </li>

                <li>
                <a href="#">�佺Ƽ��</a>
                <ul class="depth_1">
                <li><a href="#">�����佺Ƽ��</a></li>
                <li><a href="#">��ũ/����</a></li>
                </ul>
                </li>

                <li>
                <a href="#">�������</a>
                </li>

                <li>
                <a href="../pages/tkBoard.jsp">���������ı�</a>
                </li>

                <li>
                <a href="#">MyƼ��</a>
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
                        <li class="on">���������佺Ƽ��</li>
                        <li>ONEW 1st CONCERT</li>
                        <li>2023 aespa 1st Concert </li>
                        <li>LOVESOME ������ ������</li>
                        <li>���� �ѷ��ڽ��� ���Ѱ���</li>
                        <li>����� ù ��° �ҹ���</li>
                    </ul>
                    <div class="tab_cont">
                     <div class="on"> 
                                             
                          <a href="#">
                          <img src="../image/T_banner02.jpg" class="bannerimg">
                          </a>
                   
                    
                        <div> 
                          <a href="#">
                          <img src="../image/T_banner03.jpg" class="bannerimg">
                          </a> 
                        </div>
                        <div> 
                          <a href="#">
                          <img src="../image/T_banner04.jpg" class="bannerimg">
                          </a>     
                        </div>
                        <div> 
                          <a href="#">
                          <img src="../image/T_banner05.jpg" class="bannerimg">
                          </a>   
                        </div>
                        <div>
                          <a href="#">
                          <img src="../image/T_banner06.jpg" class="bannerimg">
                          </a> 
                        </div>
                        <div>
                         <a href="#">
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
                        <a href="#">
                        <img src="../image/rk_img01.jpg">
                        </a>
                    </div> 

                    <div class="ranking_box02">
                        <a href="#">
                        <img src="../image/rk_img02.jpg">
                        </a>
                    </div>   

                    <div class="ranking_box03">
                        <a href="#">
                        <img src="../image/rk_img03.jpg">
                        </a>
                    </div>   

                    <div class="ranking_box04">
                        <a href="#">
                        <img src="../image/rk_img04.gif">
                        </a>
                    </div>     

                    <div class="ranking_text01">
                        BoA 20th Anniversary Live<br>
                        2023.03.11 ~ 2023.03.12
                    </div> 

                    <div class="ranking_text02">
                        �˷� ��ũ�� <br>���� ���� LIVE<br>
                        2023.07.08 ~ 2023.07.08
                    </div>  

                    <div class="ranking_text03">
                        2023 aespa 1st Concert <br>
                        2023.02.25 ~ 2023.02.26
                    </div>     
                    
                    <div class="ranking_text04">
                        2023 SVT 7TH FAN MEETING <br>
                        2023.03.10 ~ 2023.03.12
                    </div>     

                </article>
            </div>

            <div class="text01"> TICKET OPEN </div>

            <div id="imagesection">
                <article class="imagebox01">
                    <a href="#">
                    <image src="../image/tiketopen01.jpg">
                    </a>    
                </article>
                <article class="imagebox02">
                    <a href="#">
                    <image src="../image/tiketopen02.jpg">
                    </a> 
                </article>   
                <article class="imagebox03">
                     <a href="#">
                    <image src="../image/tiketopen03.jpg">
                    </a> 
                </article>
                <article class="imagebox04">
                    <a href="#">
                    <image src="../image/tiketopen04.jpg">
                    </a>
                </article>

            </div>

            <div id="textsection">
                <article class="textbox01">
                    <a href="#">
                    <h4>NEW HOPE CLUB LIVE IN SEOUL</h4>
                     2023.02.23(��) PM12:00<br>
                    YES24 LIVE HALL
                    </a>  
                </article>
                <article class="textbox02">
                    <a href="#">
                    <h4>YOUME IS SPRING</h4>
                     2023.02.22(��) PM19:00<br>
                     ����Ʈ�긴��
                    </a>  
                </article>
                <article class="textbox03">
                   <a href="#">
                    <h4>2023 ������ �ܵ����� Object</h4>
                     2023.02.22(��) PM20:00<br>
                     ��鼶 ���̺��Ͽ콺
                    </a>
                </article>
                <article class="textbox04">
                    <a href="#">
                    <h4>���� �ѷ��ڽ��� ���Ѱ���</h4>
                     2023.02.22(��) AM10:00<br>
                      YES24 LIVE HALL
                    </a>  
                </article>
            </div>

            <div class="text02"> CONCERT & FESTIVAL</div>

            <div id="imagesection">
                <article class="imagebox01">
                    <a href="#">
                    <image src="../image/concert01.jpg">
                    </a>
                </article>
                <article class="imagebox02">
                    <a href="#">
                    <image src="../image/concert02.jpg">
                    </a>
                </article>
                <article class="imagebox03">
                    <a href="#">
                    <image src="../image/concert03.jpg">
                    </a>
                </article>
                <article class="imagebox04">
                    <a href="#">
                    <image src="../image/concert04.gif">
                    </a>
                </article>

            </div>

            <div id="textsection">
                <article class="textbox01">
                    <a href="#">
                    <h4>2023 ���� �佺Ƽ��</h4>
                     2023.04.29 ~ 2023.04.30<br>
                      �������б� ��õ����
                    </a>  
                </article>
                <article class="textbox02">
                    <a href="#">
                    <h4>BoA 20th Anniversary Live</h4>
                     2023.03.11 ~ 2023.03.12<br>
                      �ø��Ȱ��� Ү �ø���Ȧ
                    </a>  
                </article>
                <article class="textbox03">
                   <a href="#">
                    <h4>��� �����ܼ�Ʈ[���ֽø� �� �ɱ�䣿]</h4>
                     2023.03.25 ~ 2023.03.26<br>
                      YES24 LIVE HALL
                    </a>  
                </article>
                 <article class="textbox04">
                   <a href="#">
                    <h4>2���̺극��ũ �ܵ� �ܼ�Ʈ</h4>
                     2023.03.04 ~ 2023.03.05<br>
                     ��ȭ���ڴ��б� �ＺȦ
                    </a>  
                </article>
            </div>

              <div class="text02"> EXHIBITION </div>

            <div id="imagesection">
                <article class="imagebox01">
                    <a href="#">
                    <image src="../image/exhibi01.jpg">
                    </a>
                </article>
                <article class="imagebox02">
                    <a href="#">
                    <image src="../image/exhibi02.gif">
                    </a>
                </article>
                <article class="imagebox03">
                    <a href="#">
                    <image src="../image/exhibi03.gif">
                    </a>
                </article>
                <article class="imagebox04">
                    <a href="#">
                    <image src="../image/exhibi04.gif">
                    </a>
                </article>

            </div>

            <div id="textsection">
                <article class="textbox01">
                    <a href="#">
                    <h4>���̺�� ȣũ��&�긮Ƽ�� �˾�Ʈ</h4>
                     2023.03.23 ~ 2023.07.02<br>
                     ���빮�������ö��� ������ ����1��
                    </a>  
                </article>
                <article class="textbox02">
                    <a href="#">
                    <h4>������ ��Ÿ�����÷� �� ������</h4>
                     2022.09.30 ~2023.03.01<br>
                     ���̾�Ʈ������
                    </a>  
                </article>
                <article class="textbox03">
                   <a href="#">
                    <h4>��Ż�� ī��Ǫ���� ������</h4>
                     2022.12.23 ~ 2023.05.07<br>
                     ��Ż�� ī��Ǫ���� ������
                    </a>  
                </article>
                 <article class="textbox04">
                   <a href="#">
                    <h4>London X Seoul, ��ũ������ ������</h4>
                     2023.02.24 ~ 2023.03.12<br>
                     ��ŸƮ�÷��� (StART PLUS)
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