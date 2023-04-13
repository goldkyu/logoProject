package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MusicMainMyChartInfoService;
import svc.MusicMainMyChartService;
import svc.MusicMainService;
import vo.ActionForward;

import vo.ActionForward;
import vo.Album;
import vo.Music;
import vo.UserListen;

// execute 인터페이스를 활용하기위해 Action 클래스를 임플리먼트합니다.
public class MusicMainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		// 액션 클래스들은 서비스클래스에서 DB를 통해 작업된 결과물을 setAttribute하고,
		//  actionFoward 클래스를 통해 경로를 제어합니다.
		
		HttpSession session=request.getSession();
		ArrayList<Album> newAlbums = null;
		MusicMainService ma = new MusicMainService();
		newAlbums = ma.getAlbumList();
		
		if(session.getAttribute("userID") != null) {
		MusicMainMyChartService mcs = new MusicMainMyChartService();
		ArrayList<UserListen> userListen = mcs.getChartInfo((String)session.getAttribute("userID"));
		request.setAttribute("chartInfo", userListen);
		
		MusicMainMyChartInfoService mcis = new MusicMainMyChartInfoService();
		ArrayList<Music> userMusic = mcis.getChartMusicInfo((String)session.getAttribute("userID"));
		request.setAttribute("chartMusic", userMusic);
		}
		
		ActionForward actionForward = new ActionForward();
		request.setAttribute("albums", newAlbums);
		
		actionForward.setPath("musicMain.jsp");
		return actionForward;
	}

}
