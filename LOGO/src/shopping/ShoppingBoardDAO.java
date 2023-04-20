package shopping;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class ShoppingBoardDAO {

	Connection conn = null;
	Statement st = null;

	public ShoppingBoardDAO() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
	}

	public void dbConnect() throws Exception {
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/melon_music", "root", "1234");
		if (conn == null) {
			throw new Exception("DataBase can't found.");

		}
	}

	public void dbDisConnect() throws Exception {
		st.close();
		conn.close();
	}

	public void reviewInsert(String u_id, String pd_title, String pd_comment, String pd_image) throws Exception {

		try {
			dbConnect();

			st = conn.createStatement();

			String s = "insert into pd_review(pd_id,pd_number,u_id,pd_title,pd_comment,grade,date,hits,pd_reply,pd_image)values(NULL,'','"
					+ u_id + "','" + pd_title + "','" + pd_comment + "','', DATE_FORMAT(now(), '%Y-%m-%d'),'0','','"
					+ pd_image + "');";

			// update pd_review set hits = (SELECT hits FROM (SELECT hits from pd_review
			// WHERE pd_id = '42') as HIT)+1 WHERE pd_id = '42';

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
				rv.setPd_reply(rs.getString("pd_reply"));
				rv.setPd_image(rs.getString("pd_image"));
				rv.setHits(rs.getInt("hits"));
				
				/*
				 * int hits = rs.getInt("hits"); rv.setHits(hits); hits++; countUpdate(pd_id);
				 */
				 
				arr.add(rv);
			}
		} finally {
			dbDisConnect();
		}
		return arr;
	}

	public void countUpdate(String pd_id) throws Exception {

		try {
			dbConnect();

			st = conn.createStatement();

			String s = "update pd_review set hits = hits +1 where pd_id = '+ pd_id +' ";

			System.out.println(s);
			st.executeUpdate(s);

		} finally {
			dbDisConnect();
		}

	}

//	삭제 메소드
	public void delete(String pd_id) throws Exception {
		try {
			dbConnect();
			st = conn.createStatement();
			int rowNum = st.executeUpdate("delete from pd_review where pd_id = " + pd_id + ";");

			if (rowNum < 1) {
				throw new Exception("failde");
			}
		} finally {
			dbDisConnect();
		}
	}
}