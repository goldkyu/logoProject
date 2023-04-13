package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;

import vo.Album;
import vo.Music;
import vo.UserListen;

public class MusicDAO {
	DataSource ds;
	Connection conn;
	private static MusicDAO musicDAO;

	private MusicDAO() {
	}

	// 싱글톤 패턴
	public static MusicDAO getInstance() {
		if (musicDAO == null) {
			musicDAO = new MusicDAO();
		}
		return musicDAO;
	}

	public void setConnection(Connection conn) {
		this.conn = conn;
	}

	public ArrayList<Album> albumListSelect() {
		ArrayList<Album> albumList = new ArrayList<Album>();
		PreparedStatement prst = null;
		ResultSet rs = null;
		try {
			prst = conn.prepareStatement("select * from album_information order by album_date desc;");
			rs = prst.executeQuery();
			while (rs.next()) {
				Album a = new Album();
				a.setALBUM_ID(rs.getInt(1));
				a.setALBUM_NAME(rs.getString(2));
				a.setALBUM_PUBLISHER(rs.getString(3));
				a.setALBUM_DATE(rs.getString(4));
				a.setARTIST_ID(rs.getInt(5));
				a.setALBUM_PHOTO(rs.getString(6));
				albumList.add(a);
			}

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close(prst);
			close(rs);
		}

		return albumList;
	}

	public ArrayList<Music> albumInfoSelect(int album_idx) {
		ArrayList<Music> musicListFromAlbum = new ArrayList<Music>();
		PreparedStatement prst = null;
		ResultSet rs = null;
		String selectQuery = "select distinct m_id,m_track_num,m_name,m_playtime,m_lyrics,album_date,album_prof_photo from m_information,album_information where m_information.album_id = album_information.album_id and m_information.album_id= ? order by m_track_num asc;";
		try {
			prst = conn.prepareStatement(selectQuery);
			prst.setInt(1, album_idx);
			rs = prst.executeQuery();
			while (rs.next()) {
				Music m = new Music();
				m.setMUSIC_ID(rs.getInt(1));
				m.setMUSIC_TRACK_NUM(rs.getInt(2));
				m.setMUSIC_NAME(rs.getString(3));
				m.setMUSIC_PLAYTIME(rs.getString(4));
				m.setMUSIC_LYRICS(rs.getString(5));
				m.setMUSIC_DATE(rs.getString(6));
				m.setALBUM_PHOTO(rs.getString(7));
				musicListFromAlbum.add(m);

			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			// TODO: handle finally clause
			close(prst);
			close(rs);
		}

		return musicListFromAlbum;
	}

	public ArrayList<UserListen> userListenInfoSelect(String userID) {
		ArrayList<UserListen> listenInfo = new ArrayList<UserListen>();
		PreparedStatement prst = null;
		ResultSet rs = null;
		// 일주일동안 가장 많이 들은 음악 TOP 5를 유저이름으로 검색해 일별 들은 횟수 통계를 내는 쿼리문
		String selectQuery = "SELECT \r\n" + 
				"    m_id,\r\n" + 
				"    SUM(CASE WHEN m_playdate = DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) THEN m_playcount ELSE 0 END) AS day1,\r\n" + 
				"    SUM(CASE WHEN m_playdate = DATE_SUB(CURRENT_DATE(), INTERVAL 2 DAY) THEN m_playcount ELSE 0 END) AS day2,\r\n" + 
				"    SUM(CASE WHEN m_playdate = DATE_SUB(CURRENT_DATE(), INTERVAL 3 DAY) THEN m_playcount ELSE 0 END) AS day3,\r\n" + 
				"    SUM(CASE WHEN m_playdate = DATE_SUB(CURRENT_DATE(), INTERVAL 4 DAY) THEN m_playcount ELSE 0 END) AS day4,\r\n" + 
				"    SUM(CASE WHEN m_playdate = DATE_SUB(CURRENT_DATE(), INTERVAL 5 DAY) THEN m_playcount ELSE 0 END) AS day5,\r\n" + 
				"    SUM(CASE WHEN m_playdate = DATE_SUB(CURRENT_DATE(), INTERVAL 6 DAY) THEN m_playcount ELSE 0 END) AS day6,\r\n" + 
				"    SUM(CASE WHEN m_playdate = DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY) THEN m_playcount ELSE 0 END) AS day7\r\n" + 
				"FROM \r\n" + 
				"    u_listen\r\n" + 
				"WHERE \r\n" + 
				"    u_id = ? AND m_id IN (\r\n" + 
				"        SELECT * FROM (\r\n" + 
				"            SELECT m_id\r\n" + 
				"            FROM u_listen\r\n" + 
				"            WHERE u_id = ?\r\n" + 
				"            GROUP BY m_id\r\n" + 
				"            ORDER BY SUM(m_playcount) DESC\r\n" + 
				"            LIMIT 5\r\n" + 
				"        ) as li\r\n" + 
				"    ) AND m_playdate BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY) AND CURRENT_DATE()\r\n" + 
				"GROUP BY \r\n" + 
				"    m_id\r\n" + 
				"ORDER BY \r\n" + 
				"    m_id;";
		try {
			prst = conn.prepareStatement(selectQuery);
			prst.setString(1, userID);
			prst.setString(2, userID);
			rs = prst.executeQuery();

			while (rs.next()) {
				UserListen listen = new UserListen();
				listen.setLISTEN_USER_ID(userID);
				listen.setLISTEN_MUSIC_ID(rs.getInt("m_id"));
				listen.setLISTEN_COUNT_DAY1(rs.getInt("day1"));
				listen.setLISTEN_COUNT_DAY2(rs.getInt("day2"));
				listen.setLISTEN_COUNT_DAY3(rs.getInt("day3"));
				listen.setLISTEN_COUNT_DAY4(rs.getInt("day4"));
				listen.setLISTEN_COUNT_DAY5(rs.getInt("day5"));
				listen.setLISTEN_COUNT_DAY6(rs.getInt("day6"));
				listen.setLISTEN_COUNT_DAY7(rs.getInt("day7"));
				listenInfo.add(listen);
			}

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			// TODO: handle finally clause
			close(prst);
			close(rs);
		}

		return listenInfo;
	}
	
	public ArrayList<Music> ChartMusicInfoSelect(String userID) {
		ArrayList<Music> chartMusics = new ArrayList<Music>();
		PreparedStatement prst = null;
		ResultSet rs = null;
		String selectQuery = "SELECT DISTINCT\r\n" + 
				"    m_information.m_id,\r\n" + 
				"    m_information.m_name,\r\n" + 
				"    m_information.a_id,\r\n" + 
				"    a_information.a_name,\r\n" + 
				"    m_information.album_id,\r\n" + 
				"    album_information.album_prof_photo\r\n" + 
				"FROM\r\n" + 
				"    m_information\r\n" + 
				"    INNER JOIN a_information ON m_information.a_id = a_information.a_id\r\n" + 
				"    INNER JOIN album_information ON m_information.album_id = album_information.album_id\r\n" + 
				"WHERE\r\n" + 
				"    m_information.m_id IN (\r\n" + 
				"        SELECT *\r\n" + 
				"        FROM (\r\n" + 
				"            SELECT m_id\r\n" + 
				"            FROM u_listen\r\n" + 
				"            WHERE u_id = ?\r\n" + 
				"            GROUP BY m_id\r\n" + 
				"            ORDER BY SUM(m_playcount) DESC\r\n" + 
				"            LIMIT 5\r\n" + 
				"        ) as li\r\n" + 
				"    )\r\n" + 
				"ORDER BY\r\n" + 
				"    m_information.m_id;";
		try {
			prst = conn.prepareStatement(selectQuery);
			prst.setString(1, userID);

			rs = prst.executeQuery();
			while(rs.next()) {
				Music m = new Music();
				m.setMUSIC_NAME(rs.getString(2));
				m.setARTIST_NAME(rs.getString(4));
				m.setALBUM_PHOTO(rs.getString(6));
				chartMusics.add(m);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			// TODO: handle finally clause
			close(prst);
			close(rs);
		}
		
		return chartMusics;
		
	}
}
