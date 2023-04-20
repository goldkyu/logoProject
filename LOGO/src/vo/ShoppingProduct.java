package vo;

public class ShoppingProduct {

	private String pd_number ="";
	private String pd_name="";
	private int pd_price=0;
	private int pd_amount=0;
	private String pd_image="";
	private String pd_detail="";
	private int discount=0;
	private String charge="";
	
	
	public String getPd_number() {
		return pd_number;
	}
	public void setPd_number(String pd_number) {
		this.pd_number = pd_number;
	}
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
	public int getPd_price() {
		return pd_price;
	}
	public void setPd_price(int pd_price) {
		this.pd_price = pd_price;
	}
	public int getPd_amount() {
		return pd_amount;
	}
	public void setPd_amount(int pd_amount) {
		this.pd_amount = pd_amount;
	}
	public String getPd_image() {
		return pd_image;
	}
	public void setPd_image(String pd_image) {
		this.pd_image = pd_image;
	}
	public String getPd_detail() {
		return pd_detail;
	}
	public void setPd_detail(String pd_detail) {
		this.pd_detail = pd_detail;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getCharge() {
		return charge;
	}
	public void setCharge(String charge) {
		this.charge = charge;
	}
}
