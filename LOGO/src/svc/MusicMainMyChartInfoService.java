package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MusicDAO;
import vo.Music;

public class MusicMainMyChartInfoService {
	public ArrayList<Music> getChartMusicInfo(String userID) {
		ArrayList<Music> ml = null;
		// JdbcUtil 클래스의 getConnection 메소드로 DB연결
		Connection conn = getConnection();

		// 싱글톤 패턴으로 DAO객체를 생성합니다.
		MusicDAO m = MusicDAO.getInstance();

		// DAO객체의 setConnection으로 DB 연결 정보를 DAO로 전달합니다.
		m.setConnection(conn);
		
		ml = m.ChartMusicInfoSelect(userID);
		
		return ml;
	}

}