package dto;

import java.util.Date;

public class Stock {
	private int stockId;
	private String stockName;
	private int stockSize;
	private Date productUploadDate;
	private Date stockUpdateDate;
	private String stockDescription;
	private String stockPicture;
	public int getStockId() {
		return stockId;
	}
	public void setStockId(int stockId) {
		this.stockId = stockId;
	}
	public String getStockName() {
		return stockName;
	}
	public void setStockName(String stockName) {
		this.stockName = stockName;
	}
	public int getStockSize() {
		return stockSize;
	}
	public void setStockSize(int stockSize) {
		this.stockSize = stockSize;
	}
	public Date getProductUploadDate() {
		return productUploadDate;
	}
	public void setProductUploadDate(Date productUploadDate) {
		this.productUploadDate = productUploadDate;
	}
	public Date getStockUpdateDate() {
		return stockUpdateDate;
	}
	public void setStockUpdateDate(Date stockUpdateDate) {
		this.stockUpdateDate = stockUpdateDate;
	}
	public String getStockDescription() {
		return stockDescription;
	}
	public void setStockDescription(String stockDescription) {
		this.stockDescription = stockDescription;
	}
	public String getStockPicture() {
		return stockPicture;
	}
	public void setStockPicture(String stockPicture) {
		this.stockPicture = stockPicture;
	}
	
}
