package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ShoppingProductService;
import vo.ActionForward;
import vo.ShoppingProduct;

public class ShoppingModifyFormAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		String pd_number = request.getParameter("Pd_number");
		ShoppingProductService SPV = new ShoppingProductService();
		ShoppingProduct sp = SPV.getDetail(pd_number);
		request.setAttribute("SPVO", sp);
		forward.setPath("../pages/shoppingModifyForm.jsp");
		return forward;

	}

}