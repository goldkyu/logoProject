package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.m")
public class Controller {
	protected void doProcess(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String reqURI = req.getRequestURI(); // 프로젝트 + 파일명까지 전체 URI ex)LOGO/pages/board.jsp
		String conPath = req.getContextPath(); // 프로젝트 이름 까지만 ex)LOGO
		String command = reqURI.substring(conPath.length()); // reqURI에서 프로젝트 이름까지만 자름
		
	}
}
