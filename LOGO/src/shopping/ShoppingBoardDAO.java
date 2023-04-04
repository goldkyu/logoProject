package shopping;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class ShoppingBoardDAO {
	Date nowDate = new Date();
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
	String strNowDate = simpleDateFormat.format(nowDate); 
	
	Connection conn = null;
	Statement st = null;

	public ShoppingBoardDAO() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
	}

	public void dbConnect() throws Exception {
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/melon_music", "root", "okek8277");
		if (conn == null) {
			throw new Exception("DataBase can't found.");

		}
	}

	public void dbDisConnect() throws Exception {
		st.close();
		conn.close();
	}

	public void reviewInsert(String u_id, String pd_title, String pd_comment) throws Exception {

		try {
			dbConnect();

			st = conn.createStatement();

			String s = "insert into pd_review(pd_id,pd_number,u_id,pd_title,pd_comment,grade,date,hits)values(NULL,'','"
					+ u_id + "','" + pd_title + "','" + pd_comment + "','', DATE_FORMAT(now(), '%Y-%m-%d'),NULL);";
			
			//update pd_review set hits = (SELECT hits FROM (SELECT hits from pd_review WHERE pd_id = '42') as HIT)+1  WHERE pd_id = '42';
			
			System.out.println(s);
			st.executeUpdate(s);
		} finally {
			dbDisConnect();
		}
	}

	public ArrayList<ShoppingBoardDTO> reviewSelect() throws Exception {

		ArrayList<ShoppingBoardDTO> arr = new ArrayList<ShoppingBoardDTO>();

		try {
			dbConnect();
			st = conn.createStatement();
			ResultSet rs = st.executeQuery("select * from pd_review;");
			while (rs.next()) {
				ShoppingBoardDTO rv = new ShoppingBoardDTO();
				rv.setPd_id(rs.getInt("pd_id"));
				rv.setPd_number(rs.getString("pd_number"));
				rv.setU_id(rs.getString("u_id"));
				rv.setPd_title(rs.getString("pd_title"));
				rv.setPd_comment(rs.getString("pd_comment"));
				rv.setGrade(rs.getString("grade"));
				rv.setDate(rs.getString("date"));
				rv.setHits(rs.getInt("hits"));
				arr.add(rv);
			}
		} finally {
			dbDisConnect();
		}
		return arr;
	}

//	삭제 메소드
	public void delete(String u_id) throws Exception {
		try {
			dbConnect();
			st = conn.createStatement();
			int rowNum = st.executeUpdate("delete from pd_review where u_id = '" + u_id + "';");
			if (rowNum < 1) {
				throw new Exception("failde");
			}
		} finally {
			dbDisConnect();
		}
	}
}