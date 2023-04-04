<%@ page language="java" contentType="text/html;charset =utf-8"
pageEncoding="utf-8" %> 
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
      rel="stylesheet"
    />
    <title>LOGO MUSIC</title>
    <link rel="stylesheet" href="../CSS/musicHead.css" />
    <link rel="stylesheet" href="../CSS/musicPlayer.css" />
  </head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="../js/musicHead.js"></script>

  <body>
    <% request.setCharacterEncoding("utf-8"); %>
    <header>
      <div id="mainHeader">
        <div id="leftNav">
          <ul>
            <li><a href="ticketmain.jsp">ticket</a></li>
            <li><a href="shoppingMain.html">shopping</a></li>
            <li><a href="musicMain.jsp">Music</a></li>
          </ul>
        </div>
        <div id="rightNav">
          <ul>
            <% if(session.getAttribute("userID") == null) { %>
            <li>
              <a href="login.jsp?from=<%= request.getRequestURL() %>">LogIn</a>
            </li>
            <li><a href="join.jsp">Join</a></li>
            <% } else { %>
            <li><a href="#"><%= session.getAttribute("userID") %> </a></li>
            <li><a href="logOut.jsp">LogOut</a></li>
            <% } %>
          </ul>
        </div>

        <form>
          <div id="logo"><a href="index.jsp">LOGO</a></div>
          <div class="search-bar">
            <input type="text" id="search" />
            <a href="#"><img id="find-btn" src="../image/find.png" alt="" /></a>
          </div>
        </form>
        <!-- 플레이어 -->
        <div class="audio-player">
          <audio
            src="../music/Ditto.mp3"
          ></audio>
          <div class="controls">
            <button class="player-button">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 20 20"
                fill="black"
              >
                <path
                  fill-rule="evenodd"
                  d="M10 18a8 8 0 100-16 8 8 0 000 16zM9.555 7.168A1 1 0 008 8v4a1 1 0 001.555.832l3-2a1 1 0 000-1.664l-3-2z"
                  clip-rule="evenodd"
                />
              </svg>
            </button>
            <input type="range" id="timeline" class="timeline" max="100" value="0" />
            <button class="sound-button">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 20 20"
                fill="black"
              >
                <path
                  fill-rule="evenodd"
                  d="M9.383 3.076A1 1 0 0110 4v12a1 1 0 01-1.707.707L4.586 13H2a1 1 0 01-1-1V8a1 1 0 011-1h2.586l3.707-3.707a1 1 0 011.09-.217zM14.657 2.929a1 1 0 011.414 0A9.972 9.972 0 0119 10a9.972 9.972 0 01-2.929 7.071 1 1 0 01-1.414-1.414A7.971 7.971 0 0017 10c0-2.21-.894-4.208-2.343-5.657a1 1 0 010-1.414zm-2.829 2.828a1 1 0 011.415 0A5.983 5.983 0 0115 10a5.984 5.984 0 01-1.757 4.243 1 1 0 01-1.415-1.415A3.984 3.984 0 0013 10a3.983 3.983 0 00-1.172-2.828 1 1 0 010-1.415z"
                  clip-rule="evenodd"
                />
              </svg>
            </button>
          </div>
        </div>
        <!-- 플레이어 -->
      </div>
      <nav>
        <ul>
          <li>실시간 차트</li>
          <li>최신 음악</li>
          <li>장르 음악</li>
          <li>나만의 차트</li>
          <li>이벤트</li>
        </ul>
      </nav>

      <div id="gnb">
        <div id="gnbBox">
          <ul>
            <li><a href="" class="my-text"> Top 100</a></li>
            <li><a href="" class="my-text"> 일간</a></li>
            <li><a href="" class="my-text"> 월간</a></li>
            <li><a href="" class="my-text"> 주간</a></li>
          </ul>
          <ul>
            <li><a href="" class="my-text"> 최신곡</a></li>
            <li><a href="" class="my-text"> 최신 앨범</a></li>
          </ul>
          <ul>
            <li><a href="" class="my-text"> 국내</a></li>
            <li><a href="" class="my-text"> 국외</a></li>
            <li><a href="" class="my-text"> 그 외</a></li>
          </ul>
          <ul>
            <li><a href="" class="my-text"> 나만의 차트</a></li>
            <li style="width: 120px">
              <a href="" class="my-text"> 플레이리스트</a>
            </li>
            <li><a href="" class="my-text"> 맞춤 추천</a></li>
          </ul>
          <ul>
            <li><a href="" class="my-text"> 이벤트 메인 </a></li>
            <li><a href="board.jsp" class="my-text"> 이벤트 참여</a></li>
          </ul>
        </div>
      </div>
    </header>
  </body>

  <script>
    const playerButton = document.querySelector(".player-button"),
      audio = document.querySelector("audio"),
      timeline = document.querySelector(".timeline"),
      soundButton = document.querySelector(".sound-button"),
      playIcon = `
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="black">
    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM9.555 7.168A1 1 0 008 8v4a1 1 0 001.555.832l3-2a1 1 0 000-1.664l-3-2z" clip-rule="evenodd" />
  </svg>
      `,
      pauseIcon = `
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="black">
  <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zM7 8a1 1 0 012 0v4a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v4a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd" />
</svg>
      `,
      soundIcon = `
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="black">
  <path fill-rule="evenodd" d="M9.383 3.076A1 1 0 0110 4v12a1 1 0 01-1.707.707L4.586 13H2a1 1 0 01-1-1V8a1 1 0 011-1h2.586l3.707-3.707a1 1 0 011.09-.217zM14.657 2.929a1 1 0 011.414 0A9.972 9.972 0 0119 10a9.972 9.972 0 01-2.929 7.071 1 1 0 01-1.414-1.414A7.971 7.971 0 0017 10c0-2.21-.894-4.208-2.343-5.657a1 1 0 010-1.414zm-2.829 2.828a1 1 0 011.415 0A5.983 5.983 0 0115 10a5.984 5.984 0 01-1.757 4.243 1 1 0 01-1.415-1.415A3.984 3.984 0 0013 10a3.983 3.983 0 00-1.172-2.828 1 1 0 010-1.415z" clip-rule="evenodd" />
</svg>`,
      muteIcon = `
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="black">
  <path fill-rule="evenodd" d="M9.383 3.076A1 1 0 0110 4v12a1 1 0 01-1.707.707L4.586 13H2a1 1 0 01-1-1V8a1 1 0 011-1h2.586l3.707-3.707a1 1 0 011.09-.217zM12.293 7.293a1 1 0 011.414 0L15 8.586l1.293-1.293a1 1 0 111.414 1.414L16.414 10l1.293 1.293a1 1 0 01-1.414 1.414L15 11.414l-1.293 1.293a1 1 0 01-1.414-1.414L13.586 10l-1.293-1.293a1 1 0 010-1.414z" clip-rule="evenodd" />
</svg>`;

    function toggleAudio() {
      if (audio.paused) {
        audio.play();
        playerButton.innerHTML = pauseIcon;
      } else {
        audio.pause();
        playerButton.innerHTML = playIcon;
      }
    }

    playerButton.addEventListener("click", toggleAudio);

    function changeTimelinePosition() {
      const percentagePosition = (100 * audio.currentTime) / audio.duration;
      timeline.style.backgroundSize = `${percentagePosition}% 100%`;
      timeline.value = percentagePosition;
    }

    audio.ontimeupdate = changeTimelinePosition;

    function audioEnded() {
      playerButton.innerHTML = playIcon;
    }

    audio.onended = audioEnded;

    function changeSeek() {
      const time = (timeline.value * audio.duration) / 100;
      audio.currentTime = time;
    }

    timeline.addEventListener("change", changeSeek);

    function toggleSound() {
      audio.muted = !audio.muted;
      soundButton.innerHTML = audio.muted ? muteIcon : soundIcon;
    }

    soundButton.addEventListener("click", toggleSound);
  </script>
</html>
