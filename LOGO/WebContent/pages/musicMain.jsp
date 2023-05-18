<%@page import="vo.UserListen"%>
<%@ page language="java" contentType="text/html;charset =utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="vo.Album"%>
<%@ page import="vo.Music"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<% String id = (String)session.getAttribute("userID"); %>

<head>
<meta charset="UTF-8">
<title>LOGO MUSIC</title>
<link rel="stylesheet" href="../CSS/musicMain.css">
<link rel="stylesheet" href="../CSS/graph.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">


<!-- 차트 링크 -->
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="../js/musicMain.js"></script>
<script src="../js/albums.js"></script>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<% if(request.getAttribute("viewChart").equals("1")){
	ArrayList<UserListen> ul = (ArrayList<UserListen>)request.getAttribute("chartInfo");
	ArrayList<Music> ml =(ArrayList<Music>)request.getAttribute("chartMusic");

	for(UserListen u : ul){
		System.out.println("m_id : " + u.getLISTEN_MUSIC_ID());
	}
	for(Music m : ml){
		System.out.println("m_name : " + m.getMUSIC_NAME());
	}
%>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	let today = new Date();
	let month = today.getMonth() + 1;
	let date = today.getDate();
	
	

	
	
	var day1 = month + '-' + date
	var day2 = new Date(today.setDate(today.getDate()-1)).getMonth()+1 + "-" + new Date(today.setDate(today.getDate())).getDate();
	var day3 = new Date(today.setDate(today.getDate()-1)).getMonth()+1 + "-" + new Date(today.setDate(today.getDate())).getDate();
	var day4 = new Date(today.setDate(today.getDate()-1)).getMonth()+1 + "-" + new Date(today.setDate(today.getDate())).getDate();
	var day5 = new Date(today.setDate(today.getDate()-1)).getMonth()+1 + "-" + new Date(today.setDate(today.getDate())).getDate();
	var day6 = new Date(today.setDate(today.getDate()-1)).getMonth()+1 + "-" + new Date(today.setDate(today.getDate())).getDate();
	var day7 = new Date(today.setDate(today.getDate()-1)).getMonth()+1 + "-" + new Date(today.setDate(today.getDate())).getDate();
	var day8 = new Date(today.setDate(today.getDate()-1)).getMonth()+1 + "-" + new Date(today.setDate(today.getDate())).getDate();
	var day9 = new Date(today.setDate(today.getDate()-1)).getMonth()+1 + "-" + new Date(today.setDate(today.getDate())).getDate();
	var day10 = new Date(today.setDate(today.getDate()-1)).getMonth()+1 + "-" + new Date(today.setDate(today.getDate())).getDate();
	var day11 = new Date(today.setDate(today.getDate()-1)).getMonth()+1 + "-" + new Date(today.setDate(today.getDate())).getDate();
	var day12 = new Date(today.setDate(today.getDate()-1)).getMonth()+1 + "-" + new Date(today.setDate(today.getDate())).getDate();
	var day13 = new Date(today.setDate(today.getDate()-1)).getMonth()+1 + "-" + new Date(today.setDate(today.getDate())).getDate();
	var day14 = new Date(today.setDate(today.getDate()-1)).getMonth()+1 + "-" + new Date(today.setDate(today.getDate())).getDate();
	
	
	
	var data, chart, options;

	
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
			[ 'Date',<%for(int i = 0; i < ul.size(); i++){%>"<%= ml.get(i).getMUSIC_NAME()%>",<%}%> ],
			[ day14, <%for(int i = 0; i < ul.size(); i++){%><%= ul.get(i).getLISTEN_COUNT_DAY14()%>,<%}%> ],
			[ day13, <%for(int i = 0; i < ul.size(); i++){%><%= ul.get(i).getLISTEN_COUNT_DAY13()%>,<%}%> ],
			[ day12, <%for(int i = 0; i < ul.size(); i++){%><%= ul.get(i).getLISTEN_COUNT_DAY12()%>,<%}%> ],
			[ day11, <%for(int i = 0; i < ul.size(); i++){%><%= ul.get(i).getLISTEN_COUNT_DAY11()%>,<%}%> ],
			[ day10, <%for(int i = 0; i < ul.size(); i++){%><%= ul.get(i).getLISTEN_COUNT_DAY10()%>,<%}%> ],
			[ day9, <%for(int i = 0; i < ul.size(); i++){%><%= ul.get(i).getLISTEN_COUNT_DAY9()%>,<%}%> ],
			[ day8, <%for(int i = 0; i < ul.size(); i++){%><%= ul.get(i).getLISTEN_COUNT_DAY8()%>,<%}%> ],
			[ day7, <%for(int i = 0; i < ul.size(); i++){%><%= ul.get(i).getLISTEN_COUNT_DAY7()%>,<%}%> ],
			[ day6, <%for(int i = 0; i < ul.size(); i++){%><%= ul.get(i).getLISTEN_COUNT_DAY6()%>,<%}%> ],
			[ day5, <%for(int i = 0; i < ul.size(); i++){%><%= ul.get(i).getLISTEN_COUNT_DAY5()%>,<%}%> ],
			[ day4, <%for(int i = 0; i < ul.size(); i++){%><%= ul.get(i).getLISTEN_COUNT_DAY4()%>,<%}%> ],
			[ day3, <%for(int i = 0; i < ul.size(); i++){%><%= ul.get(i).getLISTEN_COUNT_DAY3()%>,<%}%> ],
			[ day2, <%for(int i = 0; i < ul.size(); i++){%><%= ul.get(i).getLISTEN_COUNT_DAY2()%>,<%}%> ],
			[ day1, <%for(int i = 0; i < ul.size(); i++){%><%= ul.get(i).getLISTEN_COUNT_DAY1()%>,<%}%> ] ]);

		var options = {
			title : '나만의 차트',
			curveType : 'function',
			legend : {
				position : 'bottom',
				scrollArrows : 'vertical'
			},
			series : {
				0 : {
					color : '#D9AD29'
				},
				1 : {
					color : '#A67926'
				},
				2 : {
					color : '#734B1A'
				},
				3 : {
					color : '#FACF1E'
				},
				4 : {
					color : '#262001'
				}
			},
			animation : {
				startup : true,
				duration : 1000, // 애니메이션 지속 시간(밀리초)
				easing : 'out', // 이징(Easing) 함수
			}
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('curve_chart'));

		chart.draw(data, options);

		// Add our selection handler.

		google.visualization.events.addListener(chart, 'select', selectHandler);

		// The selection handler.
		// Loop through all items in the selection and concatenate
		// a single message from all of them.
		function selectHandler() {
			$('.selAlbum').hide();
			$('.selRank').hide();

			// 선택된 요소 가져오기
			var selectedItem = chart.getSelection()[0];

			// 선택된 요소가 있을 경우에만 처리
			if (selectedItem) {

				// 선택된 요소의 행과 열 정보 가져오기
				var row = selectedItem.row;
				var column = selectedItem.column;

				// 선택된 요소의 레이블 정보 가져오기
				var rowLabel = data.getFormattedValue(row, 0);
				var columnLabel = data.getColumnLabel(column);

				// 선택된 요소의 값을 가져오기
				var value = data.getValue(row, column);

				// 출력할 문자열 생성
				var message = '선택된 요소: ' + rowLabel + ', ' + columnLabel + ', '
						+ value;

				var date = rowLabel;
				var name = columnLabel;
				var mCount = value;
				var albumImg;
				var aName;
				
				<%for(int j = 0; j < ml.size(); j++){%>
				
				if (column == <%=j+1%>) {
					albumImg = '<img src="../albums/<%= ml.get(j).getALBUM_PHOTO() %>" alt="">';
				}
				
				if (column == <%=j + 1%>) {
					aName = '<%=ml.get(j).getARTIST_NAME()%>';
				} 
				
				<%}%>

				$('.selAlbum').fadeIn('4000');
				$('.selRank').fadeIn('4000');
				document.getElementById('alDate').innerHTML = date;
				document.getElementById('mName').innerHTML = name;
				document.getElementById('alCount').innerHTML = mCount;
				document.getElementById('selAlbumDiv').innerHTML = albumImg;
				document.getElementById('aName').innerHTML = aName;

			}
			;
		}
		;
	};
</script>
<%
	}
%>

<body style="overflow-x: hidden">
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:include page="musicHead.jsp" />


	<section>
		<div id="mainBox" class="fade">
			<div id="topBox">
				<article id="newMusic">
					<p>NEW Albums</p>
					<div id="albums">
						<%
							ArrayList<Album> albums = (ArrayList<Album>) request.getAttribute("albums");

							System.out.println("메인페이지");
						%>
						<c:forEach items="${albums}" var="a" varStatus="as">
							<div>
								<img id="a${as.index +1 }" src="../albums/${a.ALBUM_PHOTO }"
									alt="">
								<div class="album-name" id="t${as.index +1 }">
									<p>
										<a href="musicAlbumInfo.mu?album_id=${a.ALBUM_ID }">${a.ALBUM_NAME }</a>
									</p>
								</div>

							</div>
						</c:forEach>

					</div>
				</article>
				<article id="onlyMyChart" style="position: relative;">
					<%
						if (request.getAttribute("viewChart").equals("1")) {
					%>
					<div id="curve_chart" style="width: 990px; height: 525px"></div>
					<div id="sels">
						<div id="selStroke">
							<div id="selAlbumDiv" class="selAlbum"></div>
							<div class="selRank">
								<h id="chartDate" class="chartmini"> 날짜 </h>
								<h id="alDate" class="chartbold"></h>
								<br>
								<p id="chartCount" class="chartmini">들은 횟수</p>
								<p id="alCount" class="chartbold"></p>
								<br>
								<p id="mName" class="chartbold"></p>
								<p id="aName" class="chartbold"></p>
							</div>
						</div>
					</div>
					<%
						} else {
					%>
					<div id=selContainer style="position: absolute; left: -100px;">
						<img alt="" src="../image/logoutMyChart.png">
					</div>
					<%
						}
					%>
				</article>
			</div>
			<div id="bottomBox">

				<%
					ArrayList<Music> topChart = (ArrayList<Music>) request.getAttribute("topChart");
				%>
				<article id="curChart">
					<p>실시간 차트 Top 10</p>
					<br>
					<div id="charts">

						<table>
							<c:forEach items="${topChart}" var="t" end="9" varStatus="st">
								<tr>
									<th>
										<p class="ranked">${st.index +1}</p>
									</th>
									<th>
										<p class="rankup">${t.MUSIC_CHART_CHANGED}</p>
									</th>
									<th>
										<div class="rankAl">
											<a href="musicAlbumInfo.mu?album_id=${t.ALBUM_ID}"> <img
												src="../albums/${t.ALBUM_PHOTO}" alt=""></a>
										</div>
										<p class="rankmName">
											<a href="musicAlbumInfo.mu?album_id=${t.ALBUM_ID}">${t.MUSIC_NAME}</a>
										</p>
									</th>
									<th>
										<p class="aName">
											<a href="musicArtistInfo.mu?a_id=${t.ARTIST_ID }">${t.ARTIST_NAME }</a>
										</p>
									</th>
									<th><button
											style="border: none; color: white; background-color: white;"
											class="music-select" data-src="../music/${t.MUSIC_NAME}.mp3">
											<img class="download" src="../image/btn_right.png" alt="">
										</button></th>
									<th><button
											style="border: none; color: white; background-color: white;"
											class="list-select">
											<img class="download" src="../image/download.png" alt="">
										</button> <input type="hidden" value="${t.MUSIC_ID }" /></th>
								</tr>
							</c:forEach>
							<%
								if (request.getAttribute("viewChart").equals("1")) {
							%>
							<div class="popup-container">
								<div class="playlist-popup">
									<ul class="playlist-list">
										<!-- 플레이리스트 목록을 동적으로 생성하거나 서버에서 가져와야 함 -->
										<c:forEach items="${pl }" var="p">
											<li class="pl-add">${p.pl_name }<input class="pl-id"
												type="hidden" value="${p.pl_id }" /></li>

										</c:forEach>
									</ul>
									<button class="close-button">Close</button>
								</div>
							</div>
							<%
								}
							%>
						</table>

					</div>
				</article>
				<article id="events">
					<div>
						<div class="slideshow">

							<div class="slide active">
								<img src="../image/e1.png" alt="Slide 1" />
								<div class="slidedark">
									<p class="slidetext" id="slidetext1"></p>
								</div>
							</div>
							<div class="slide">
								<img src="../image/e2.png" alt="Slide 2" />
								<div class="slidedark">
									<p class="slidetext" id="slidetext2"></p>
								</div>
							</div>
							<div class="slide">
								<img src="../image/e3.png" alt="Slide 3" />
								<div class="slidedark">
									<p class="slidetext" id="slidetext3"></p>
								</div>
							</div>
							<div class="slide">
								<img src="../image/e4.png" alt="Slide 4" />
								<div class="slidedark">
									<p class="slidetext" id="slidetext4"></p>
								</div>
							</div>

						</div>

					</div>
				</article>
			</div>
		</div>
	</section>

	<jsp:include page="siteFooter.jsp" />
</body>
<script type="text/javascript">

var list
$(".list-select").on("click", function() {
	$(".popup-container").fadeIn();
	list = $(this);
});

$(".close-button").on("click", function() {
	$(".popup-container").fadeOut();
});

$(".pl-add").on("click", function(){
	var plname = $(this).find(".pl-id").val();
	var mId = list.closest("tr").find("input[type='hidden']").val();
	$.ajax({
        url:"plUpdate.mu",
        type:"POST",
        data:{}, // 전달할 데이터
		success : function(data) {
			// 서블릿에서 전달한 응답을 처리
		},
		error : function(xhr, status, error) {
			// 에러 발생 시 처리
			alert("ajax 실패");
		}
     })
})</script>
</html>