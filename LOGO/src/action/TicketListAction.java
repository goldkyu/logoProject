package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.TicketListService;
import vo.ActionForward;
import vo.TicketInfo;
import vo.TicketPageInfo;

public class TicketListAction implements Action{

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ArrayList<TicketInfo> articleList = new ArrayList<TicketInfo>();
		int nowPage=1;
		int limit=10;
		
		if(request.getParameter("page")!=null){
			nowPage=Integer.parseInt(request.getParameter("page"));
		}

		TicketListService ticketListService = new TicketListService();
		int listCount =ticketListService.getListCount();
		articleList = ticketListService.getArticleList(nowPage);
   	
		int maxPage=(int)((double)listCount/limit+0.95); 
   		int startPage = (((int) ((double)nowPage / 10 + 0.9)) - 1) * 10 + 1;
   	    int endPage = startPage+10-1;
   	    
   	   

   		if (endPage> maxPage) { 
   			endPage= maxPage;
   		}
   		
   		System.out.println(listCount + "listCount");
   		System.out.println(maxPage + "maxPage");
	    System.out.println(startPage +"startPage");
	    System.out.println(endPage + "endPage");
	    
   		TicketPageInfo pageInfo = new TicketPageInfo();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
   		pageInfo.setMaxPage(maxPage);
   		pageInfo.setNowPage(nowPage);
   		pageInfo.setStartPage(startPage);
   		
   		
		   		request.setAttribute("PageInfo", pageInfo);
				request.setAttribute("ArticleList", articleList);
				
				ActionForward forward= new ActionForward();
		   		forward.setPath("../pages/ticketRegistList.jsp");
   		return forward;
	}
}
