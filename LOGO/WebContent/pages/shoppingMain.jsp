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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script>
    $(function () {
        $("#moreBtn").click(function () {
            $('.box3:hidden').slice(0, 1).slideDown("fast");
            $('.image').slice(0, 5).show();
            $('.image:hidden').slice(0, 5).slideDown("fast");
            if ($('.image:hidden').length == 0) {
                $(this).fadeOut("fast");
            }
            $('html,body').animate({
                scrollTop: $(this).offset().top
            }, 2500);
            return false;
        });
    });    
</script>

<body>
<jsp:include page="siteHead.jsp" />
      <section>
        <div id="mainBox">
            <div id="box">
                <nav id="category">

                    <ul><br>
                        <li style="margin-left: 430px;"><a href="#">ALBUM</a>
                            <ul>
                                <li><a href="#"> CD </a></li>
                                <li><a href="#"> DVD </a></li>
                                <li><a href="#"> etc. </a></li>
                            </ul>
                        </li>

                        <li style="margin-left: 100px;"><a href="#">PHOTO</a>
                            <ul>
                                <li><a href="#"> Printed </a></li>
                                <li><a href="#"> Photo Book </a></li>
                            </ul>
                        </li>

                        <li style="margin-left: 100px;"><a href="#">CONCERT</a>
                            <ul>
                                <li><a href="#"> Official Fanlight </a></li>
                                <li><a href="#"> Concert Goods</a></li>
                            </ul>
                        </li>

                        <li style="margin-left: 100px;"><a href="#">FASHION</a>
                            <ul>
                                <li><a href="#"> Clothing </a></li>
                                <li><a href="#"> Acc</a></li>
                                <li><a href="#"> Jewelry</a></li>
                            </ul>
                        </li>

                        <li style="margin-left: 100px;"><a href="#">CUSTOMIZING</a>
                            <ul>
                                <li><a href="#"> Phone Case </a></li>
                                <li><a href="#"> Fashion</a></li>
                                <li><a href="#"> Acc</a></li>
                            </ul>
                        </li>
                        <li style="margin-left: 100px;"><a href="../pages/shoppingBoard.jsp">REVIEW</a></li>
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

            <div class="box1"><br>
                <article class="img2-2"><a href="#">
                        <img src="../image/sh21.png"> K-will 2023 SEASONS GREETINGS : 1230 WILL ST. <br>38,000원
                </article></a>
                <article class="img2-2"><a href="#">
                        <img src="../image/sh22.png">(ver.2) IVE The 1st Single Album ELEVEN<br>14,900원</article></a>
                <article class="img2-2"><a href="#">
                        <img src="../image/sh23.png">CRAVITY 1ST ALBUM PART2 LIBERTY IN OUR COSMOS (SET)<br>53,400원
                </article></a>
                <article class="img2-2"><a href="#">
                        <img src="../image/sh24.png">KIHYUN The 1st Single Album 'VOYAGER<br>11,000원</article></a>
                <article class="img2-2"><a href="#">
                        <img src="../image/sh25.png">(VER SET) IVE THE 2ND SINGLE ALBUM LOVE DIVE <br>44,700원</article>
                </a>
            </div>

            <div id="All"> All Product</div>
            <div class="box1">
                <article class="img2-2"><a href="#">
                        <img src="../image/sh-15.jpg">[OREO] BLACKPINK OREO CHOCO <br>80*2개<br>2,900원</article></a>
                <article class="img2-2"><a href="#">
                        <img src="../image/sh07.png"> 기현 캐릭터 MD - 햄상이 미니 인형<br>※ 1인당 5EA구매 한정<br>18,000원</article></a>
                <article class="img2-2"><a href="#">
                        <img src="../image/sh16.png"> IVE(아이브) 아크릴 응원봉<br>※ 1인당 3EA 구매 한정<br>18,000원</article></a>
                <article class="img2-2"><a href="#">
                        <img src="../image/sh14.png"> 아이브(IVE) 싱글 1집 ELEVEN 포토 슬로건<br>※ 최대구매수량:ID당 5개<br>15,000 원
                </article></a>
                <article class="img2-2"><a href="#">
                        <img src="../image/sh10.png"> LEE DONGWOOK 2023 SEASONS GREETINGS : PRISM<br>45,000원</article>
                </a>
            </div>

            <div class="box2">
                <article class="img2-2"><a href="#">
                        <img src="../image/sh11.png"> [유연석] T-Shirt<br>32,000원</article></a>
                <article class="img2-2"><a href="#">
                        <img src="../image/sh12.png"> CRAVITY 2023 SEASONS GREETINGS : CRVTs SWEETS<br>🔥뜨거운 반응으로 추가
                        오픈🔥<br>42,000원</article></a>
                <article class="img2-2"><a href="#">
                        <img src="../image/sh13.png">(VER SET) CRAVITY 5TH MINI ALBUM MASTER:PIECE<br>53,400원</article>
                </a>
                <article class="img2-2"><a href="#">
                        <img src="../image/sh09.png"> MONSTA X NO LIMIT TOUR in SEOUL DVD<br>46,000원</article></a>
                <article class="img2-2"><a href="#">
                        <img src="../image/sh15.png"> WJSN 2023 SEASONS GREETINGS : THE MOOD<br>🔥뜨거운 반응으로 추가
                        오픈🔥<br>42,000원</article></a>
            </div>

            <div class="box2">
                <article class="img2-2"><a href="#">
                        <img src="../image/sh17.png"> IVE 2023 SEASONS GREETINGS : READY GET SET IVE<br>🔥뜨거운 반응으로 추가
                        오픈🔥<br>42,000 원</article></a>
                <article class="img2-2"><a href="#">
                        <img src="../image/sh18.png"> IVE 공식 응원봉 ver.1<br>42,000 원</article></a>
                <article class="img2-2"><a href="#">
                        <img src="../image/sh19.png"> JEONG SEWOON 2023 SEASONS GREETINGS : S-531 - THE LUCKY
                        PRINCE<br>42,000원</article></a>
                <article class="img2-2"><a href="#">
                        <img src="../image/sh08.png"> MONSTA X 2023 SEASONS GREETINGS : MON COUVERT (WALL CALENDAR
                        ver.)<br>38,000원</article></a>
                <article class="img2-2"><a href="#">
                        <img src="../image/sh20.png"> 손우현 팬미팅 - 2023 캘린더 세트 <br>※ 1인당 5EA 구매 한정<br>22,000원</article></a>
            </div>

            <div class="box3">
                <div class="image">
                    <article class="img2-2"><a href="#">
                            <img src="../image/sh21.png"> K-will 2023 SEASONS GREETINGS : 1230 WILL ST. <br>38,000원
                    </article></a>
                </div>
                <div class="image">
                    <article class="img2-2"><a href="#">
                            <img src="../image/sh22.png"> (ver.2) IVE The 1st Single Album ELEVEN<br>14,900원</article>
                    </a>
                </div>
                <div class="image">
                    <article class="img2-2"><a href="#">
                            <img src="../image/sh23.png"> CRAVITY 1ST ALBUM PART2 LIBERTY IN OUR COSMOS (SET)<br>49,000원
                    </article></a>
                </div>
                <div class="image">
                    <article class="img2-2"><a href="#">
                            <img src="../image/sh24.png"> KIHYUN The 1st Single Album 'VOYAGER<br>11,000원</article></a>
                </div>
                <div class="image">
                    <article class="img2-2"><a href="#">
                            <img src="../image/sh25.png"> (VER SET) IVE THE 2ND SINGLE ALBUM LOVE DIVE <br>44,700원
                    </article></a>
                </div>
            </div>

            <div class="box3">
                <div class="image">
                    <article class="img2-2"><a href="#">
                            <img src="../image/sh26.png"> MONSTA X Mini Album SHAPE of LOVE - VER SET<br>65,200원
                    </article></a>
                </div>
                <div class="image">
                    <article class="img2-2"><a href="#">
                            <img src="../image/sh27.png"> (SET) JEONG SEWOON THE 5TH MINI ALBUM WHERE IS MY
                            GARDEN<br>51,300원</article></a>
                </div>
                <div class="image">
                    <article class="img2-2"><a href="#">
                            <img src="../image/sh28.png"> (VER SET/JEWEL SET)우주소녀 WJSN SPECIAL SINGLE ALBUM
                            SEQUENCE<br>158,900원</article></a>
                </div>
                <div class="image">
                    <article class="img2-2"><a href="#">
                            <img src="../image/sh29.png"> (VER SET) IVE 3RD SINGLE ALBUM AFTER LIKE<br>44,700원</article>
                    </a>
                </div>
                <div class="image">
                    <article class="img2-2"><a href="#">
                            <img src="../image/sh30.png"> (VER SET / JEWEL SET) CRAVITY 4TH MINI ALBUM NEW
                            WAVE<br>152,400 원</article></a>
                </div>
            </div>

            <div class="box3">
                <div class="image">
                    <article class="img2-2"><a href="#">
                            <img src="../image/sh31.png"> (VER SET) KIHYUN 1ST MINI ALBUM YOUTH<br>53,400원</article></a>
                </div>
                <div class="image">
                    <article class="img2-2"><a href="#">
                            <img src="../image/sh22.png"> (ver.2) IVE The 1st Single Album ELEVEN<br>14,900원</article>
                    </a>
                </div>
                <div class="image">
                    <article class="img2-2"><a href="#">
                            <img src="../image/sh23.png"> CRAVITY 1ST ALBUM PART2 LIBERTY IN OUR COSMOS(SET)<br> 49,000원
                    </article></a>
                </div>
                <div class="image">
                    <article class="img2-2"><a href="#">
                            <img src="../image/sh24.png"> KIHYUN The 1st Single Album 'VOYAGER<br>11,000원</article></a>
                </div>
                <div class="image">
                    <article class="img2-2"><a href="#">
                            <img src="../image/sh25.png"> (VER SET) IVE THE 2ND SINGLE ALBUM LOVE DIVE <br>44,700원
                    </article></a>
                </div>
            </div>

        </div>
        <div><button class="load-more" id="moreBtn"> +더보기 </button></div>
    </section>

    <footer>
        	<jsp:include page="siteFooter.jsp" />
    </footer>
</body>

</html>