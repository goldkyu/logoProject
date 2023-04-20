package dao;

import static db.JdbcUtil.close;
import static db.JdbcUtil.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import java.sql.Connection;

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

			sql = "insert into product(pd_number,pd_name,pd_price,pd_amount,pd_image,pd_detail,discount,charge)values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, spVO.getPd_number());
			pstmt.setString(2, spVO.getPd_name());
			pstmt.setInt(3, spVO.getPd_price());
			pstmt.setInt(4, spVO.getPd_amount());
			pstmt.setString(5, spVO.getPd_image());
			pstmt.setString(6, spVO.getPd_detail());
			pstmt.setInt(7, spVO.getDiscount());
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
		String sql = "select * from product limit ?,10";
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
				spVO.setDiscount(rs.getInt("discount"));
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
				sp.setDiscount(rs.getInt("discount"));
				sp.setCharge(rs.getString("charge"));
			
			}

		} catch (Exception ex) {

		} finally {
			close(rs);
			close(pstmt);
		}
		return sp;
	}

//상품수정
	public int updateModify(ShoppingProduct sp) {

		int updateCount = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "update product set pd_name=?,pd_price=?,pd_amount=?,pd_image=?,pd_detail=?,discount=?,charge=? where pd_number=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sp.getPd_name());
			pstmt.setInt(2, sp.getPd_price());
			pstmt.setInt(3, sp.getPd_amount());
			pstmt.setString(4, sp.getPd_image());
			pstmt.setString(5, sp.getPd_detail());
			pstmt.setInt(6, sp.getDiscount());
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
}
