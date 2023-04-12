<%@ page language="java" contentType="text/html;charset =utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="vo.Album"%>
<%@ page import="vo.Music"%>

<!DOCTYPE html>
<html>

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
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	var data, chart, options;

	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'Date', 'Hype Boy', 'Unholy', 'That Band', 'Butter', '귀로' ],
				[ '02-15', 1, 4, 5, 12, 8 ], [ '02-16', 6, 1, 8, 4, 9 ],
				[ '02-17', 10, 3, 2, 5, 2 ], [ '02-18', 16, 5, 11, 2, 8 ],
				[ '02-19', 13, 12, 4, 2, 7 ], [ '02-20', 10, 13, 12, 14, 5 ],
				[ '02-21', 14, 15, 13, 8, 6 ] ]);

		var options = {
			title : '나만의 차트',
			curveType : 'function',
			legend : {
				position : 'bottom'
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

				if (column == 1) {
					albumImg = '<img src="../image/a1.jpg" alt="">';
				} else if (column == 2) {
					albumImg = '<img src="../image/r3.png" alt="">';
				} else if (column == 3) {
					albumImg = '<img src="../image/a6.jpg" alt="">';
				} else if (column == 4) {
					albumImg = '<img src="../image/a8.jpg" alt="">';
				} else {
					albumImg = '<img src="../image/a9.png" alt="">';
				}

				if (column == 1) {
					aName = 'NewJeans';
				} else if (column == 2) {
					aName = 'Sam Smith';
				} else if (column == 3) {
					aName = 'Kessoku Band';
				} else if (column == 4) {
					aName = 'BTS';
				} else {
					aName = '나얼';
				}

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

<script>
	
</script>

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
						<div>
							<img id="a1" src="../albums/<%=albums.get(0).getALBUM_PHOTO() %>" alt="">
							<div class="album-name" id="t1">
								<p>
									<a href="musicAlbumInfo.mu?album_id=<%= albums.get(0).getALBUM_ID() %>"><%= albums.get(0).getALBUM_NAME() %></a>
								</p>
							</div>
						</div>
						<div>
							<img id="a2" src="../albums/<%=albums.get(1).getALBUM_PHOTO() %>" alt="">
							<div class="album-name" id="t2">
								<p>
									<a href="musicAlbumInfo.mu?album_id=<%= albums.get(1).getALBUM_ID() %>"><%= albums.get(1).getALBUM_NAME() %></a>
								</p>
							</div>
						</div>
						<div>
							<img id="a3" src="../albums/<%=albums.get(2).getALBUM_PHOTO() %>" alt="">
							<div class="album-name" id="t3">
								<p>
									<a href="musicAlbumInfo.mu?album_id=<%= albums.get(2).getALBUM_ID() %>"><%= albums.get(2).getALBUM_NAME() %></a>
								</p>
							</div>
						</div>
						<div>
							<img id="a4" src="../albums/<%=albums.get(3).getALBUM_PHOTO() %>" alt="">
							<div class="album-name" id="t4">
								<p>
									<a href="musicAlbumInfo.mu?album_id=<%= albums.get(3).getALBUM_ID() %>"><%= albums.get(3).getALBUM_NAME() %></a>
								</p>
							</div>
						</div>
						<div>
							<img id="a5" src="../albums/<%=albums.get(4).getALBUM_PHOTO() %>" alt="">
							<div class="album-name" id="t5">
								<p>
									<a href="musicAlbumInfo.mu?album_id=<%= albums.get(4).getALBUM_ID() %>"><%= albums.get(4).getALBUM_NAME() %></a>
								</p>
							</div>
						</div>
						<div>
							<img id="a6" src="../albums/<%=albums.get(5).getALBUM_PHOTO() %>" alt="">
							<div class="album-name" id="t6">
								<p>
									<a href="musicAlbumInfo.mu?album_id=<%= albums.get(5).getALBUM_ID() %>"><%= albums.get(5).getALBUM_NAME() %></a>
								</p>
							</div>
						</div>
						<div>
							<img id="a7" src="../albums/<%=albums.get(6).getALBUM_PHOTO() %>" alt="">
							<div class="album-name" id="t7">
								<p>
									<a href="musicAlbumInfo.mu?album_id=<%= albums.get(6).getALBUM_ID() %>"><%= albums.get(6).getALBUM_NAME() %></a>
								</p>
							</div>
						</div>
						<div>
							<img id="a8" src="../albums/<%=albums.get(7).getALBUM_PHOTO() %>" alt="">
							<div class="album-name" id="t8">
								<p>
									<a href="musicAlbumInfo.mu?album_id=<%= albums.get(7).getALBUM_ID() %>"><%= albums.get(7).getALBUM_NAME() %></a>
								</p>
							</div>
						</div>
					</div>
				</article>
				<article id="onlyMyChart">
					<div id="curve_chart" style="width: 590px; height: 525px"></div>
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
				</article>
			</div>
			<div id="bottomBox">
				<article id="curChart">
					<p>실시간 차트 Top 10</p>
					<br>
					<div id="charts">

						<table>
							<tr>
								<th>
									<p class="ranked" style="font-size: 19px; color: #b99400">1</p>
								</th>
								<th>
									<p class="rankup">+10</p>
								</th>
								<th>
									<div class="rankAl">
										<img src="../image/r1.png" alt="">
									</div>
									<p class="rankmName">Into The Night</p>
								</th>
								<th>
									<p class="aName">YOASOBI</p>
								</th>
								<th><img class="download" src="../image/download.png"
									alt=""></th>
							</tr>
							<tr>
								<th>
									<p class="ranked" style="font-size: 18px; color: #745c00">2</p>
								</th>
								<th>
									<p class="rankup">-1</p>
								</th>
								<th>
									<div class="rankAl">
										<img src="../image/r2.jpg" alt="">
									</div>
									<p class="rankmName">Stamp On It</p>
								</th>
								<th>
									<p class="aName">GOT the beat</p>
								</th>
								<th><img class="download" src="../image/download.png"
									alt=""></th>
							</tr>
							<tr>
								<th>
									<p class="ranked" style="font-size: 17px; color: #352a00">3</p>
								</th>
								<th>
									<p class="rankup">-</p>
								</th>
								<th>
									<div class="rankAl">
										<img src="../image/r3.png" alt="">
									</div>
									<p class="rankmName">Unholy</p>
								</th>
								<th>
									<p class="aName">Sam Smith</p>
								</th>
								<th><img class="download" src="../image/download.png"
									alt=""></th>
							</tr>
							<tr>
								<th>
									<p>4</p>
								</th>
								<th>
									<p class="rankup">-2</p>
								</th>
								<th>
									<div class="rankAl">
										<img src="../image/r4.jpg" alt="">
									</div>
									<p class="rankmName">Yeah!(feat. Lil Jon, Ludacris)</p>
								</th>
								<th>
									<p class="aName">Usher</p>
								</th>
								<th><img class="download" src="../image/download.png"
									alt=""></th>
							</tr>
							<tr>
								<th>
									<p>5</p>
								</th>
								<th>
									<p class="rankup">+5</p>
								</th>
								<th>
									<div class="rankAl">
										<img src="../image/r5.jpg" alt="">
									</div>
									<p class="rankmName">OMG</p>
								</th>
								<th>
									<p class="aName">NewJeans</p>
								</th>
								<th><img class="download" src="../image/download.png"
									alt=""></th>
							</tr>
							<tr>
								<th>
									<p>6</p>
								</th>
								<th>
									<p class="rankup">-3</p>
								</th>
								<th>
									<div class="rankAl">
										<img src="../image/r6.jpg" alt="">
									</div>
									<p class="rankmName">맞네</p>
								</th>
								<th>
									<p class="aName">LUCY</p>
								</th>
								<th><img class="download" src="../image/download.png"
									alt=""></th>
							</tr>
							<tr>
								<th>
									<p>7</p>
								</th>
								<th>
									<p class="rankup">+16</p>
								</th>
								<th>
									<div class="rankAl">
										<img src="../image/r7.jpg" alt="">
									</div>
									<p class="rankmName">Insomnia</p>
								</th>
								<th>
									<p class="aName">휘성</p>
								</th>
								<th><img class="download" src="../image/download.png"
									alt=""></th>
							</tr>
							<tr>
								<th>
									<p>8</p>
								</th>
								<th>
									<p class="rankup">-2</p>
								</th>
								<th>
									<div class="rankAl">
										<img src="../image/r8.jpg" alt="">
									</div>
									<p class="rankmName">With Me</p>
								</th>
								<th>
									<p class="aName">휘성</p>
								</th>
								<th><img class="download" src="../image/download.png"
									alt=""></th>
							</tr>
							<tr>
								<th>
									<p>9</p>
								</th>
								<th>
									<p class="rankup">+2</p>
								</th>
								<th>
									<div class="rankAl">
										<img src="../image/r9.jpg" alt="">
									</div>
									<p class="rankmName">KICK BACK</p>
								</th>
								<th>
									<p class="aName">Kenshi Yonezu</p>
								</th>
								<th><img class="download" src="../image/download.png"
									alt=""></th>
							</tr>
							<tr>
								<th>
									<p>10</p>
								</th>
								<th>
									<p class="rankup">+8</p>
								</th>
								<th>
									<div class="rankAl">
										<img src="../image/r10.jpg" alt="">
									</div>
									<p class="rankmName">seisyun complex</p>
								</th>
								<th>
									<p class="aName">kessoku band</p>
								</th>
								<th><img class="download" src="../image/download.png"
									alt=""></th>
							</tr>
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

</html>