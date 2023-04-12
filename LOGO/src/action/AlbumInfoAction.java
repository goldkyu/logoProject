package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.AlbumInfoService;
import vo.ActionForward;
import vo.Album;
import vo.Music;

public class AlbumInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    int album_id = Integer.parseInt(request.getParameter("album_id"));
	    ArrayList<Music> musicList = null;
	    AlbumInfoService as = new AlbumInfoService();
	    musicList = as.getAlbumInfo(album_id);

	    // ActionForward 객체 생성
	    ActionForward forward = new ActionForward();

	    // JSP 페이지에 전달할 데이터 request 객체에 설정
	    request.setAttribute("musics", musicList);
	    

	    // JSP 페이지 경로 설정
	    forward.setPath("musicAlbumInfo.jsp");

	    // ActionForward 객체 반환
	    return forward;
	}
	
}
