package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.MusicPlayListCreateService;
import vo.ActionForward;
import vo.PlayList;

public class MusicPlayListCreateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward actionForward = new ActionForward();
		PlayList pl = null;
		HttpSession session = request.getSession();
		MusicPlayListCreateService plc = new MusicPlayListCreateService();
		String realFolder = "";
		String saveFolder = "/file";
		int fileSize = 10 * 1024 * 1024;
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8",
				new DefaultFileRenamePolicy());

		if (session.getAttribute("userID") == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 해 주세요');");
			out.println("history.back();");
			out.println("</script>");
		} else {

			pl = new PlayList();
			pl.setPl_name(multi.getParameter("pl_name"));
			pl.setU_id((String) session.getAttribute("userID"));
			pl.setPl_prof_photo(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
			pl.setPl_prof_message(multi.getParameter("pl_description"));
			pl.setPl_hash(multi.getParameter("pl_hashtags"));
			int result = plc.musicPlayListCreateService(pl);
			System.out.println("플리 추가 성공 여부 " + result);

		}

		actionForward.setPath("/pages/musicPlayList.mu");
		return actionForward;
	}

}
