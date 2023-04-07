package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;
import vo.Music;

public class MusicDAO {
	DataSource ds;
	Connection conn;
	private static MusicDAO musicDAO;
	
	private MusicDAO() {
	}
	
	// 싱글톤 패턴
	public static MusicDAO getInstance() {
		if(musicDAO == null){
			musicDAO = new MusicDAO();
		}
		return musicDAO;
	}
	
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
}
