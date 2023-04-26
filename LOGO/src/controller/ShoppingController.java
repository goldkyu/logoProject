package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ShoppingCartFormAction;
import action.ShoppingDeleteAction;
import action.ShoppingDetailAction;
import action.ShoppingListAction;
import action.ShoppingMainAction;
import action.ShoppingModifyAction;
import action.ShoppingModifyFormAction;
import action.ShoppingWriteAction;
import vo.ActionForward;

@WebServlet("*.sh")
public class ShoppingController extends javax.servlet.http.HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

//쇼핑메인인덱스		
		if (command.equals("/pages/shoppingMain.sh")) {
			action = new ShoppingMainAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

//상품등록
		} else if (command.equals("/pages/shoppingProductWriteForm.sh")) {
			forward = new ActionForward();
			forward.setPath("../pages/shoppingProduct.jsp");

		} else if (command.equals("/pages/shoppingProductWrite.sh")) {
			action = new ShoppingWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
//상품 리스트			
		} else if (command.equals("/pages/shoppingProductList.sh")) {
			action = new ShoppingListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

// 상세페이지
		} else if (command.equals("/pages/shoppingDetail.sh")) {
			action = new ShoppingDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();

			}
		}
// 수정
		else if (command.equals("/pages/shoppingModifyForm.sh")) {
			action = new ShoppingModifyFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/pages/shoppingModify.sh")) {
			action = new ShoppingModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

// 삭제
		} else if (command.equals("/pages/shoppingDeleteForm.sh")) {
			String nowPage = request.getParameter("page");
			request.setAttribute("page", nowPage);
			String pd_number = request.getParameter("Pd_number");
			request.setAttribute("Pd_number", pd_number);
			forward = new ActionForward();
			forward.setPath("/pages/shoppingDelete.sh");
		} else if (command.equals("/pages/shoppingDelete.sh")) {
			action = new ShoppingDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
//장바구니			
		} else if (command.equals("/pages/shoppingCartForm.sh")) {

			action = new ShoppingCartFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		if (forward != null) {

			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}

		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
}
