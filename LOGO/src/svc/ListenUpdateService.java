package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.MusicDAO;

public class ListenUpdateService {

	public void listenUpdate(String m_name, String userID) {
		Connection conn = getConnection();

		// 싱글톤 패턴으로 DAO객체를 생성합니다.
		MusicDAO m = MusicDAO.getInstance();
		
		m.setConnection(conn);
		
		
		m.listenUpdate(m_name, userID);
		System.out.println(m_name + " and " + userID);
		
		commit(conn);
		close(conn);
	}
}
