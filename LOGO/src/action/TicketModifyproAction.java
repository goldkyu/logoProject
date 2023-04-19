package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.TicketListService;
import vo.ActionForward;
import vo.TicketInfo;

public class TicketModifyproAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		 ActionForward forward = null;
		 TicketInfo info = null;
		 boolean modifySuccess = false;
		 
		 String realFolder="";
		 String saveFolder="/file";
		 int fileSize=5*1024*1024;
	     ServletContext context = request.getServletContext();
		 realFolder=context.getRealPath(saveFolder);   		
		 MultipartRequest multi=new MultipartRequest(request,realFolder,fileSize,
			"UTF-8",
			new DefaultFileRenamePolicy());
			
		 String p_code = multi.getParameter("P_code");
		 
//		 System.out.println(p_code+"값");
		 
			 
		 info = new TicketInfo(); 
		 info.setP_code(multi.getParameter("p_code"));
		 info.setAr_name(multi.getParameter("ar_name"));
		 info.setP_title(multi.getParameter("p_title"));
		 info.setP_genre(multi.getParameter("p_genre"));
		 info.setRating(multi.getParameter("rating"));
		 info.setRunningtime(multi.getParameter("runningtime"));
		 info.setP_date(multi.getParameter("p_date"));
		 info.setP_price(multi.getParameter("p_price"));
		 info.setP_cast(multi.getParameter("p_cast"));
		 info.setP_image(
					multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		 info.setP_info(
					multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		
		 TicketListService ticketListService = new TicketListService();
		 modifySuccess = ticketListService.modifyArtcle(info);
		
					 
		 System.out.println(modifySuccess+"성공여부");
		 
			if(!modifySuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('fail')");
				out.println("history.back();");
				out.println("</script>");
			}
			else{
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("../pages/TicketDetail.to?P_code=" + info.getP_code());
			}
		 		 
		 return forward; 
		
	 }	
	 
}
