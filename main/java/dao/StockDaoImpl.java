package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dto.Stock;

public class StockDaoImpl implements StockDao {

	public StockDaoImpl() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // jdbc Driver에 연결
		} catch (ClassNotFoundException e) {
			throw new IllegalStateException("jdbc 드라이버 로드 실패" + e); // 연결 실패 시 에러메세지
		}
	}
	@Override
	public void makingTable() {
		
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root",
				"");) {
			String sql = "create table stockList(stockId int not null primary key, stockName varchar(70), stockSize int, productUploadDate date, stockUpdateDate date, stockDescription text, stockPicture varChar(100))DEFAULT CHARSET=utf8";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();
			sql="insert into stockList(stockId, stockName, stockSize, productUploadDate, stockUpdateDate, stockDescription, stockPicture) values(1, '1번물건', 1, date(now()), date(now()), '1번물건입니다', 'null')"; stmt.execute(sql);
			sql="insert into stockList(stockId, stockName, stockSize, productUploadDate, stockUpdateDate, stockDescription, stockPicture) values(2, '2번물건', 2, date(now()), date(now()), '2번물건입니다', 'null')"; stmt.execute(sql);
			sql="insert into stockList(stockId, stockName, stockSize, productUploadDate, stockUpdateDate, stockDescription, stockPicture) values(3, '3번물건', 3, date(now()), date(now()), '3번물건입니다', 'null')"; stmt.execute(sql);
			sql="insert into stockList(stockId, stockName, stockSize, productUploadDate, stockUpdateDate, stockDescription, stockPicture) values(4, '4번물건', 4, date(now()), date(now()), '4번물건입니다', 'null')"; stmt.execute(sql);
			sql="insert into stockList(stockId, stockName, stockSize, productUploadDate, stockUpdateDate, stockDescription, stockPicture) values(5, '5번물건', 5, date(now()), date(now()), '5번물건입니다', 'null')"; stmt.execute(sql);
		} catch (SQLException e) {
			throw new IllegalStateException("making 실패 " + e.getMessage());
		}
	}
	
	@Override
	public void dropTable() {
		String sql = "drop table stockList";
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root",
				""); PreparedStatement stmt = conn.prepareStatement(sql);) {
			stmt.executeUpdate();
		} catch (SQLException e) {
			throw new IllegalStateException("drop 실패 " + e.getMessage());
		}
	}
	
	@Override
	public List<Stock> selectAll(){
		List<Stock> results = new ArrayList<>();

		String sql = "SELECT * FROM stockList ORDER BY stockId";
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kopoctc", "root", "");
				Statement stmt = conn.createStatement();) {
			try (ResultSet rs = stmt.executeQuery(sql)) {
				while (rs.next()) {
					int stockId = rs.getInt(1);
					String stockName = rs.getString(2);
					int stockSize = rs.getInt(3);
					Date productUploadDate = rs.getDate(4);
					Date stockUpdateDate = rs.getDate(5);
					String stockDescription = rs.getString(6);
					String stockPicture = rs.getString(7);

					Stock stock = new Stock();
					stock.setStockId(stockId);
					stock.setStockName(stockName);
					stock.setStockSize(stockSize);
					stock.setProductUploadDate(productUploadDate);
					stock.setStockUpdateDate(stockUpdateDate);
					stock.setStockDescription(stockDescription);
					stock.setStockPicture(stockPicture);
					results.add(stock);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return results;
	}
	
	@Override
	public List<Stock> selectAll(int page, int countPerPage) throws SQLException, ClassNotFoundException {
		List<Stock> results = new ArrayList<>();

		String sql = "SELECT * FROM stockList ORDER BY stockId limit " + (countPerPage * (page - 1)) + ", " + countPerPage + ";";
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kopoctc", "root", "");
				Statement stmt = conn.createStatement();) {
			try (ResultSet rs = stmt.executeQuery(sql)) {
				while (rs.next()) {
					int stockId = rs.getInt(1);
					String stockName = rs.getString(2);
					int stockSize = rs.getInt(3);
					Date productUploadDate = rs.getDate(4);
					Date stockUpdateDate = rs.getDate(5);
					String stockDescription = rs.getString(6);
					String stockPicture = rs.getString(7);

					Stock stock = new Stock();
					stock.setStockId(stockId);
					stock.setStockName(stockName);
					stock.setStockSize(stockSize);
					stock.setProductUploadDate(productUploadDate);
					stock.setStockUpdateDate(stockUpdateDate);
					stock.setStockDescription(stockDescription);
					stock.setStockPicture(stockPicture);
					results.add(stock);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return results;
	}
	
	@Override
	public int getTotalCount() {
		int num = 0;
		String sql = "SELECT count(*) FROM stockList"; // sql문
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kopoctc", "root",
				""); Statement stmt = conn.createStatement();) {
			ResultSet rs = stmt.executeQuery(sql); // ResultSet에 가져온 데이터 저장.
			rs.next();
			num = rs.getInt(1);
		} catch (SQLException e) {
			throw new IllegalStateException("db연결 실패" + e.getMessage());
		}
		return num;
	}
	
	@Override
	public Stock getOne(int stockId) {
		Stock stock = new Stock();
		String sql = "SELECT * FROM stockList where stockId=?";
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kopoctc", "root",
				""); PreparedStatement stmt = conn.prepareStatement(sql);) {
			stmt.setInt(1, stockId);
			try (ResultSet rs = stmt.executeQuery();) {
				rs.next();
				String stockName = rs.getString(2);
				int stockSize = rs.getInt(3);
				Date productUploadDate = rs.getDate(4);
				Date stockUpdateDate = rs.getDate(5);
				String stockDescription = rs.getString(6);
				String stockPicture = rs.getString(7);

				stock.setStockName(stockName);
				stock.setStockSize(stockSize);
				stock.setProductUploadDate(productUploadDate);
				stock.setStockUpdateDate(stockUpdateDate);
				stock.setStockDescription(stockDescription);
				stock.setStockPicture(stockPicture);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stock;
	}
	
}




//@Override
//public void update(int id, String title, String content) {
//	String sql = "UPDATE gongji SET title=?, content=? where id=?";
//	try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kopoctc", "root",
//			""); PreparedStatement stmt = conn.prepareStatement(sql);) {
//		stmt.setString(1, title);
//		stmt.setString(2, content);
//		stmt.setInt(3, id);
//		stmt.executeUpdate();
//	} catch (SQLException e) {
//		throw new IllegalStateException("update 실패" + e.getMessage());
//	}
//
//}
//@Override
//public ScoreItem getOne(int studentid) {
//	ScoreItem scoreItem = new ScoreItem();
//	String sql = "SELECT * FROM examtable4 where studentid=?"; // sql문
//	try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kopoctc", "root",
//			""); PreparedStatement stmt = conn.prepareStatement(sql);) {
//		stmt.setInt(1, studentid);
//		try (ResultSet rs = stmt.executeQuery();) {
//			rs.next();
//			scoreItem.setName(rs.getString("name"));
//			scoreItem.setStudentId(rs.getInt("studentid"));
//			scoreItem.setKor(rs.getInt("kor"));
//			scoreItem.setEng(rs.getInt("eng"));
//			scoreItem.setMat(rs.getInt("mat"));
//		}
//	} catch (SQLException e) {
//		e.printStackTrace();
//		// throw new IllegalStateException("db연결 실패" + e.getMessage());
//	}
//	return scoreItem;
//}
//

//
//

//
//@Override
//public void insert(ScoreItem scoreItems) {
//	// PreparedStatement를 쓰면 여러번 지우고 쓸 때 빠르다.
//	// 동적 쿼리 생성
//	String sql = "INSERT INTO examtable4 VALUES (?, ?, ?, ?, ?)";
//	try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kopoctc", "root",
//			""); PreparedStatement stmt = conn.prepareStatement(sql);) {
//		stmt.setString(1, scoreItems.getName());
//		stmt.setInt(2, scoreItems.getStudentId());
//		stmt.setInt(3, scoreItems.getKor());
//		stmt.setInt(4, scoreItems.getEng());
//		stmt.setInt(5, scoreItems.getMat());
//		// execute가 아니라 executeUpdate 쓰면 결과를 리턴받는다.
//		stmt.executeUpdate();
//	} catch (SQLException e) {
//		throw new IllegalStateException("insert 실패" + e.getMessage());
//	}
//}
//

//
