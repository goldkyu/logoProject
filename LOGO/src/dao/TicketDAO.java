package dao;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.sql.DataSource;

import com.mysql.jdbc.Statement;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

import vo.TicketArena;
import vo.TicketInfo;

public class TicketDAO {
	Statement st = null;
	DataSource ds;
	Connection con;
	private static TicketDAO ticketDAO;

	private TicketDAO() {
	}

	public static TicketDAO getInstance() {
		if (ticketDAO == null) {
			ticketDAO = new TicketDAO();
		}
		return ticketDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}



	// 인서트
	public int insertInfo(TicketInfo info) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		String sql = "";
		int insertCount = 0;

		try {
			pstmt = con.prepareStatement("select max(p_code) from performance;");
			rs = pstmt.executeQuery();
			if (rs.next())
				num = rs.getInt(1) + 1;

			else
				num = 1;
//
			sql = "insert into performance(p_code,ar_name,p_title,p_genre,rating,runningtime,p_date,p_image,p_info,p_price,p_cast)values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, info.getP_code());
			pstmt.setString(2, info.getAr_name());
			pstmt.setString(3, info.getP_title());
			pstmt.setString(4, info.getP_genre());
			pstmt.setString(5, info.getRating());
			pstmt.setString(6, info.getRunningtime());
			pstmt.setString(7, info.getP_date());
			pstmt.setString(8, info.getP_image());
			pstmt.setString(9, info.getP_info());
			pstmt.setString(10, info.getP_price());
			pstmt.setString(11, info.getP_cast());

			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
		} finally {
			close(rs);
			close(pstmt);
		}
		return insertCount;

	}

//페이징
	public int selectListCount() throws Exception {

		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement("select count(*)from performance");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} finally {
			close(rs);
			close(pstmt);
		}

		return listCount;
	}

	
	public ArrayList<TicketInfo> selectArticleList(int page) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String listsql = "select * from performance order by p_code desc limit ?,12";
		ArrayList<TicketInfo> articleList = new ArrayList<TicketInfo>();
		TicketInfo info = null;
		int startrow = (page - 1) * 10;

		try {
			pstmt = con.prepareStatement(listsql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				info = new TicketInfo();
				info.setP_code(rs.getString("p_code"));
				info.setAr_name(rs.getString("ar_name"));
				info.setP_title(rs.getString("p_title"));
				info.setP_genre(rs.getString("p_genre"));
				info.setRating(rs.getString("rating"));
				info.setRunningtime(rs.getString("runningtime"));
				info.setP_date(rs.getString("p_date"));
				info.setP_price(rs.getString("p_price"));
				info.setP_cast(rs.getString("p_cast"));
				info.setP_image(rs.getString("p_image"));
				info.setP_info(rs.getString("p_info"));

				articleList.add(info);
			}
		} catch (Exception ex) {
		} finally {
			close(rs);
			close(pstmt);
		}
		return articleList;

	}

	// 상세보기
	public TicketInfo detailList(String p_code) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TicketInfo info = null;
		
		try {
			
			pstmt = con.prepareStatement("select * from performance where p_code = ?"); 
			pstmt.setString(1, p_code);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				info = new TicketInfo();
				info.setP_code(rs.getString("p_code"));
				info.setAr_name(rs.getString("ar_name"));
				info.setP_title(rs.getString("p_title"));
				info.setP_genre(rs.getString("p_genre"));
				info.setRating(rs.getString("rating"));
				info.setRunningtime(rs.getString("runningtime"));
				info.setP_date(rs.getString("p_date"));
				info.setP_price(rs.getString("p_price"));
				info.setP_cast(rs.getString("p_cast"));
				info.setP_image(rs.getString("p_image"));
				info.setP_info(rs.getString("p_info"));
				}
			
			}catch(Exception ex) {
			}finally {
				close(rs);
				close(pstmt);
			}
		return info;
	}
	

	//수정
	public int updateModify(TicketInfo info) {
		
		int updateCount = 0;
		PreparedStatement pstmt = null;
				
		try {
			String sql = "update performance set ar_name=?,p_title=?,p_genre=?,rating=?,runningtime=?,p_date=?,p_price=?,p_cast=?,p_image=?,p_info=? where p_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, info.getAr_name());
			pstmt.setString(2, info.getP_title());
			pstmt.setString(3, info.getP_genre());
			pstmt.setString(4, info.getRating());
			pstmt.setString(5, info.getRunningtime());
			pstmt.setString(6, info.getP_date());
			pstmt.setString(7, info.getP_price());
			pstmt.setString(8, info.getP_cast());
			pstmt.setString(9, info.getP_image());
			pstmt.setString(10, info.getP_info());
			pstmt.setString(11, info.getP_code());
			
			updateCount = pstmt.executeUpdate();
		
			
		}catch(Exception ex) {			
			
			System.out.println(updateCount +"aaaaaaaaa");
		}finally {
			close(pstmt);
		}		
		return updateCount;
	}
	
	//삭제
	public int deleteArticle(String p_code){

		PreparedStatement pstmt = null;
		String sql="delete from performance where p_code=?";
		int deleteCount=0;

		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, p_code);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
		}	finally{
			close(pstmt);
		}

		return deleteCount;

	}
	
	//티켓인덱스
	public ArrayList<TicketInfo> tkindex() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from performance order by p_code asc limit 17";
		ArrayList<TicketInfo> arr = new ArrayList<TicketInfo>();
		
		try {
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
			TicketInfo info = new TicketInfo();
			info.setP_code(rs.getString("p_code"));
			info.setAr_name(rs.getString("ar_name"));
			info.setP_title(rs.getString("p_title"));
			info.setP_genre(rs.getString("p_genre"));
			info.setRating(rs.getString("rating"));
			info.setRunningtime(rs.getString("runningtime"));
			info.setP_date(rs.getString("p_date"));
			info.setP_price(rs.getString("p_price"));
			info.setP_cast(rs.getString("p_cast"));
			info.setP_image(rs.getString("p_image"));
			info.setP_info(rs.getString("p_info"));
			
			arr.add(info);
			
			}
		}catch (Exception e) {
			
		}
		return arr;
	}
	
	
	//공연장정보
	public TicketArena arenainfo(String ar_name) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TicketArena arena = null;
		
		try {
			
			pstmt = con.prepareStatement("SELECT *from arena where ar_name = ?");
			pstmt.setString(1, ar_name);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				arena = new TicketArena();
				
				arena.setAr_name(rs.getString("ar_name"));
				arena.setAr_address(rs.getString("ar_address"));
				arena.setAr_phone(rs.getString("ar_phone"));
				arena.setAr_image(rs.getString("ar_image"));
				}
			
			}catch(Exception ex) {
			}finally {
				close(rs);
				close(pstmt);
			}
		return arena;
	}
}
