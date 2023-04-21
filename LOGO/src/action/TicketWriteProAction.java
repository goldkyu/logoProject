package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.TicketWriteProService;
import vo.ActionForward;
import vo.TicketInfo;

public class TicketWriteProAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int ar_name = 0;
		ActionForward forward = null;
		TicketInfo ticketinfo = null;
		String realFolder = "";
		String saveFolder = "/file";
		int fileSize = 5 * 1024 * 1024;
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8",
				new DefaultFileRenamePolicy());

		ticketinfo = new TicketInfo();
		ticketinfo.setP_code(multi.getParameter("p_code"));
		ticketinfo.setAr_name(multi.getParameter("ar_name"));
		ticketinfo.setP_title(multi.getParameter("p_title"));
		ticketinfo.setP_genre(multi.getParameter("p_genre"));
		ticketinfo.setRating(multi.getParameter("rating"));
		ticketinfo.setRunningtime(multi.getParameter("runningtime"));
		ticketinfo.setP_date(multi.getParameter("p_date"));
		ticketinfo.setP_price(multi.getParameter("p_price"));
		ticketinfo.setP_cast(multi.getParameter("p_cast"));
		ticketinfo.setP_image(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
		ticketinfo.setP_info(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));

		TicketWriteProService twpService = new TicketWriteProService();
		boolean Success = twpService.registArticle(ticketinfo);
		System.out.println(Success + "성공");

		if (!Success) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('fail')");
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("../pages/TicketList.to");
		}

		return forward;

	}

}