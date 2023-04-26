package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ShoppingProductService;
import vo.ActionForward;
import vo.ShoppingDetail;
import vo.ShoppingProduct;

public class ShoppingDetailAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String pd_number = request.getParameter("Pd_number");		
		String page = request.getParameter("nowPage");
		
		ShoppingProductService SPV = new ShoppingProductService();
		ShoppingProduct sp = SPV.getDetail(pd_number);
		ShoppingDetail sd = SPV.getImage(pd_number);

		ActionForward forward = new ActionForward();
		request.setAttribute("PAGE", page);
		request.setAttribute("SPVO", sp);
		request.setAttribute("SDVO", sd);
		forward.setPath("../pages/shoppingDetail.jsp");
		return forward;

	}

}