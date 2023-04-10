package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.*;
import vo.*;

@WebServlet("*.mu")
public class Controller extends javax.servlet.http.HttpServlet {
	protected void doProcess(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String reqURI = req.getRequestURI(); // 프로젝트 + 파일명까지 전체 URI ex)LOGO/pages/board.jsp
		String conPath = req.getContextPath(); // 프로젝트 이름 까지만 ex)LOGO
		String command = reqURI.substring(conPath.length()); // reqURI에서 프로젝트 이름까지만 자름
		ActionForward actionFoward = null;
		Action action = null;

		if (command.equals("/pages/musicMain.mu")) { // 입력받은 주소 요청이 musicMain.m이라면
			action = new MusicMainAction();

			try {
				actionFoward = action.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();

			}

		}

		if (actionFoward != null) {

			if (actionFoward.isRedirect()) {// isRedirect가 true일 때(정보 처리) sendRedirect로 이동
				res.sendRedirect(actionFoward.getPath());
			} else {// isRedirect가 false일 때(화면 이동) forward로 이동
				RequestDispatcher dispatcher = req.getRequestDispatcher(actionFoward.getPath());
				dispatcher.forward(req, res);
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
