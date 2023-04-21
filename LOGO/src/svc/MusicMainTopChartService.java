package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MusicDAO;

import static db.JdbcUtil.*;
import vo.Music;

public class MusicMainTopChartService {
	public ArrayList<Music> getTopChart() {
		ArrayList<Music> topChart = new ArrayList<Music>();
		Connection conn = getConnection();

		MusicDAO m = MusicDAO.getInstance();

		m.setConnection(conn);

		topChart = m.TopChartMusicSelect();

		close(conn);

		return topChart;

	}
}
