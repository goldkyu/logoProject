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
		
		String pd_number = request.getParameter("Pd_number");
		ShoppingProduct sp = null;
		ShoppingProductService shoppingS = new ShoppingProductService();
		ArrayList<ShoppingProduct> weekly = shoppingS.weeklyUpdate();
		ArrayList<ShoppingProduct> list= shoppingS.mainProduct();
		int updateCount = shoppingS.updateCount(pd_number);
		
		System.out.println(list.get(0).getPd_name());
		request.setAttribute("WEEKLY", weekly);
		request.setAttribute("LIST", list);
		request.setAttribute("updateCount", updateCount);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("../pages/shoppingMain.jsp");
		
		return forward;

		
		
	}

}
