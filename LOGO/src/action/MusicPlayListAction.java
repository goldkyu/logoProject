package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MusicPlayListCreateService;
import vo.ActionForward;
import vo.PlayList;

import javax.servlet.http.HttpSession;

public class MusicPlayListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward actionForward = new ActionForward();
		HttpSession session = request.getSession();
		MusicPlayListCreateService pls = new MusicPlayListCreateService();
		String userID = (String) session.getAttribute("userID");
		ArrayList<PlayList> pl = pls.musicPlayListSelectService(userID);
		session.setAttribute("pl", pl);
		actionForward.setPath("musicMyPlayList.jsp");
		return actionForward;
	}

}
