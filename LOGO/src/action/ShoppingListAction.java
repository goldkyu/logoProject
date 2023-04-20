package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ShoppingProductService;
import vo.ActionForward;
import vo.PageInfo;
import vo.ShoppingProduct;

public class ShoppingListAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ArrayList<ShoppingProduct> pageList = new ArrayList<ShoppingProduct>();
		int nowPage = 1;
		int limit = 10;

		if (request.getParameter("page") != null) {
			nowPage = Integer.parseInt(request.getParameter("page"));
		}

		ShoppingProductService SPV = new ShoppingProductService();
		int listCount = SPV.getListCount();
		pageList = SPV.getArticleList(nowPage);
		int maxPage = (int) ((double) listCount / limit + 0.95);
		int startPage = (((int) ((double) nowPage / 10 + 0.9)) - 1) * 10 + 1;
		int endPage = startPage + 10 - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setNowPage(nowPage);
		pageInfo.setStartPage(startPage);

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("List", pageList);
		ActionForward forward = new ActionForward();
		forward.setPath("../pages/shoppingProductList.jsp");
		return forward;

	}

}
