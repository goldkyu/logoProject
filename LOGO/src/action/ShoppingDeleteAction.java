package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ShoppingProductService;
import vo.ActionForward;

public class ShoppingDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		String pd_number = request.getParameter("Pd_number");
		String nowPage = request.getParameter("page");
		ShoppingProductService SPV = new ShoppingProductService();

		boolean Success = SPV.removeProduct(pd_number);

		if (!Success) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('fail');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("/pages/shoppingProductList.sh?page=" + nowPage);
			forward = new ActionForward();
			forward.setPath("../pages/shoppingProductDelete.jsp");
		}

		return forward;
	}

}