package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ShoppingProductService;
import vo.ActionForward;
import vo.ShoppingProduct;

public class ShoppingModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		boolean Success = false;
		String pd_number = request.getParameter("Pd_number");

		ShoppingProduct sp = new ShoppingProduct();
		ShoppingProductService SPV = new ShoppingProductService();

		sp.setPd_number(pd_number);
		sp.setPd_name(request.getParameter("pd_name"));
		sp.setPd_price(Integer.parseInt(request.getParameter("pd_price")));
		sp.setPd_amount(Integer.parseInt(request.getParameter("pd_amount")));
		sp.setPd_image(request.getParameter("pd_image"));
		sp.setPd_detail(request.getParameter("pd_detail"));
		sp.setDiscount(Integer.parseInt(request.getParameter("discount")));
		sp.setCharge(request.getParameter("charge"));
		Success = SPV.getModify(sp);

		if (!Success) { 
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('fail');");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("shoppingDetail.sh?Pd_number=" + sp.getPd_number());
		}

		return forward;
	}

}