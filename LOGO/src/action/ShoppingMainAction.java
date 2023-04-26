package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ShoppingDAO;
import svc.ShoppingProductService;
import vo.ActionForward;
import vo.ShoppingProduct;

public class ShoppingMainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ShoppingProduct sp = null;
		ShoppingProductService shoppingS = new ShoppingProductService();
		ArrayList<ShoppingProduct> list= shoppingS.mainProduct();
		
		System.out.println(list.get(0).getPd_name());
		request.setAttribute("LIST", list);
		ActionForward forward = new ActionForward();
		forward.setPath("../pages/shoppingMain.jsp");
		
		return forward;

		
		
	}

}
