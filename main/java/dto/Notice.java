package dto;

import java.util.Date;

public class Notice {
	private int id;
	private String title;
	private Date date;
	private String content;
	private int originalPostId;
	private int replyLevel;
	private int replyViewOrder;
	private int viewingCount;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getOriginalPostId() {
		return originalPostId;
	}
	public void setOriginalPostId(int originalPostId) {
		this.originalPostId = originalPostId;
	}
	public int getReplyLevel() {
		return replyLevel;
	}
	public void setReplyLevel(int replyLevel) {
		this.replyLevel = replyLevel;
	}
	public int getReplyViewOrder() {
		return replyViewOrder;
	}
	public void setReplyViewOrder(int replyViewOrder) {
		this.replyViewOrder = replyViewOrder;
	}
	public int getViewingCount() {
		return viewingCount;
	}
	public void setViewingCount(int viewingCount) {
		this.viewingCount = viewingCount;
	}
	
}
