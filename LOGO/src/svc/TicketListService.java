package svc;

import java.sql.Connection;
import java.util.ArrayList;


import dao.TicketDAO;
import vo.TicketArena;
import vo.TicketInfo;

import static db.JdbcUtil.*;

public class TicketListService {
	
	public int getListCount() throws Exception {
		
		int listCount =0;
		Connection con = getConnection();
		TicketDAO tk = TicketDAO.getInstance();
		tk.setConnection(con);
		listCount = tk.selectListCount();
		close(con);	
		return listCount;
		
	}

	public ArrayList<TicketInfo> getArticleList(int page) throws Exception{
		
		ArrayList<TicketInfo> articleList = null;
		Connection con = getConnection();
		TicketDAO tk = TicketDAO.getInstance();
		tk.setConnection(con);
		articleList = tk.selectArticleList(page);
		close(con);
		return articleList;
	}
	
	//상세페이지
	public TicketInfo getdetailList(String p_code) throws Exception{
		
		TicketInfo detailList = null;
		Connection con = getConnection();
		TicketDAO tk = TicketDAO.getInstance();
		tk.setConnection(con);
		detailList = tk.detailList(p_code);
		close(con);
		return detailList;
		
	}

	
	//수정
	public boolean modifyArtcle(TicketInfo info) throws Exception{
		
		boolean modifySuccess = false;
		Connection con = getConnection();
		TicketDAO tk = TicketDAO.getInstance();
		tk.setConnection(con);
		int updateCount = tk.updateModify(info);
		
		System.out.println(updateCount+"0");
		
		if(updateCount>0) {
			commit(con);
			modifySuccess=true;
		}
		else {
			rollback(con);
		}
		close(con);
		return modifySuccess;
		
	}
	//삭제 
	public boolean removeArticle(String p_code) throws Exception{
		
		boolean isRemoveSuccess = false;
		Connection con = getConnection();
		TicketDAO tk = TicketDAO.getInstance();
		tk.setConnection(con);
		int deleteCount = tk.deleteArticle(p_code);
		
		if(deleteCount > 0){
			commit(con);
			isRemoveSuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isRemoveSuccess;
	}
	
	//인덱스DB
	public ArrayList<TicketInfo> tkindex() {
		Connection con = getConnection();
		TicketDAO tk = TicketDAO.getInstance();
		tk.setConnection(con);
		ArrayList<TicketInfo> arr = tk.tkindex();
		
		return arr;
	}
	
	//공연장정보
	public TicketArena arenainfo (String ar_name) throws Exception{
		
		TicketArena arena =null;
		Connection con = getConnection();
		TicketDAO tk = TicketDAO.getInstance();
		tk.setConnection(con);
		arena = tk.arenainfo(ar_name);
		close(con);
				
		return arena;
				
	} 
	//
	
}



