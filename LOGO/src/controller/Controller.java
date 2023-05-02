package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.*;
import svc.ListenUpdateService;
import vo.*;

//music 관련 페이지 전용 서블릿

@WebServlet("*.mu")
public class Controller extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	protected void doProcess(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		String reqURI = req.getRequestURI(); // 프로젝트 + 파일명까지 전체 URI ex)LOGO/pages/board.mu
		String conPath = req.getContextPath(); // 프로젝트 이름 까지만 ex)LOGO
		String command = reqURI.substring(conPath.length()); // reqURI에서 프로젝트 이름까지만 자름 ex) pages/board.mu
		ActionForward actionFoward = null;
		Action action = null;

		if (command.equals("/pages/musicMain.mu")) { // 입력받은 주소 요청이 musicMain.m이라면
			action = new MusicMainAction(); // MusicMainAction 생성
			try {
				actionFoward = action.execute(req, res); // MusicMainAction 클래스의 execute 메소드를 실행합니다.
				// actionFoward == 실질적인 경로(jsp 페이지)
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();

			}

		} else if (command.equals("/pages/musicAlbumInfo.mu")) {
			action = new AlbumInfoAction();
			try {
				actionFoward = action.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} else if (command.equals("/pages/musicOnlyMyChart.mu")) {
			action = new MyChartAction();
			try {
				actionFoward = action.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} 
		else if (command.equals("/pages/musicListenUpdate.mu")) {
			String m_name = req.getParameter("songName");
			String userID = (String)session.getAttribute("userID");
			ListenUpdateService lus = new ListenUpdateService();
			lus.listenUpdate(m_name, userID);
		}

		if (actionFoward != null) { // 액션 포워드가 설정되었을 경우

			if (actionFoward.isRedirect()) {// isRedirect가 true일 때(정보 처리) sendRedirect로 이동
				res.sendRedirect(actionFoward.getPath());
			} else {// isRedirect가 false일 때(화면 이동) forward로 이동
				RequestDispatcher dispatcher = req.getRequestDispatcher(actionFoward.getPath());
				dispatcher.forward(req, res);
			}

		}
	}

	// get 과 post 요청을 모두 상단의 doProcess 메소드로 처리하기 위한 메소드
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
}
