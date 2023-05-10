package dao;

import static db.JdbcUtil.close;
import static db.JdbcUtil.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import java.sql.Connection;

import vo.ShoppingCart;
import vo.ShoppingDetail;
import vo.ShoppingProduct;
import vo.TicketInfo;

public class ShoppingDAO {
	DataSource ds;
	Connection con;

	private static ShoppingDAO shoppingDAO;

	private ShoppingDAO() {
	}

	public static ShoppingDAO getInstance() {
		if (shoppingDAO == null) {
			shoppingDAO = new ShoppingDAO();
		}
		return shoppingDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	// 상품등록
	public int insertProduct(ShoppingProduct spVO) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		String sql = "";
		int insertCount = 0;

		try {
			pstmt = con.prepareStatement("select max(pd_number) from product;");
			rs = pstmt.executeQuery();
			if (rs.next())
				num = rs.getInt(1) + 1;

			else
				num = 1;

			sql = "insert into product(pd_number,pd_name,pd_price,pd_amount,pd_image,pd_detail,count,charge)values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, spVO.getPd_number());
			pstmt.setString(2, spVO.getPd_name());
			pstmt.setInt(3, spVO.getPd_price());
			pstmt.setInt(4, spVO.getPd_amount());
			pstmt.setString(5, spVO.getPd_image());
			pstmt.setString(6, spVO.getPd_detail());
			pstmt.setInt(7, spVO.getCount());
			pstmt.setString(8, spVO.getCharge());

			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
		} finally {
			close(rs);
			close(pstmt);
		}
		return insertCount;

	}

//페이징
	public int selectListCount() throws Exception {

		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement("select count(*)from product");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} finally {
			close(rs);
			close(pstmt);
		}

		return listCount;
	}

//페이징
	public ArrayList<ShoppingProduct> selectPageList(int page) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from product limit ?,15";
		ArrayList<ShoppingProduct> sp = new ArrayList<ShoppingProduct>();
		ShoppingProduct spVO = null;
		int startrow = (page - 1) * 10;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				spVO = new ShoppingProduct();
				spVO.setPd_number(rs.getString("pd_number"));
				spVO.setPd_name(rs.getString("pd_name"));
				spVO.setPd_price(rs.getInt("pd_price"));
				spVO.setPd_amount(rs.getInt("pd_amount"));
				spVO.setPd_image(rs.getString("pd_image"));
				spVO.setPd_detail(rs.getString("pd_detail"));
				spVO.setCount(rs.getInt("count"));
				spVO.setCharge(rs.getString("charge"));

				sp.add(spVO);
			}
		} catch (Exception ex) {
		} finally {
			close(rs);
			close(pstmt);
		}
		return sp;

	}

// 상세보기
	public ShoppingProduct detailList(String pd_number) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ShoppingProduct sp = null;

		try {

			pstmt = con.prepareStatement("select * from product where pd_number = ?");
			pstmt.setString(1, pd_number);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sp = new ShoppingProduct();
				sp.setPd_number(rs.getString("pd_number"));
				sp.setPd_name(rs.getString("pd_name"));
				sp.setPd_price(rs.getInt("pd_price"));
				sp.setPd_amount(rs.getInt("pd_amount"));
				sp.setPd_image(rs.getString("pd_image"));
				sp.setPd_detail(rs.getString("pd_detail"));
				sp.setCount(rs.getInt("count"));
				sp.setCharge(rs.getString("charge"));

			}

		} catch (Exception ex) {

		} finally {
			close(rs);
			close(pstmt);
		}
		return sp;
	}

// 상세이미지
	public ShoppingDetail detailImage(String pd_number) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ShoppingDetail sd = null;

		try {

			pstmt = con.prepareStatement("select * from shopping_detail where pd_number = ?");
			pstmt.setString(1, pd_number);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sd = new ShoppingDetail();
				sd.setPd_number(rs.getString("pd_number"));
				sd.setDe_image1(rs.getString("de_image1"));
				sd.setDe_image2(rs.getString("de_image2"));
				sd.setDe_image3(rs.getString("de_image3"));
				sd.setDe_image4(rs.getString("de_image4"));

			}

		} catch (Exception ex) {

		} finally {
			close(rs);
			close(pstmt);
		}
		return sd;
	}

//상품수정
	public int updateModify(ShoppingProduct sp) {

		int updateCount = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "update product set pd_name=?,pd_price=?,pd_amount=?,pd_image=?,pd_detail=?,count=?,charge=? where pd_number=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sp.getPd_name());
			pstmt.setInt(2, sp.getPd_price());
			pstmt.setInt(3, sp.getPd_amount());
			pstmt.setString(4, sp.getPd_image());
			pstmt.setString(5, sp.getPd_detail());
			pstmt.setInt(6, sp.getCount());
			pstmt.setString(7, sp.getCharge());
			pstmt.setString(8, sp.getPd_number());

			updateCount = pstmt.executeUpdate();

		} catch (Exception ex) {

		} finally {
			close(pstmt);
		}
		return updateCount;
	}

// 삭제
	public int deleteProduct(String pd_number) {

		PreparedStatement pstmt = null;
		String sql = "delete from product where pd_number=?";
		int deleteCount = 0;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pd_number);
			deleteCount = pstmt.executeUpdate();
		} catch (Exception ex) {
		} finally {
			close(pstmt);
		}

		return deleteCount;

	}

//쇼핑 메인 
	public ArrayList<ShoppingProduct> mainList() {
		PreparedStatement pstmt = null;
		ShoppingProduct sp = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM product ORDER BY count ASC LIMIT 35";

		ArrayList<ShoppingProduct> list = new ArrayList<ShoppingProduct>();

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			while (rs.next()) {
				sp = new ShoppingProduct();
				sp.setPd_number(rs.getString("pd_number"));
				sp.setPd_name(rs.getString("pd_name"));
				sp.setPd_price(rs.getInt("pd_price"));
				sp.setPd_amount(rs.getInt("pd_amount"));
				sp.setPd_image(rs.getString("pd_image"));
				sp.setCount(rs.getInt("count"));
				sp.setCharge(rs.getString("charge"));
				sp.setPd_detail(rs.getString("pd_detail"));
				list.add(sp);

			}

		} catch (Exception e) {

		}

		System.out.println(list.size() + "size");
		return list;
	}

//쇼핑 메인 위클리 베스트	

	public ArrayList<ShoppingProduct> weeklyUpdate() throws Exception {

		PreparedStatement pstmt = null;
		ShoppingProduct sp = null;
		ResultSet rs = null;

		String sql = "select * from product order by count desc";

		ArrayList<ShoppingProduct> weekly = new ArrayList<ShoppingProduct>();

		try {

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			while (rs.next()) {
				sp = new ShoppingProduct();
				sp.setPd_number(rs.getString("pd_number"));
				sp.setPd_name(rs.getString("pd_name"));
				sp.setPd_price(rs.getInt("pd_price"));
				sp.setPd_image(rs.getString("pd_image"));
				sp.setCount(rs.getInt("count"));			
				weekly.add(sp);
			}

		} catch (Exception e) {

		} finally {

			close(pstmt);
		}
		System.out.println(weekly.size() + "size");
		return weekly;

	}
	
//조회수
	
	
	public int updateCount(String pd_number) {

		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql = "update product set count = count +1 where pd_number = '+ pd_number +' ";
		
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
		} catch (Exception e) {
		} finally {
			close(pstmt);

		}

		return updateCount;

	}


// 장바구니 목록
	ArrayList<ShoppingCart> scList = new ArrayList<ShoppingCart>();

	public ArrayList<ShoppingCart> listCart(String pd_number) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ShoppingCart sc = new ShoppingCart();

		try {

			pstmt = con.prepareStatement("select * from shoppingcart where pd_number = ?");
			pstmt.setString(1, pd_number);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				sc.setCart_id(rs.getString("cart_id"));
				sc.setU_id(rs.getString("u_id"));
				sc.setPd_name(rs.getString("pd_name"));
				sc.setPd_number(rs.getString("pd_number"));
				sc.setPrice(rs.getInt("price"));
				sc.setAmount(rs.getInt("amount"));
				sc.setImage(rs.getString("image"));
				scList.add(sc);

				System.out.println(pd_number + " DAO2 ");
			}

		} catch (Exception ex) {

		} finally {
			close(rs);
			close(pstmt);
		}
		return scList;
	}

	// 장바구니 담기

	public int cartInsert(ShoppingCart cart) {
		PreparedStatement pstmt = null;
		String sql = "insert into shoppingcart(cart_id,u_id,pd_name,pd_number,price,amount,image)values(null,null,?,?,?,?,?)";
		int insertCount = 0;
		ResultSet rs = null;
	
		try {
			
			pstmt = con.prepareStatement("select from");
			rs = pstmt.executeQuery();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cart.getCart_id());
			pstmt.setString(2, cart.getU_id());
			pstmt.setString(3, cart.getPd_name());
			pstmt.setString(4, cart.getPd_number());
			pstmt.setInt(5, cart.getPrice());
			pstmt.setInt(6, cart.getAmount());
			pstmt.setString(7, cart.getImage());
			insertCount = pstmt.executeUpdate();
		
		
		
		} catch (Exception e) {
			System.out.println(insertCount +"      222sdfsdfsdf2");
		} finally {
			close(pstmt);
		}
		return insertCount;
	}
}
