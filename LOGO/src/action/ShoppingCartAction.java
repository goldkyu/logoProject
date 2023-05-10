package action;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ShoppingProductService;
import vo.ActionForward;
import vo.ShoppingCart;

public class ShoppingCartAction implements Action {

	private ActionForward forward;

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ShoppingCart scVO = null;
		String pd_number = request.getParameter("Pd_number");
		System.out.println(pd_number + " 값");

		ShoppingProductService SPV = new ShoppingProductService();
		ArrayList<ShoppingCart> cart = SPV.listCart(pd_number);
		System.out.println(pd_number + " 액션2");
		
		
		ActionForward forward = new ActionForward();
		request.setAttribute("cart", cart);
		forward.setPath("../pages/shoppingCartForm.jsp");
		return forward;

		
	}
}
		
		/*boolean Success = SPV.cartInsert(scVO);

		if (!Success) {
		System.out.println("fail");	
		} else {
			ActionForward forward = new ActionForward();
			request.setAttribute("cart", cart);
			forward.setRedirect(true);
			forward.setPath("../pages/shoppingCartForm.jsp");
		}
		return forward;
	}*/

