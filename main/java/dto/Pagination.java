package dto;

public class Pagination {
	private Pagination pagination;

	private int countPerPage;	// 한 페이지에 나올 숫자 목록
	private int pageSize;	// 한 페이지의 글 수
	private int totalCount;	// 전채 글의 수
	private int totalPage;	// 전체 페이지의 수
	private int lastPage;	// 현재 쪽에서 마지막 페이지의 번호
	private int startPage;	// 현재 쪽에서 첫 페이지의 번호
	private int ppPage;	// << 첫페이지로
	private int pPage;	// < 이전 페이지로
	private int nnPage; // >> 마지막 페이지로
	private int nPage;	// > 다음 페이지로
	private int cPage;	// 현재 페이지
	
	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}

	public int getCountPerPage() {
		return countPerPage;
	}

	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getPpPage() {
		return ppPage;
	}

	public void setPpPage(int ppPage) {
		this.ppPage = ppPage;
	}

	public int getpPage() {
		return pPage;
	}

	public void setpPage(int pPage) {
		this.pPage = pPage;
	}

	public int getNnPage() {
		return nnPage;
	}

	public void setNnPage(int nnPage) {
		this.nnPage = nnPage;
	}

	public int getnPage() {
		return nPage;
	}

	public void setnPage(int nPage) {
		this.nPage = nPage;
	}

	public int getcPage() {
		return cPage;
	}

	public void setcPage(int cPage) {
		this.cPage = cPage;
	}
}
