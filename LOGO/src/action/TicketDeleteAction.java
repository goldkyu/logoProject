package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.TicketListService;
import vo.ActionForward;

public class TicketDeleteAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{	 

		ActionForward forward = null;
		 String p_code = request.getParameter("P_code");
		String nowPage = request.getParameter("page");
		 TicketListService ticketListService = new TicketListService();
		
		 boolean isDeleteSuccess = ticketListService.removeArticle(p_code);

			if(!isDeleteSuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('fail');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
			else{
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("../pages/ticketRegistList.jsp?page=" + nowPage);
				 forward=new ActionForward();
				 forward.setPath("../pages/ticketRegistDelete.jsp");
			}
			
		return forward;
	}

}