package shopping;

public class ShoppingBoardDTO {
	
	private int pd_id;
	private String u_id; 
	private String pd_title; 
	private String pd_comment;
	private String grade;
	private String pd_number;
	private String date;
	int hits;
	public int getPd_id() {
		return pd_id;
	}
	public void setPd_id(int pd_id) {
		this.pd_id = pd_id;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getPd_title() {
		return pd_title;
	}
	public void setPd_title(String pd_title) {
		this.pd_title = pd_title;
	}
	public String getPd_comment() {
		return pd_comment;
	}
	public void setPd_comment(String pd_comment) {
		this.pd_comment = pd_comment;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getPd_number() {
		return pd_number;
	}
	public void setPd_number(String pd_number) {
		this.pd_number = pd_number;
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