package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MusicPlayListCreateService;
import vo.ActionForward;
import vo.Music;

public class MusicPlayListView implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward actionForward = new ActionForward();
		
		int pl_id = Integer.parseInt(request.getParameter("pl_id"));
		MusicPlayListCreateService mpl = new MusicPlayListCreateService();
		ArrayList<Music> ml = mpl.musicPlayListService(pl_id);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("pl_ml", ml);
		
		actionForward.setPath("musicPlayList.jsp");
		
		return actionForward;
	}

}
