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

import dto.Notice;

public class NoticeDaoImpl implements NoticeDao {

	public NoticeDaoImpl() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // jdbc Driver에 연결
		} catch (ClassNotFoundException e) {
			throw new IllegalStateException("jdbc 드라이버 로드 실패" + e); // 연결 실패 시 에러메세지
		}
	}
	@Override
	public void makingTable() {
		
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root",
				"CJDghd9311@");) {
			String sql = "create table gongji(id int not null primary key auto_increment, title varchar(70), date date, content text)DEFAULT CHARSET=utf8";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();
			   sql="insert into gongji(title, date, content) values('공지사항1',date(now()),'공지사항내용1')"; stmt.execute(sql);
			   sql="insert into gongji(title, date, content) values('공지사항2',date(now()),'공지사항내용2')"; stmt.execute(sql);
			   sql="insert into gongji(title, date, content) values('공지사항3',date(now()),'공지사항내용3')"; stmt.execute(sql);
			   sql="insert into gongji(title, date, content) values('공지사항4',date(now()),'공지사항내용4')"; stmt.execute(sql);
			   sql="insert into gongji(title, date, content) values('공지사항5',date(now()),'공지사항내용5')"; stmt.execute(sql);
		} catch (SQLException e) {
			throw new IllegalStateException("making 실패 " + e.getMessage());
		}
	}
	
	@Override
	public void dropTable() {
		String sql = "drop table gongji";
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root",
				"CJDghd9311@"); PreparedStatement stmt = conn.prepareStatement(sql);) {
			stmt.executeUpdate();
		} catch (SQLException e) {
			throw new IllegalStateException("drop 실패 " + e.getMessage());
		}
	}
	
	@Override
	public List<Notice> selectAll(){
		List<Notice> results = new ArrayList<>();

		String sql = "SELECT * FROM gongji ORDER BY id DESC";
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kopoctc", "root", "CJDghd9311@");
				Statement stmt = conn.createStatement();) {
			try (ResultSet rs = stmt.executeQuery(sql)) {
				while (rs.next()) {
					int id = rs.getInt(1);
					String title = rs.getString(2);
					Date date = rs.getDate(3);
					String content = rs.getString(4);
					int originalPostId = rs.getInt(5);
					int replyLevel = rs.getInt(6);
					int replyViewOrder = rs.getInt(7);
					int viewingCount = rs.getInt(8);

					Notice notice = new Notice();
					notice.setId(id);
					notice.setTitle(title);
					notice.setDate(date);
					notice.setContent(content);
					notice.setOriginalPostId(originalPostId);
					notice.setReplyLevel(replyLevel);
					notice.setReplyViewOrder(replyViewOrder);
					notice.setViewingCount(viewingCount);
					results.add(notice);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return results;
	}
	
	@Override
	public List<Notice> selectAll(int page, int countPerPage) throws SQLException, ClassNotFoundException {
		List<Notice> results = new ArrayList<>();

		String sql = "SELECT * FROM gongji ORDER BY originalPostId DESC, replyViewOrder ASC limit " + (countPerPage * (page - 1)) + ", " + countPerPage + ";";
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kopoctc", "root", "CJDghd9311@");
				Statement stmt = conn.createStatement();) {
			try (ResultSet rs = stmt.executeQuery(sql)) {
				while (rs.next()) {
					int id = rs.getInt(1);
					String title = rs.getString(2);
					Date date = rs.getDate(3);
					String content = rs.getString(4);
					int originalPostId = rs.getInt(5);
					int replyLevel = rs.getInt(6);
					int replyViewOrder = rs.getInt(7);
					int viewingCount = rs.getInt(8);

					Notice notice = new Notice();
					notice.setId(id);
					notice.setTitle(title);
					notice.setDate(date);
					notice.setContent(content);
					notice.setOriginalPostId(originalPostId);
					notice.setReplyLevel(replyLevel);
					notice.setReplyViewOrder(replyViewOrder);
					notice.setViewingCount(viewingCount);
					results.add(notice);
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
		String sql = "SELECT count(*) FROM gongji"; // sql문
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kopoctc", "root",
				"CJDghd9311@"); Statement stmt = conn.createStatement();) {
			ResultSet rs = stmt.executeQuery(sql); // ResultSet에 가져온 데이터 저장.
			rs.next();
			num = rs.getInt(1);
		} catch (SQLException e) {
			throw new IllegalStateException("db연결 실패" + e.getMessage());
		}
		return num;
	}
	
	@Override
	public Notice getOne(int id) {
		Notice notice = new Notice();
		String sql = "SELECT * FROM gongji where id=?";
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kopoctc", "root",
				"CJDghd9311@"); PreparedStatement stmt = conn.prepareStatement(sql);) {
			stmt.setInt(1, id);
			try (ResultSet rs = stmt.executeQuery();) {
				rs.next();
				String title = rs.getString(2);
				Date date = rs.getDate(3);
				String content = rs.getString(4);
				int originalPostId = rs.getInt(5);
				int replyLevel = rs.getInt(6);
				int replyViewOrder = rs.getInt(7);
				int viewingCount = rs.getInt(8);

				notice.setTitle(title);
				notice.setDate(date);
				notice.setContent(content);
				notice.setOriginalPostId(originalPostId);
				notice.setReplyLevel(replyLevel);
				notice.setReplyViewOrder(replyViewOrder);
				notice.setViewingCount(viewingCount);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return notice;
	}
	@Override
	public int getMax() {
		int num = 0;
		String sql = "SELECT MAX(id) FROM gongji"; // sql문
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kopoctc", "root",
				"CJDghd9311@"); Statement stmt = conn.createStatement();) {
			ResultSet rs = stmt.executeQuery(sql); // ResultSet에 가져온 데이터 저장.
			rs.next();
			num = rs.getInt(1);
		} catch (SQLException e) {
			throw new IllegalStateException("db연결 실패" + e.getMessage());
		}
		return num;
	}
	@Override
	public int getReplyViewOrders(int originalPostId) {
		Notice notice = new Notice();
		int num1 = 0;
		String sql = "SELECT MAX(replyViewOrder) FROM gongji where originalPostId=?";
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kopoctc", "root",
				"CJDghd9311@"); PreparedStatement stmt = conn.prepareStatement(sql);) {
			stmt.setInt(1, originalPostId);
			try (ResultSet rs = stmt.executeQuery();) {
				rs.next();
				num1 = rs.getInt(1);
				notice.setOriginalPostId(num1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num1;
	}
}




//@Override
//public void update(int id, String title, String content) {
//	String sql = "UPDATE gongji SET title=?, content=? where id=?";
//	try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kopoctc", "root",
//			"CJDghd9311@"); PreparedStatement stmt = conn.prepareStatement(sql);) {
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
//			"CJDghd9311@"); PreparedStatement stmt = conn.prepareStatement(sql);) {
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
//			"CJDghd9311@"); PreparedStatement stmt = conn.prepareStatement(sql);) {
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
