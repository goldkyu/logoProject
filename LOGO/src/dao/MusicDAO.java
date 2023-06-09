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
import vo.PlayList;
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
			prst = conn.prepareStatement("SELECT ai.*, a_information.a_name\r\n" + "FROM album_information ai\r\n"
					+ "INNER JOIN a_information ON ai.a_id = a_information.a_id\r\n" + "ORDER BY ai.album_date DESC;");
			rs = prst.executeQuery();
			while (rs.next()) {
				Album a = new Album();
				a.setALBUM_ID(rs.getInt(1));
				a.setALBUM_NAME(rs.getString(2));
				a.setALBUM_PUBLISHER(rs.getString(3));
				a.setALBUM_DATE(rs.getString(4));
				a.setARTIST_ID(rs.getInt(5));
				a.setALBUM_PHOTO(rs.getString(6));
				a.setARTIST_NAME(rs.getString(7));
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
		String selectQuery = "SELECT \r\n" + "    album_information.album_name, \r\n" + "    a_information.a_name, \r\n"
				+ "    m_information.m_id, \r\n" + "    m_information.m_track_num, \r\n"
				+ "    m_information.m_name, \r\n" + "    m_information.m_playtime, \r\n"
				+ "    m_information.m_lyrics, \r\n" + "    album_information.album_date, \r\n"
				+ "    album_information.album_prof_photo \r\n" + "FROM \r\n" + "    m_information \r\n"
				+ "    INNER JOIN album_information ON m_information.album_id = album_information.album_id \r\n"
				+ "    INNER JOIN a_information ON album_information.a_id = a_information.a_id \r\n" + "WHERE \r\n"
				+ "    m_information.album_id = ?\r\n" + "ORDER BY \r\n" + "    m_information.m_track_num ASC;";
		try {
			prst = conn.prepareStatement(selectQuery);
			prst.setInt(1, album_idx);
			rs = prst.executeQuery();
			while (rs.next()) {
				Music m = new Music();
				m.setALBUM_NAME(rs.getString(1));
				m.setARTIST_NAME(rs.getString(2));
				m.setMUSIC_ID(rs.getInt(3));
				m.setMUSIC_TRACK_NUM(rs.getInt(4));
				m.setMUSIC_NAME(rs.getString(5));
				m.setMUSIC_PLAYTIME(rs.getString(6));
				m.setMUSIC_LYRICS(rs.getString(7));
				m.setMUSIC_DATE(rs.getString(8));
				m.setALBUM_PHOTO(rs.getString(9));
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
		int check = 0;
		// 2주동안 가장 많이 들은 음악 TOP 5를 유저이름으로 검색해 일별 들은 횟수 통계를 내는 쿼리문
		String selectQuery = "SELECT \r\n" + "    m_id,\r\n"
				+ "    SUM(CASE WHEN m_playdate = DATE_SUB(CURRENT_DATE(), INTERVAL 0 DAY) THEN m_playcount ELSE 0 END) AS day1,\r\n"
				+ "    SUM(CASE WHEN m_playdate = DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) THEN m_playcount ELSE 0 END) AS day2,\r\n"
				+ "    SUM(CASE WHEN m_playdate = DATE_SUB(CURRENT_DATE(), INTERVAL 2 DAY) THEN m_playcount ELSE 0 END) AS day3,\r\n"
				+ "    SUM(CASE WHEN m_playdate = DATE_SUB(CURRENT_DATE(), INTERVAL 3 DAY) THEN m_playcount ELSE 0 END) AS day4,\r\n"
				+ "    SUM(CASE WHEN m_playdate = DATE_SUB(CURRENT_DATE(), INTERVAL 4 DAY) THEN m_playcount ELSE 0 END) AS day5,\r\n"
				+ "    SUM(CASE WHEN m_playdate = DATE_SUB(CURRENT_DATE(), INTERVAL 5 DAY) THEN m_playcount ELSE 0 END) AS day6,\r\n"
				+ "    SUM(CASE WHEN m_playdate = DATE_SUB(CURRENT_DATE(), INTERVAL 6 DAY) THEN m_playcount ELSE 0 END) AS day7,\r\n"
				+ "    SUM(CASE WHEN m_playdate = DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY) THEN m_playcount ELSE 0 END) AS day8,\r\n"
				+ "	SUM(CASE WHEN m_playdate = DATE_SUB(CURRENT_DATE(), INTERVAL 8 DAY) THEN m_playcount ELSE 0 END) AS day9,\r\n"
				+ "	SUM(CASE WHEN m_playdate = DATE_SUB(CURRENT_DATE(), INTERVAL 9 DAY) THEN m_playcount ELSE 0 END) AS day10,\r\n"
				+ "	SUM(CASE WHEN m_playdate = DATE_SUB(CURRENT_DATE(), INTERVAL 10 DAY) THEN m_playcount ELSE 0 END) AS day11,\r\n"
				+ "	SUM(CASE WHEN m_playdate = DATE_SUB(CURRENT_DATE(), INTERVAL 11 DAY) THEN m_playcount ELSE 0 END) AS day12,\r\n"
				+ "	SUM(CASE WHEN m_playdate = DATE_SUB(CURRENT_DATE(), INTERVAL 12 DAY) THEN m_playcount ELSE 0 END) AS day13,\r\n"
				+ "	SUM(CASE WHEN m_playdate = DATE_SUB(CURRENT_DATE(), INTERVAL 13 DAY) THEN m_playcount ELSE 0 END) AS day14\r\n"
				+ "\r\n" + "FROM \r\n" + "    u_listen\r\n" + "WHERE \r\n" + "    u_id = ? AND m_id IN (\r\n"
				+ "        SELECT * FROM (\r\n" + "            SELECT m_id\r\n" + "            FROM u_listen\r\n"
				+ "            WHERE u_id = ? \r\n" + "            GROUP BY m_id\r\n"
				+ "            ORDER BY SUM(m_playcount) DESC\r\n" + "            LIMIT 5\r\n" + "        ) as li\r\n"
				+ "    ) AND m_playdate BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 13 DAY) AND CURRENT_DATE()\r\n"
				+ "GROUP BY \r\n" + "    m_id\r\n" + "ORDER BY \r\n" + "    m_id;";
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
				listen.setLISTEN_COUNT_DAY8(rs.getInt("day8"));
				listen.setLISTEN_COUNT_DAY9(rs.getInt("day9"));
				listen.setLISTEN_COUNT_DAY10(rs.getInt("day10"));
				listen.setLISTEN_COUNT_DAY11(rs.getInt("day11"));
				listen.setLISTEN_COUNT_DAY12(rs.getInt("day12"));
				listen.setLISTEN_COUNT_DAY13(rs.getInt("day13"));
				listen.setLISTEN_COUNT_DAY14(rs.getInt("day14"));
				listenInfo.add(listen);

			}

			System.out.println(listenInfo.size());

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
		String selectQuery = "SELECT DISTINCT\r\n" + "    m_information.m_id,\r\n" + "    m_information.m_name,\r\n"
				+ "    m_information.a_id,\r\n" + "    a_information.a_name,\r\n" + "    m_information.album_id,\r\n"
				+ "    album_information.album_prof_photo\r\n" + "FROM\r\n" + "    m_information\r\n"
				+ "    INNER JOIN a_information ON m_information.a_id = a_information.a_id\r\n"
				+ "    INNER JOIN album_information ON m_information.album_id = album_information.album_id\r\n"
				+ "WHERE\r\n" + "    m_information.m_id IN (\r\n" + "        SELECT *\r\n" + "        FROM (\r\n"
				+ "            SELECT m_id\r\n" + "            FROM u_listen\r\n" + "            WHERE u_id = ?\r\n"
				+ "            GROUP BY m_id\r\n" + "            ORDER BY SUM(m_playcount) DESC\r\n"
				+ "            LIMIT 5\r\n" + "        ) as li\r\n" + "    )\r\n" + "ORDER BY\r\n"
				+ "    m_information.m_id;";
		try {
			prst = conn.prepareStatement(selectQuery);
			prst.setString(1, userID);

			rs = prst.executeQuery();
			while (rs.next()) {
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

	public ArrayList<Music> TopChartMusicSelect() {
		ArrayList<Music> topMusics = new ArrayList<Music>();
		PreparedStatement prst = null;
		ResultSet rs = null;
		String selectQuery = "SELECT \r\n" + "    rt.album_prof_photo,\r\n" + "    rt.m_name,\r\n"
				+ "    rt.a_name,\r\n" + "    rt.album_id,\r\n" + "    rt.a_id,\r\n" + "    rt.playcount,\r\n"
				+ "    @rank:=@rank + 1 AS `rank`,\r\n" + "    COALESCE(ry.old_rank - @rank, 0) AS old_rank,\r\n"
				+ "    rt.m_id\r\n" + "FROM\r\n" + "    (SELECT \r\n"
				+ "        album_information.album_prof_photo,\r\n" + "            m_information.m_id,\r\n"
				+ "            m_information.m_name,\r\n" + "            a_information.a_name,\r\n"
				+ "            m_information.album_id,\r\n" + "            a_information.a_id,\r\n"
				+ "            SUM(CASE\r\n"
				+ "                WHEN u_listen.m_playdate BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 10 DAY) AND CURRENT_DATE() THEN u_listen.m_playcount\r\n"
				+ "                ELSE 0\r\n" + "            END) AS playcount\r\n" + "    FROM\r\n"
				+ "        u_listen\r\n" + "    INNER JOIN m_information ON u_listen.m_id = m_information.m_id\r\n"
				+ "    INNER JOIN a_information ON m_information.a_id = a_information.a_id\r\n"
				+ "    INNER JOIN album_information ON m_information.album_id = album_information.album_id\r\n"
				+ "    GROUP BY album_information.album_prof_photo , m_information.m_id , m_information.m_name , a_information.a_name , m_information.album_id , a_information.a_id\r\n"
				+ "    ORDER BY playcount DESC) rt\r\n" + "        LEFT JOIN\r\n" + "    (SELECT \r\n"
				+ "        m_information.album_id,\r\n" + "            a_information.a_id,\r\n"
				+ "            SUM(CASE\r\n"
				+ "                WHEN u_listen.m_playdate BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) AND DATE_SUB(CURRENT_DATE(), INTERVAL 11 DAY) THEN u_listen.m_playcount\r\n"
				+ "                ELSE 0\r\n" + "            END) AS old_playcount,\r\n"
				+ "            @old_rank:=@old_rank + 1 AS old_rank\r\n" + "    FROM\r\n" + "        u_listen\r\n"
				+ "    INNER JOIN m_information ON u_listen.m_id = m_information.m_id\r\n"
				+ "    INNER JOIN a_information ON m_information.a_id = a_information.a_id\r\n"
				+ "    INNER JOIN album_information ON m_information.album_id = album_information.album_id\r\n"
				+ "    CROSS JOIN (SELECT @old_rank:=0) AS ry\r\n" + "    WHERE\r\n"
				+ "        u_listen.m_playdate BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 11 DAY) AND DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)\r\n"
				+ "    GROUP BY m_information.album_id , a_information.a_id\r\n"
				+ "    ORDER BY old_playcount DESC) ry ON rt.album_id = ry.album_id\r\n"
				+ "        AND rt.a_id = ry.a_id\r\n" + "        CROSS JOIN\r\n" + "    (SELECT @rank:=0) AS `rank`\r\n"
				+ "ORDER BY playcount DESC;";

		try {
			prst = conn.prepareStatement(selectQuery);
			rs = prst.executeQuery();
			while (rs.next()) {
				Music m = new Music();
				m.setALBUM_PHOTO(rs.getString(1));
				m.setMUSIC_NAME(rs.getString(2));
				m.setARTIST_NAME(rs.getString(3));
				m.setALBUM_ID(rs.getInt(4));
				m.setARTIST_ID(rs.getInt(5));
				m.setMUSIC_CHART_CHANGED(rs.getInt(8));
				m.setMUSIC_ID(rs.getInt(9));
				topMusics.add(m);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close(prst);
			close(rs);
		}
		return topMusics;
	}

	public void listenUpdate(String m_name, String userID) {
		PreparedStatement prst = null;
		String updateQuery = "INSERT INTO u_listen (m_id, u_id, m_playcount, m_playdate)\r\n"
				+ "VALUES ((SELECT m_id FROM m_information WHERE m_name = ?), ?, 1, CURDATE())\r\n"
				+ "ON DUPLICATE KEY UPDATE m_playcount = m_playcount + 1;";
		try {
			prst = conn.prepareStatement(updateQuery);
			prst.setString(1, m_name);
			prst.setString(2, userID);
			int i = prst.executeUpdate();
			System.out.println(i + "." + m_name + "성공성공!" + userID);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close(prst);
		}
	}

	public int playlistCreate(PlayList pl) {
		PreparedStatement prst = null;
		int result = 0;
		String updateQuery = "INSERT INTO pl_information (pl_name, u_id, pl_prof_photo,pl_prof_massage,pl_hash)"
				+ "VALUES(?,?,?,?,?)";
		try {
			prst = conn.prepareStatement(updateQuery);
			prst.setString(1, pl.getPl_name());
			prst.setString(2, pl.getU_id());
			prst.setString(3, pl.getPl_prof_photo());
			prst.setString(4, pl.getPl_prof_message());
			prst.setString(5, pl.getPl_hash());

			result = prst.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close(prst);
		}

		return result;
	}

	public ArrayList<PlayList> playlistSelect(String userID) {
		PreparedStatement prst = null;

		ResultSet rs = null;
		ArrayList<PlayList> pl = new ArrayList<PlayList>();
		String selectQuery = "SELECT * FROM pl_information WHERE u_id = ?;";
		try {
			prst = conn.prepareStatement(selectQuery);
			prst.setString(1, userID);

			rs = prst.executeQuery();

			while (rs.next()) {
				PlayList p = new PlayList();
				p.setU_id(userID);
				p.setPl_id(rs.getInt(1));
				p.setPl_name(rs.getString(2));
				p.setPl_prof_photo(rs.getString(3));
				p.setPl_prof_message(rs.getString(4));
				p.setPl_hash(rs.getString(5));
				pl.add(p);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close(prst);
			close(rs);
		}

		return pl;

	}

	public ArrayList<Music> playlistMusics(int pl_id) {
		ArrayList<Music> plm = new ArrayList<Music>();
		PreparedStatement prst = null;

		ResultSet rs = null;

		String selectQuery = "SELECT m.*, a.*, ai.a_name\r\n" + "FROM m_information m\r\n"
				+ "JOIN album_information a ON m.album_id = a.album_id\r\n"
				+ "JOIN a_information ai ON m.a_id = ai.a_id\r\n" + "JOIN pl_musiclist pm ON m.m_id = pm.m_id\r\n"
				+ "WHERE pm.pl_id = ?\r\n" + "ORDER BY pm.pl_date ASC;";
		try {
			prst = conn.prepareStatement(selectQuery);
			prst.setInt(1, pl_id);

			rs = prst.executeQuery();

			while (rs.next()) {
				Music m = new Music();
				m.setMUSIC_ID(rs.getInt(1));
				m.setMUSIC_NAME(rs.getString(2));
				m.setMUSIC_DATE(rs.getString(3));
				m.setMUSIC_PLAYTIME(rs.getString(4));
				m.setMUSIC_TRACK_NUM(rs.getInt(5));
				m.setARTIST_NAME(rs.getString(15));
				m.setALBUM_PHOTO(rs.getString(14));
				m.setALBUM_ID(rs.getInt(8));
				plm.add(m);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close(prst);
			close(rs);
		}

		return plm;
	}

	public void musicPlayListInsert(int pl_id, int m_id) {
		PreparedStatement prst = null;
		int num = 0;
		String insertQuery = "insert into pl_musiclist(pl_id, m_id) value (?, ?);";
		try {
			prst = conn.prepareStatement(insertQuery);
			prst.setInt(1, pl_id);
			prst.setInt(2, m_id);

			num = prst.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close(prst);
		}
	}
	
	public PlayList playListSelect(int pl_id) {
		PreparedStatement prst = null;
		ResultSet rs = null;
		PlayList pl = null;
		String selectQuery = "select * from pl_information where pl_id = ?;";
		try {
			prst = conn.prepareStatement(selectQuery);
			prst.setInt(1, pl_id);
			rs = prst.executeQuery();
			if(rs.next()) {
				pl = new PlayList();
				pl.setPl_name(rs.getString(2));
				pl.setPl_prof_photo(rs.getString(3));
				pl.setPl_prof_message(rs.getString(4));
				pl.setPl_hash(rs.getString(5));
				pl.setU_id(rs.getString(6));
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close(prst);
			close(rs);
			
		}
		return pl;
	}
}
