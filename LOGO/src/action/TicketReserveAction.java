package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.TicketListService;
import vo.ActionForward;
import vo.TicketInfo;

public class TicketReserveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String p_code = request.getParameter("P_code");
		
		/* System.out.println(p_code + "xx"); */
		
		TicketListService ticketListService = new TicketListService();
		TicketInfo reserv = ticketListService.getdetailList(p_code);
		
		
		 
		ActionForward forward = new ActionForward();
		
		request.setAttribute("Reserv", reserv);
		forward.setPath("../pages/ticketReserve.jsp");	 
		 
		 return forward; 

	}


}
