package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MusicMainService;
import vo.ActionForward;
import vo.Album;

public class AlbumListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward actionForward = new ActionForward();
		
		MusicMainService mms = new MusicMainService();
		ArrayList<Album> albums = mms.getAlbumList();
		
		request.setAttribute("albums", albums);
		actionForward.setPath("musicAlbumList.jsp");
		return actionForward;
	}

}
