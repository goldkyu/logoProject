package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MusicMainMyChartInfoService;
import svc.MusicMainService;
import svc.MusicMainTopChartService;
import svc.MusicPlayListCreateService;
import vo.ActionForward;

import vo.Album;
import vo.Music;
import vo.PlayList;
import vo.UserListen;

// execute 인터페이스를 활용하기위해 Action 클래스를 임플리먼트합니다.
public class MusicMainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		// 액션 클래스들은 서비스클래스에서 DB를 통해 작업된 결과물을 setAttribute하고,
		// actionFoward 클래스를 통해 경로를 제어합니다.

		HttpSession session = request.getSession();
		
		// 유저 공용 영역
		
		// 유저 전체 공용 데이터 DTO
		ArrayList<Album> newAlbums = null; // 신규 출시 앨범 목록
		ArrayList<Music> topChart = null; // 실시간차트 TOP 100

		// 유저 전체 공용 서비스
		MusicMainService ma = new MusicMainService();
		MusicMainTopChartService mts = new MusicMainTopChartService();
		
		newAlbums = ma.getAlbumList(); // 신규 출시 앨범 목록 서비스
		topChart = mts.getTopChart(); // TOP 100 음악 정보 서비스
		
		request.setAttribute("albums", newAlbums);
		request.setAttribute("topChart", topChart);

		
		// 유저 개인 데이터
		ArrayList<UserListen> userListen = null; // 유저 그래프 데이터 (음악 청취 수)
		ArrayList<Music> userMusic = null; // 유저 그래프 음악 데이터
		ArrayList<PlayList> pl = null; // 유저 플레이리스트

		// 유저 개인 서비스
		MusicPlayListCreateService mpc = null; // 로그인 유저 플레이리스트 정보
		MusicMainMyChartInfoService mcis = null; // 로그인 유저 그래프 정보

		// 유저가 로그인중 일때
		if (session.getAttribute("userID") != null) {

			mcis = new MusicMainMyChartInfoService();
			userListen = mcis.getChartInfo((String) session.getAttribute("userID")); // 유저 그래프 정보
			pl = mpc.musicPlayListSelectService((String) session.getAttribute("userID")); // 유저 플레이리스트

			// 유저가 그래프정보를 가지고 있을때
			if (userListen.size() > 0) {

				mpc = new MusicPlayListCreateService(); // 유저 플레이리스트 정보 서비스

				userMusic = mcis.getChartMusicInfo((String) session.getAttribute("userID")); // 유저 그래프 음악

				request.setAttribute("chartInfo", userListen);
				request.setAttribute("chartMusic", userMusic);
				request.setAttribute("pl", pl);

				request.setAttribute("viewChart", 1);
				System.out.println("차트데이터 존재");
			} else {
				
				request.setAttribute("pl", pl);
				request.setAttribute("viewChart", 0);
				System.out.println("차트데이터 미존재");
			}

		} else {
			request.setAttribute("viewChart", 0);
			System.out.println("로그인 안함");
		}

		

		ActionForward actionForward = new ActionForward();
		actionForward.setPath("../pages/musicMain.jsp");
		return actionForward;
	}

}
