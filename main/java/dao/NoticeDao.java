package dao;

import java.sql.SQLException;
import java.util.List;

import dto.Notice;

public interface NoticeDao {

	void makingTable();
	void dropTable();
	int getTotalCount();
	Notice getOne(int id);
	List<Notice> selectAll(int page, int countPerPage) throws SQLException, ClassNotFoundException;
	List<Notice> selectAll();
	int getMax();
	int getReplyViewOrders(int originalPostId);
	

}
