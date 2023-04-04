package ticketSystem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class TkBoardDAO {
	Date nowDate = new Date();
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
	String strNowDate = simpleDateFormat.format(nowDate);

	Connection conn = null;
	Statement st = null;

	public TkBoardDAO() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
	}

	public void dbCon() throws Exception {
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/melon_music?useSSL=false", "root", "okek8277");
		if (conn == null) {
			throw new Exception("DataBase can't found.");

		}

	}

	public void dbClose() throws Exception {
		st.close();
		conn.close();
	}

	public void boardInsert(String u_id, String pfm_title, String pfm_comment) throws Exception {
		try {
			dbCon();

			st = conn.createStatement();

			String sql = "insert into pfm_review(pfm_id,p_code,u_id,pfm_title,pfm_comment,date,hits)values(NULL,'','"
					+ u_id + "','" + pfm_title + "','" + pfm_comment + "',DATE_FORMAT(now(), '%Y-%m-%d'),NULL);";

			st.executeUpdate(sql);
		} finally {
			dbClose();
		}
	}

	public ArrayList<TkBoardDTO> writeSelect() throws Exception {

		ArrayList<TkBoardDTO> arr = new ArrayList<TkBoardDTO>();

		try {
			dbCon();
			st = conn.createStatement();
			ResultSet rs = st.executeQuery("select * from pfm_review;");
			while (rs.next()) {
				TkBoardDTO bod = new TkBoardDTO();
				bod.setPfm_id(rs.getInt("pfm_id"));
				bod.setP_code(rs.getString("p_code"));
				bod.setU_id(rs.getString("u_id"));
				bod.setPfm_title(rs.getString("pfm_title"));
				bod.setPfm_comment(rs.getString("pfm_comment"));
				bod.setDate(rs.getString("date"));
				bod.setHits(rs.getInt("hits"));
				arr.add(bod);
			}
		} finally {
			dbClose();
		}
		return arr;
	}

	public void tkdelete(String u_id) throws Exception {
		try {
			dbCon();
			st = conn.createStatement();
			int rowNum = st.executeUpdate("delete from pfm_review where u_id = '" + u_id + "';");
			if (rowNum < 1) {
				throw new Exception("failde");
			}
		} finally {
			dbClose();
		}
	}
}
