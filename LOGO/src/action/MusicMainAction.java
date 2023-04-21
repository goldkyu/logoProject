package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MusicMainMyChartInfoService;
import svc.MusicMainMyChartService;
import svc.MusicMainService;
import svc.MusicMainTopChartService;
import vo.ActionForward;

import vo.ActionForward;
import vo.Album;
import vo.Music;
import vo.UserListen;

// execute 인터페이스를 활용하기위해 Action 클래스를 임플리먼트합니다.
public class MusicMainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		// 액션 클래스들은 서비스클래스에서 DB를 통해 작업된 결과물을 setAttribute하고,
		// actionFoward 클래스를 통해 경로를 제어합니다.

		HttpSession session = request.getSession();
		ArrayList<Album> newAlbums = null;
		MusicMainService ma = new MusicMainService();
		newAlbums = ma.getAlbumList();
		ArrayList<UserListen> userListen = null;
		ArrayList<Music> topChart = null;
		MusicMainTopChartService mts = new MusicMainTopChartService();
		topChart = mts.getTopChart();

		if (session.getAttribute("userID") != null) {
			MusicMainMyChartService mcs = new MusicMainMyChartService();
			userListen = mcs.getChartInfo((String) session.getAttribute("userID"));
			if (userListen.size() > 0) {
				request.setAttribute("chartInfo", userListen);

				MusicMainMyChartInfoService mcis = new MusicMainMyChartInfoService();
				ArrayList<Music> userMusic = mcis.getChartMusicInfo((String) session.getAttribute("userID"));
				request.setAttribute("chartMusic", userMusic);
				request.setAttribute("viewChart", "1");
				System.out.println("차트데이터 존재");
			} else {
				request.setAttribute("viewChart", "0");
				System.out.println("차트데이터 미존재");
			}

		} else {
			request.setAttribute("viewChart", "0");
			System.out.println("로그인 안함");
		}

		ActionForward actionForward = new ActionForward();
		request.setAttribute("albums", newAlbums);
		request.setAttribute("topChart", topChart);

		actionForward.setPath("musicMain.jsp");
		return actionForward;
	}

}
