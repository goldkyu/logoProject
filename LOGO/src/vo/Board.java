package vo;

public class Board {
    int bid;        //게시판 아이디, 1 - 유저 게시판 등
    String bname;   //게시판 이름, 1- 유저 게시판 등, 잘 안씀
    int pid;        //게시글 번호, Post 테이블에선 auto increment로 설정되어있기 때문에 INSERT에선 사용되지 않습니다.
    String pname;   //게시글 이름
    String pdate;   //게시 날짜, 현재 날짜를 인덱싱해서 삽입하기 때문에 INSERT에선 사용되지 않습니다.
    String uid;     //게시자 이름, DB 전반에서 쓰이는 user의 ID입니다.
    String content; //게시글 내용
    String file;	//게시글 첨부파일

    public int getBid() {
        return this.bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public String getBname() {
        return this.bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public int getPid() {
        return this.pid;
    }

	public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPname() {
        return this.pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPdate() {
        return this.pdate;
    }

    public void setPdate(String pdate) {
        this.pdate = pdate;
    }

    public String getUid() {
        return this.uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
    public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

}
