package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MusicPlayListCreateService;
import vo.ActionForward;

public class MusicPlayListCreateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward actionForward= new ActionForward();
		HttpSession session = request.getSession();
		MusicPlayListCreateService plc = new MusicPlayListCreateService();
		
		if(session.getAttribute("userID")== null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 해 주세요');");
			out.println("history.back();");
			out.println("</script>");
		}
		else {
			String pl_name = request.getParameter("pl_name");
			String userID = (String)session.getAttribute("userID");
			System.out.println(pl_name + " , " + userID);
			int result = plc.musicPlayListCreateService(pl_name, userID);
			System.out.println("성공여부" + result);
			
		}
		
		actionForward.setPath("musicMyPlayList.jsp");
		return actionForward;
	}

}
