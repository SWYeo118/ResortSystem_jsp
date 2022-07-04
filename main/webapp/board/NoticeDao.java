package kr.ac.kopo.ctc.kopo25.dao;

import java.util.List;

import kr.ac.kopo.ctc.kopo25.dto.Notice;

public interface NoticeDao {

	void makingTable();
	void dropTable();
	List<Notice> selectAll();
	int getTotalCount();
	Notice getOne(int id);

}
