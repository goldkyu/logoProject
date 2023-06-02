package svc;

import dao.MusicDAO;
import vo.Music;
import vo.PlayList;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

public class MusicPlayListCreateService {
	public int musicPlayListCreateService(PlayList pl) {
		int result = 0;

		Connection conn = getConnection();

		MusicDAO m = MusicDAO.getInstance();

		m.setConnection(conn);
		result = m.playlistCreate(pl);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;

	}

	public ArrayList<PlayList> musicPlayListSelectService(String userID) {
		ArrayList<PlayList> pl = new ArrayList<PlayList>();

		Connection conn = getConnection();

		MusicDAO m = MusicDAO.getInstance();

		m.setConnection(conn);

		pl = m.playlistSelect(userID);

		close(conn);

		return pl;
	}

	public ArrayList<Music> musicPlayListService(int pl_id) {
		ArrayList<Music> pl_musics = new ArrayList<Music>();

		Connection conn = getConnection();

		MusicDAO m = MusicDAO.getInstance();

		m.setConnection(conn);

		pl_musics = m.playlistMusics(pl_id);

		close(conn);

		return pl_musics;
	}

	public void musicPlayListAddService(int pl_id, int m_id) {
		Connection conn = getConnection();
		MusicDAO m = MusicDAO.getInstance();

		m.setConnection(conn);

		m.musicPlayListInsert(pl_id, m_id);

		commit(conn);

		close(conn);

	}

	public PlayList musicPlayListViewService(int pl_id) {
		Connection conn = getConnection();
		MusicDAO m = MusicDAO.getInstance();
		PlayList pl = null;
		m.setConnection(conn);
		pl = m.playListSelect(pl_id);

		close(conn);

		return pl;
	}
}
