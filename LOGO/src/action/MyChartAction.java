package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;

public class MyChartAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward actionForward = new ActionForward();
		
		actionForward.setPath("musicOnlyMyChart.jsp");
		
		return actionForward;
	}

}
