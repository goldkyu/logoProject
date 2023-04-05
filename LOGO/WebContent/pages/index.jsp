<%@ page language="java" contentType="text/html;charset =utf-8" pageEncoding="utf-8" %>

	<!DOCTYPE html>
	<html>

	<head>
		<title>LOGO</title>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="../CSS/index.css">
	</head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="../js/index.js"></script>



	<body style="overflow-x: hidden">
		<% request.setCharacterEncoding("utf-8"); %>
			<jsp:include page="siteHead.jsp" />

			<div>
				<div id="image_banner">
					<div id="ylocation"></div>
					<div class="click-div" id="left-div" onclick="left_click()"><img src="../image/btn_left.png" alt="">
					</div>
					<div class="click-div" id="right-div" onclick="right_click()"><img src="../image/btn_right.png"
							alt=""></div>
					<ul id="visual" class="on1">
						<li><img src="../image/mainbanner4.PNG" alt=""></li>
						<li><img src="../image/mainbanner3.PNG" alt=""></li>
						<li><img src="../image/mainbanner5.PNG" alt=""></li>
						<li><img src="../image/mainbanner6.jpg" alt=""></li>
					</ul>
				</div>
			</div>

			<section>
				<div id="mainBox">
					<div class="textbox">What's Hot</div>

					<div id="category">
						<ul>
							<br>
							<li id="music">MUSIC</li>
							<li id="ticket">TICKET</li>
							<li id="shopping">SHOPPING</li>
						</ul>
					</div>
					<br>

					<div id="box1">
						<div class="musicCon">
							<ul>
								<article id="box2">
									<li>
										<div id="box2_1">
											<ul>
												<li>최신음악</li>
												<ul>
										</div>

										<article id="box2-2">
											<div id="albums">
												<div>앨범 1</div>
												<div>앨범 2</div>
												<div>앨범 3</div>
												<div>앨범 4</div>
												<div>앨범 5</div>
												<div>앨범 6</div>
												<div>앨범 7</div>
												<div>앨범 8</div>
												<div>앨범 9</div>
											</div>
										</article>
									</li>
								</article>

								<article id="box3">
									<div>
										<article id="curChart">
											<div id="realtime">실시간 차트</div>
											<div id="charts">
												<div>
													<div>1</div>
													<div>등락</div>
													<div>음악 이름</div>
													<div>가수명</div>

												</div>
												<div>
													<div>2</div>
													<div>등락</div>
													<div>음악 이름</div>
													<div>가수명</div>

												</div>
												<div>
													<div>3</div>
													<div>등락</div>
													<div>음악 이름</div>
													<div>가수명</div>

												</div>
												<div>
													<div>4</div>
													<div>등락</div>
													<div>음악 이름</div>
													<div>가수명</div>

												</div>
												<div>
													<div>5</div>
													<div>등락</div>
													<div>음악 이름</div>
													<div>가수명</div>

												</div>
												<div>
													<div>6</div>
													<div>등락</div>
													<div>음악 이름</div>
													<div>가수명</div>

												</div>
												<div>
													<div>7</div>
													<div>등락</div>
													<div>음악 이름</div>
													<div>가수명</div>

												</div>
												<div>
													<div>8</div>
													<div>등락</div>
													<div>음악 이름</div>
													<div>가수명</div>

												</div>
												<div>
													<div>9</div>
													<div>등락</div>
													<div>음악 이름</div>
													<div>가수명</div>

												</div>
												<div>
													<div>10</div>
													<div>등락</div>
													<div>음악 이름</div>
													<div>가수명</div>

												</div>
											</div>
											<li></li>
										</article>
									</div>
								</article>
							</ul>
						</div>

						<!-- 티켓탭부분 -->
						<div class="ticketCon">
							<ul>
								<article id="box2">
									<li>
										<div id="box2_1">
											<ul>
												<li><b>PICK! 추천공연</b></li>
												<ul>
										</div>

										<article id="box2-2">
											<div id="albums">
												<div>
													<image src="../image/tk_index01.jpg">
												</div>
												<div>
													<image src="../image/tk_index02.jpg">
												</div>
												<div>
													<image src="../image/tk_index03.jpg">
												</div>
												<div>
													<image src="../image/tk_index04.jpg">
												</div>
												<div>
													<image src="../image/tk_index05.jpg">
												</div>
												<div>
													<image src="../image/tk_index06.jpg">
												</div>
												<div>
													<image src="../image/tk_index07.jpg">
												</div>
												<div>
													<image src="../image/tk_index08.jpg">
												</div>
												<div>
													<image src="../image/tk_index09.jpg">
												</div>
											</div>
										</article>
									</li>
								</article>

								<article id="box3">
									<div>
										<div id="bo3_1">
											<div class="tkrank"><b>RANKING</b></div>
											<div class="tkrank01">
																			
											 <button id="rank" onclick="prev();"> > </button> <button id="rank01" onclick="next();"> < </button>	
    										 <img id="imgSlide" src="../image/tk_ranking01.jpg" width="450" height="520">
    										    										 
											</div>
										</div>
									</div>
								</article>
							</ul>
						</div>
						<!-- 티켓탭부분 -->

						<div class="shopCon">
							<ul>
								<article id="box2">
									<li>
										<div id="box2_1">
											<ul>
												<li><b>Album&Goods</b></li>
												<ul>
										</div>

										<article id="box2-2">
											<div id="albums">
												<div>
													<image src="../image/sp_index01.jpg">
												</div>
												<div>
													<image src="../image/sp_index02.jpg">
												</div>
												<div>
													<image src="../image/sp_index03.jpg">
												</div>
												<div>
													<image src="../image/sp_index04.jpg">
												</div>
												<div>
													<image src="../image/sp_index05.jpg">
												</div>
												<div>
													<image src="../image/sp_index06.jpg">
												</div>
												<div>
													<image src="../image/sp_index07.jpg">
												</div>
												<div>
													<image src="../image/sp_index08.jpg">
												</div>
												<div>
													<image src="../image/sp_index09.jpg">
												</div>
											</div>
										</article>
									</li>
								</article>

								<article id="box3">
									<div>
										<div id="bo3_1">
											<div class="tkrank"><b>PRODUCT</b></div>
											<div class="tkrank01">
																			
									 		 <button id="rank" onclick="gs_prev();"> > </button> <button id="rank01" onclick="gs_next();"> < </button>	
    										 <img id="gsimgSlide" src="../image/sp_product02.jpg" width="450" height="520"> 
    										    										 
											</div>
										</div>
									</div>
								</article>
							</ul>
						</div>
						
					<div id="linkbtn">
						<form>
							<a href="musicMain.jsp"> <input type="button" value="Music바로가기" class="btn">
							</a>
						</form>
					</div>


<!-- 중간배너-->
		<div id="midbanner">
			
			<div>
			<image src="../image/index_midbanner.png">
			</div>	
				
			<div class="textbox01">EVENT</div>
			
			<div id="eventbanner">
			
				<div class="eventbox">
				<image src="../image/eventbanner01.png">
				</div>
				
				<div class="eventbox01">
				<image src="../image/eventbanner02.png">
				</div>
				
				<div class="eventbox02">
				<image src="../image/eventbanner03.png">
				</div>
				
			</div>
			
		</div>
<!--   -->					
				</div>
			</section>

			<jsp:include page="siteFooter.jsp" />

	</body>

	<script type="text/javascript">
		let index = 0;
		let interval = setInterval(banner, 5000)
		let visual = document.querySelector("#visual")

		function banner(n) {
			if (index == 4) { index = 0 }

			visual.setAttribute("class", "on" + (index + 1));
			index++
		}

		$('#left-div').click(function(){
			index--;
			if(index < 0){index = 3}
			visual.setAttribute("class", "on" + (index + 1));
		})
		
		$('#right-div').click(function(){
			index++;
			if (index >= 4) { index = 0 }
			visual.setAttribute("class", "on" + (index + 1));
		})
		

	</script>

<!-- 티켓탭스크립트-->	
	<script>
        let imgSlide = document.querySelector("#imgSlide");
        let imgList = ["../image/tk_ranking01.jpg","../image/tk_ranking02.jpg","../image/tk_ranking03.jpg"];
        let i = 0;

        function prev(){ // 이전
            i--;
            imgSlide.src = imgList[i];
            if(i<0){
                i = imgList.length-1;
                imgSlide.src = imgList[i];
            }
        }

        function next(){ // 다음
            i++;
            imgSlide.src = imgList[i];
            if(i >= imgList.length){
                i = 0;
                imgSlide.src = imgList[i];
            }
        }
    </script>
<!--   -->


<!-- 쇼핑탭스크립트-->	
	<script>
        let imgSlide = document.querySelector("#gsimgSlide");
        let imgList = ["../image/sp_product02.jpg","../image/sp_product01.jpg","../image/sp_product03.jpg"];
        let i = 0;

        function gs_prev(){ // 이전
            i--;
            imgSlide.src = imgList[i];
            if(i<0){
                i = imgList.length-1;
                imgSlide.src = imgList[i];
            }
        }

        function gs_next(){ // 다음
            i++;
            imgSlide.src = imgList[i];
            if(i >= imgList.length){
                i = 0;
                imgSlide.src = imgList[i];
            }
        }
    </script>
	

	</html>