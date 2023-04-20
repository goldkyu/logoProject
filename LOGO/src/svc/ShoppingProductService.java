package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ShoppingDAO;
import dao.TicketDAO;
import vo.ShoppingProduct;
import vo.TicketInfo;

import static db.JdbcUtil.*;

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

}
