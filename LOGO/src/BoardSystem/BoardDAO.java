package BoardSystem;

import java.sql.*;
import java.util.ArrayList;

public class BoardDAO {
    Connection conn = null;
    Statement st = null;

    // Date()나 Datetime()형 필드에 삽입하기 위한 포매터 설정
    // SimpleDateFormat("날짜나 시간 패턴") ("")안의 패턴대로 시간이 String 형태로 포맷됩니다.
    java.util.Date now = new java.util.Date();
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    String datetime = sdf.format(now);

    // DB 기본 설정 메소드들입니다.

    public BoardDAO() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
    }

    public void conn() throws Exception {
        conn = DriverManager.getConnection(
                "jdbc:mysql://52.79.193.49:3306/LOGODB?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false",
                "logouser", "1234");
        if (conn == null) {
            throw new Exception("DataBase can't found.");
        }
    }

    public void disConn() throws SQLException {
        st.close();
        conn.close();
    }

    // Post 작성 메소드입니다. INSERT문을 활용합니다.

    public void createPost(Board board) throws Exception {
        try {
            conn();
            st = conn.createStatement();
            int rowNum = st.executeUpdate(
                    "insert into post values (NULL, '" + board.getPname() + "','" + datetime + "','" + board.getUid()
                            + "'," + board.getBid() + ",'" + board.getContent() + "','" + board.getFile() + "');");
            if (rowNum < 1) {
                throw new Exception("failed");
            }
        } finally {
            disConn();
        }
    }

    // Post 수정 메소드입니다. UPDATE문을 활용합니다.

    public void updatePost(Board board) throws Exception {

        try {
            conn();
            st = conn.createStatement();
            if (board.getFile() != null) {
                int rowNum = st.executeUpdate("update post set p_name='" + board.getPname() + "', p_date='" + datetime
                        + "', p_content ='" + board.getContent() + "', p_file ='" + board.getFile() + "' where p_id = "
                        + board.getPid() + "; ");
                if (rowNum < 1) {
                    throw new Exception("failed");
                }
            } else {
                int rowNum = st.executeUpdate("update post set p_name='" + board.getPname() + "', p_date='" + datetime
                        + "', p_content ='" + board.getContent() + "' where p_id = "
                        + board.getPid() + "; ");
                if (rowNum < 1) {
                    throw new Exception("failed");
                }

            }

        } finally {
            disConn();
        }
    }

    // Post 삭제 메소드입니다. DELETE문을 활용하고, 작성된 게시글의 p_id(PRIMARY KEY)로 삭제할 게시글을 특정합니다.

    public void deletePost(int pid) throws Exception {
        try {
            conn();
            st = conn.createStatement();
            int rowNum = st.executeUpdate("delete from post where p_id = " + pid + "; ");
            if (rowNum < 1) {
                throw new Exception("failed");
            }
        } finally {
            disConn();
        }
    }

    // 게시판에서 작성된 전체 Post를 보여주기 위한 메소드입니다.
    // Board 객체 ArrayList로 Post 테이블의 전체 레코드들의 정보를 저장합니다.

    public ArrayList<Board> showPost() throws Exception {
        ArrayList<Board> bArr = new ArrayList<Board>();
        try {
            conn();
            st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from post order by p_id desc");
            while (rs.next()) {
                Board b = new Board();
                b.setPid(Integer.parseInt(rs.getString(1)));
                b.setPname(rs.getString(2));
                b.setPdate(rs.getString(3));
                b.setUid(rs.getString(4));
                b.setBid(Integer.parseInt(rs.getString(5)));
                b.setContent(rs.getString(6));
                b.setFile(rs.getString(7));

                bArr.add(b);

            }

        } finally {
            disConn();
        }
        return bArr;
    }

    // 게시글 이름으로 검색 메소드입니다.
    // 입력받은 값(pname)이 포함된 Post 레코드들을 ArrayList<Board>타입으로 리턴합니다.

    public ArrayList<Board> searchPost(String pname) throws Exception {
        ArrayList<Board> bArr = new ArrayList<Board>();
        try {
            conn();
            st = conn.createStatement();
            ResultSet rs = st
                    .executeQuery("select * from post where p_name like '%" + pname + "%' order by p_id desc;");
            while (rs.next()) {
                Board b = new Board();
                b.setPid(Integer.parseInt(rs.getString(1)));
                b.setPname(rs.getString(2));
                b.setPdate(rs.getString(3));
                b.setUid(rs.getString(4));
                b.setBid(Integer.parseInt(rs.getString(5)));
                b.setContent(rs.getString(6));
                b.setFile(rs.getString(7));

                bArr.add(b);

            }

        } finally {
            disConn();
        }
        return bArr;
    }

    public ArrayList<Board> searchPostByUid(String uid) throws Exception {
        ArrayList<Board> bArr = new ArrayList<Board>();
        try {
            conn();
            st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from post where u_id like '%" + uid + "%' order by p_id desc;");
            while (rs.next()) {
                Board b = new Board();
                b.setPid(Integer.parseInt(rs.getString(1)));
                b.setPname(rs.getString(2));
                b.setPdate(rs.getString(3));
                b.setUid(rs.getString(4));
                b.setBid(Integer.parseInt(rs.getString(5)));
                b.setContent(rs.getString(6));
                b.setFile(rs.getString(7));

                bArr.add(b);

            }

        } finally {
            disConn();
        }
        return bArr;
    }

    public ArrayList<Board> searchPostByCon(String con) throws Exception {
        ArrayList<Board> bArr = new ArrayList<Board>();
        try {
            conn();
            st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from post where p_name like '%" + con + "%' or p_content like '%"
                    + con + "%' order by p_id desc;");
            while (rs.next()) {
                Board b = new Board();
                b.setPid(Integer.parseInt(rs.getString(1)));
                b.setPname(rs.getString(2));
                b.setPdate(rs.getString(3));
                b.setUid(rs.getString(4));
                b.setBid(Integer.parseInt(rs.getString(5)));
                b.setContent(rs.getString(6));
                b.setFile(rs.getString(7));

                bArr.add(b);

            }

        } finally {
            disConn();
        }
        return bArr;
    }

    // 내 글 보기 버튼을 눌렀을때 사용되는 메소드입니다.
    public ArrayList<Board> searchPostByMyId(String uid) throws Exception {
        ArrayList<Board> bArr = new ArrayList<Board>();
        try {
            conn();
            st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from post where u_id = '" + uid + "' order by p_id desc;");
            while (rs.next()) {
                Board b = new Board();
                b.setPid(Integer.parseInt(rs.getString(1)));
                b.setPname(rs.getString(2));
                b.setPdate(rs.getString(3));
                b.setUid(rs.getString(4));
                b.setBid(Integer.parseInt(rs.getString(5)));
                b.setContent(rs.getString(6));
                b.setFile(rs.getString(7));

                bArr.add(b);

            }

        } finally {
            disConn();
        }
        return bArr;
    }

    // Post의 콘텐츠를 보기 위한 메소드입니다.
    public Board showContent(int pid) throws Exception {
        Board b = new Board();
        try {
            conn();
            st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from post where p_id ='" + pid + "';");
            if (rs.next()) {
                b.setPid(Integer.parseInt(rs.getString(1)));
                b.setPname(rs.getString(2));
                b.setPdate(rs.getString(3));
                b.setUid(rs.getString(4));
                b.setBid(Integer.parseInt(rs.getString(5)));
                b.setContent(rs.getString(6));
                b.setFile(rs.getString(7));
            }
        } finally {
            disConn();
        }

        return b;
    }

}
