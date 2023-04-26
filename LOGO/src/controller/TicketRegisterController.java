package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.TicketDeleteAction;
import action.TicketDetailAction;
import action.TicketIndexAction;
import action.TicketListAction;
import action.TicketModifyAction;
import action.TicketModifyproAction;
import action.TicketWriteProAction;
import vo.ActionForward;

//티켓 서블릿
@WebServlet("*.to")
public class TicketRegisterController extends javax.servlet.http.HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		System.out.println(RequestURI);
		System.out.println(contextPath);
		System.out.println(command);
		
		if(command.equals("/pages/ticketindex.to")){
			action = new TicketIndexAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/pages/TicketWriteForm.to")) {
			forward = new ActionForward();
			forward.setPath("../pages/ticketRegister.jsp");
		} else if (command.equals("/pages/TicketWritePro.to")) { // 액션으로
			action = new TicketWriteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/pages/TicketList.to")) {
			action = new TicketListAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		//상세정보
		else if(command.equals("/pages/TicketDetail.to")) {
			action = new TicketDetailAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		//수정
		else if(command.equals("/pages/TicketModify.to")) {
			action = new TicketModifyAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/pages/TicketModifypro.to")) {
			action = new TicketModifyproAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		//ticketRegistModity.jsp(삭제)
		else if(command.equals("/pages/TicketDelete.to")) {
			String nowPage = request.getParameter("nowPage");
			request.setAttribute("page", nowPage);
			String p_code = request.getParameter("P_code");		
			request.setAttribute("P_code",p_code);
			System.out.println(nowPage + "11111");
			System.out.println(p_code + "2222222");
			
			 forward=new ActionForward();
			 forward.setPath("/pages/boardDeletePro.to");
		}
		
		else if(command.equals("/pages/boardDeletePro.to")){
			action = new TicketDeleteAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
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
//