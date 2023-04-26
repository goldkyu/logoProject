package vo;

public class ShoppingCart {
	private String basket_number = "";
	private String u_id= "";
	private String pd_number= "";
	private int basket_amount= 0;
	private int basket_price= 0;
	
	
	public String getBasket_number() {
		return basket_number;
	}
	public void setBasket_number(String basket_number) {
		this.basket_number = basket_number;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getPd_number() {
		return pd_number;
	}
	public void setPd_number(String pd_number) {
		this.pd_number = pd_number;
	}
	public int getBasket_amount() {
		return basket_amount;
	}
	public void setBasket_amount(int basket_amount) {
		this.basket_amount = basket_amount;
	}
	public int getBasget_price() {
		return basket_price;
	}
	public void setBasget_price(int basget_price) {
		this.basket_price = basget_price;
	}
}
