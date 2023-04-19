package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.TicketListService;
import vo.ActionForward;
import vo.TicketInfo;

public class TicketModifyAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 ActionForward forward = new ActionForward();
		 String p_code = request.getParameter("P_code");
		 String page = request.getParameter("page");
		 
			
		 TicketListService ticketListService = new TicketListService();
		 TicketInfo detailList = ticketListService.getdetailList(p_code);
		 request.setAttribute("DetailList", detailList);
		 request.setAttribute("page", page);
		 
		 forward.setPath("../pages/ticketRegistModify.jsp");	 
		 
		 return forward;
	 
	 }
}
