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
		try {
			prst = conn.prepareStatement("select * from album_information order by album_date desc;");
			ResultSet rs = prst.executeQuery();
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
			close(conn);
		}

		return albumList;
	}

	public ArrayList<Music> albumInfoSelect(int album_idx) {
		ArrayList<Music> musicListFromAlbum = new ArrayList<Music>();
		PreparedStatement prst = null;
		try {
			prst = conn.prepareStatement("select * form m_information where album_id = "+album_idx+" order by m_track_num asc;");
			ResultSet rs = prst.executeQuery();
			while(rs.next()) {
				Music m = new Music();
				m.setMUSIC_ID(rs.getInt(1));
				m.setMUSIC_NAME(rs.getString(2));
				m.setMUSIC_DATE(rs.getString(3));
				m.setMUSIC_PLAYTIME(rs.getString(4));
				m.setMUSIC_TRACK_NUM(rs.getInt(5));
				m.setMUSIC_LYRICS(rs.getString(6));
				m.setARTIST_ID(rs.getInt(7));
				m.setALBUM_ID(rs.getInt(8));
				musicListFromAlbum.add(m);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			// TODO: handle finally clause
			close(prst);
			close(conn);
		}
		
		return musicListFromAlbum;
	}
}
