package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.TicketListService;
import vo.ActionForward;
import vo.TicketInfo;
import vo.TicketPageInfo;

public class TicketDetailAction implements Action {

	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		 
		 String p_code = request.getParameter("P_code");
		 String page = request.getParameter("Page");
	
		
		 TicketListService ticketListService = new TicketListService();
		 TicketInfo detailList = ticketListService.getdetailList(p_code);
		 
					 
		 ActionForward forward = new ActionForward();
		 request.setAttribute("Page", page);
		 request.setAttribute("DetailList", detailList);
		 	

		 forward.setPath("../pages/ticketRegistDetail.jsp");	 
		 
		 return forward; 

	 }
}