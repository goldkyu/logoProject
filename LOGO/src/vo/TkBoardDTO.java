package vo;

public class TkBoardDTO {
	int pfm_id;
	String p_code;
	String u_id;
	String pfm_title;
	String pfm_comment;
	String date;
	int hits;
	
	public int getPfm_id() {
		return pfm_id;
	}
	public void setPfm_id(int pfm_id) {
		this.pfm_id = pfm_id;
	}
	public String getP_code() {
		return p_code;
	}
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getPfm_title() {
		return pfm_title;
	}
	public void setPfm_title(String pfm_title) {
		this.pfm_title = pfm_title;
	}
	public String getPfm_comment() {
		return pfm_comment;
	}
	public void setPfm_comment(String pfm_comment) {
		this.pfm_comment = pfm_comment;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	
}
