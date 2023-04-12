package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MusicDAO;
import static db.JdbcUtil.*;

import vo.Music;

public class AlbumInfoService {
	public ArrayList<Music> getAlbumInfo(int album_idx){
		ArrayList<Music> musicList = null;
		
		Connection conn = getConnection();
		
		MusicDAO m = MusicDAO.getInstance();
		
		m.setConnection(conn);
		
		musicList = m.albumInfoSelect(album_idx);
		
		close(conn);
		
		return musicList;
		
	}

}
