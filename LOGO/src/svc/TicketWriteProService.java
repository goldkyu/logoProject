package svc;

import java.sql.Connection;


import dao.TicketDAO;
import vo.TicketInfo;
import static db.JdbcUtil.*;

public class TicketWriteProService {

	public boolean registArticle(TicketInfo ticketinfo) throws Exception{
		
		boolean Success = false;
		Connection con = getConnection();
		TicketDAO ticketDAO = TicketDAO.getInstance();
		ticketDAO.setConnection(con);
		int insertCount = ticketDAO.insertInfo(ticketinfo);
		System.out.println(insertCount + " insertCount");
		if(insertCount > 0){
			commit(con);
			Success = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return Success;
		
	}

}
