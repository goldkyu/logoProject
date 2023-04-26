package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.TicketListService;
import vo.ActionForward;
import vo.TicketInfo;

public class TicketIndexAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		TicketListService ticketListService = new TicketListService();
		ArrayList<TicketInfo> arr =ticketListService.tkindex();
		
		request.setAttribute("Arr", arr);
		ActionForward forward = new ActionForward();
		forward.setPath("../pages/ticketmain.jsp");
		
		return forward;
	}

}
