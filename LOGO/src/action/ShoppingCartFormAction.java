package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ShoppingProductService;
import vo.ActionForward;
import vo.ShoppingCart;

public class ShoppingCartFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String pd_number = request.getParameter("Pd_number");	
		
		ShoppingProductService SPV = new ShoppingProductService();
		
		ShoppingCart scVO = SPV.getCart(pd_number);
		
		
		request.setAttribute("SCVO", scVO);
		ActionForward forward = new ActionForward();
		forward.setPath("../pages/shoppingCartForm.jsp");
		return forward;
	}

}
