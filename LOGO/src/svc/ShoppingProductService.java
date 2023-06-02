package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.ShoppingDAO;

import vo.ShoppingCart;
import vo.ShoppingDetail;
import vo.ShoppingProduct;

public class ShoppingProductService {

//상품등록
	public boolean writeProduct(ShoppingProduct spVO) {

		boolean Success = false;
		Connection con = getConnection();
		ShoppingDAO shoppingDAO = ShoppingDAO.getInstance();
		shoppingDAO.setConnection(con);
		int insertCount = shoppingDAO.insertProduct(spVO);

		if (insertCount > 0) {
			commit(con);
			Success = true;
		} else {
			rollback(con);
		}

		close(con);
		return Success;

	}

//상품리스트	
	public int getListCount() throws Exception {
		int listCount = 0;
		Connection con = getConnection();
		ShoppingDAO shoppingDAO = ShoppingDAO.getInstance();
		shoppingDAO.setConnection(con);
		listCount = shoppingDAO.selectListCount();
		close(con);
		return listCount;

	}

//페이징	
	public ArrayList<ShoppingProduct> getArticleList(int page) throws Exception {

		ArrayList<ShoppingProduct> sp = null;
		Connection con = getConnection();
		ShoppingDAO shoppingDAO = ShoppingDAO.getInstance();
		shoppingDAO.setConnection(con);
		sp = shoppingDAO.selectPageList(page);
		close(con);
		return sp;

	}

//상품 상세
	public ShoppingProduct getDetail(String pd_number) throws Exception {

		ShoppingProduct sp = null;
		Connection con = getConnection();
		ShoppingDAO shoppingDAO = ShoppingDAO.getInstance();
		shoppingDAO.setConnection(con);

		sp = shoppingDAO.detailList(pd_number);
		close(con);
		return sp;

	}

// 상세 이미지
	public ShoppingDetail getImage(String pd_number) throws Exception {

		ShoppingDetail sd = null;
		Connection con = getConnection();
		ShoppingDAO shoppingDAO = ShoppingDAO.getInstance();
		shoppingDAO.setConnection(con);

		sd = shoppingDAO.detailImage(pd_number);
		close(con);
		return sd;

	}

//상품 수정
	public boolean getModify(ShoppingProduct sp) throws Exception {
		boolean Success = false;
		Connection con = getConnection();
		ShoppingDAO shoppingDAO = ShoppingDAO.getInstance();
		shoppingDAO.setConnection(con);
		int updateCount = shoppingDAO.updateModify(sp);

		if (updateCount > 0) {
			commit(con);
			Success = true;
		} else {
			rollback(con);
		}
		close(con);
		return Success;

	}

// 삭제
	public boolean removeProduct(String pd_number) throws Exception {

		boolean Success = false;
		Connection con = getConnection();
		ShoppingDAO shoppingDAO = ShoppingDAO.getInstance();
		shoppingDAO.setConnection(con);
		int deleteCount = shoppingDAO.deleteProduct(pd_number);

		if (deleteCount > 0) {
			commit(con);
			Success = true;
		} else {
			rollback(con);
		}

		close(con);
		return Success;
	}

//쇼핑 메인 
	public ArrayList<ShoppingProduct> mainProduct() {
		Connection con = getConnection();
		ShoppingDAO dao = ShoppingDAO.getInstance();
		dao.setConnection(con);
		ArrayList<ShoppingProduct> list = dao.mainList();
		
		close(con);

		return list;
	}
	

	
//쇼핑 메인 위클리 베스트
	public ArrayList<ShoppingProduct> weeklyUpdate() throws Exception {
		Connection con = getConnection();
		ShoppingDAO dao = ShoppingDAO.getInstance();
		dao.setConnection(con);
		ArrayList<ShoppingProduct> weekly = dao.weeklyUpdate();
		close(con);
		return weekly;
	}
	
//조회수
	
	public int updateCount(String pd_number)throws Exception {
		Connection con = getConnection();
		ShoppingDAO dao = ShoppingDAO.getInstance();
		dao.setConnection(con);
		int updateCount = dao.updateCount(pd_number);
		close(con);
		return updateCount;
	}

	// 장바구니 목록
	public ArrayList<ShoppingCart> listCart(String pd_number) throws Exception {

		Connection con = getConnection();
		ShoppingDAO shoppingDAO = ShoppingDAO.getInstance();
		shoppingDAO.setConnection(con);
		ArrayList<ShoppingCart> cart = shoppingDAO.listCart(pd_number);
		close(con);
		System.out.println(pd_number + " 서비스3 ");

		return cart;
	}
	
//장바구니 담기
	
	public boolean cartInsert(ShoppingCart cart) throws Exception {
		boolean Success = false;
		Connection con = getConnection();
		ShoppingDAO shoppingDAO = ShoppingDAO.getInstance();
		shoppingDAO.setConnection(con);
		int insertCount = shoppingDAO.cartInsert(cart);
	
		if (insertCount > 0) {
			commit(con);
			Success = true;
		} else {
			rollback(con);
		}
		close(con);
		return Success;

	}
		

}