package svc;

import dao.MusicDAO;
import vo.Music;
import vo.PlayList;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

public class MusicPlayListCreateService {
	public int musicPlayListCreateService(String pl_name, String userID) {
		int result = 0;

		Connection conn = getConnection();

		MusicDAO m = MusicDAO.getInstance();

		m.setConnection(conn);
		result = m.playlistCreate(pl_name, userID);

		commit(conn);
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
}
