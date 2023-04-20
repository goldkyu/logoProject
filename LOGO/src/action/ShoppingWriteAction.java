package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.ShoppingProductService;
import vo.ActionForward;
import vo.ShoppingProduct;

public class ShoppingWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		ShoppingProduct spVO = null;
		String realFolder = "";
		String saveFolder = "/file";
		int fileSize = 5 * 1024 * 1024;
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);

		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8",
				new DefaultFileRenamePolicy());

		spVO = new ShoppingProduct();
		spVO.setPd_number(multi.getParameter("Pd_number"));
		spVO.setPd_name(multi.getParameter("pd_name"));
		spVO.setPd_price(Integer.parseInt(multi.getParameter("pd_price")));
		spVO.setPd_amount(Integer.parseInt(multi.getParameter("pd_amount")));
		spVO.setPd_image(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
		spVO.setPd_detail(multi.getParameter("pd_detail"));
		spVO.setDiscount(Integer.parseInt(multi.getParameter("discount")));
		spVO.setCharge(multi.getParameter("charge"));

		ShoppingProductService SPV = new ShoppingProductService();
		boolean Success = SPV.writeProduct(spVO);

		if (!Success) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('fail')");
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("../pages/shoppingProductList.sh");
		}

		return forward;

	}
}
