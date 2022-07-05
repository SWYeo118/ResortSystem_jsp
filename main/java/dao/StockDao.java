package dao;

import java.sql.SQLException;
import java.util.List;

import dto.Stock;

public interface StockDao {

	void makingTable();
	void dropTable();
	List<Stock> selectAll();
	List<Stock> selectAll(int page, int countPerPage) throws SQLException, ClassNotFoundException;
	int getTotalCount();
	Stock getOne(int stockId);
	

}
