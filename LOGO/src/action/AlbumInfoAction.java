package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.AlbumInfoService;
import svc.MusicPlayListCreateService;
import vo.ActionForward;
import vo.Album;
import vo.Music;
import vo.PlayList;

public class AlbumInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    int album_id = Integer.parseInt(request.getParameter("album_id"));
	    HttpSession session = request.getSession();
	    ArrayList<Music> musicList = null;
	    AlbumInfoService as = new AlbumInfoService();
	    MusicPlayListCreateService mpc = new MusicPlayListCreateService();
	    ArrayList<PlayList> pl = mpc.musicPlayListSelectService((String) session.getAttribute("userID"));
	    musicList = as.getAlbumInfo(album_id);

	    // ActionForward 객체 생성
	    ActionForward forward = new ActionForward();

	    // JSP 페이지에 전달할 데이터 request 객체에 설정
	    request.setAttribute("musics", musicList);
	    request.setAttribute("pls", pl);
	    

	    // JSP 페이지 경로 설정
	    forward.setPath("musicAlbumInfo.jsp");

	    // ActionForward 객체 반환
	    return forward;
	}
	
}
