package svc;

import java.util.ArrayList;

import dao.MusicDAO;

import static db.JdbcUtil.*;
import java.sql.Connection;

import vo.Album;

public class MusicMainService {
	public ArrayList<Album> getAlbumList(){
		ArrayList<Album> newAlbums = null;
		// JdbcUtil 클래스의 getConnection 메소드로 DB연결
		Connection conn = getConnection();
		
		// 싱글톤 패턴으로 DAO객체를 생성합니다.
		MusicDAO m = MusicDAO.getInstance();
		
		// DAO객체의 setConnection으로 DB 연결 정보를 DAO로 전달합니다.
		m.setConnection(conn);
		
		// 쿼리문 메소드의 결과물을 저장
		newAlbums = m.albumListSelect();
		
		// JdbcUtil 클래스의 close 메소드
		close(conn);
		
		return newAlbums;
		
	}

}
