package action;

import javax.servlet.http.*;

import vo.ActionForward;

public interface Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
	// action 패키지에서 공용으로 사용하는 execute 메소드 인터페이스로 선언
}
