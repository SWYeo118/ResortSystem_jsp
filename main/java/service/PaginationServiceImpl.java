package service;

import dto.Pagination;

public class PaginationServiceImpl implements PaginationService {

	@Override
	public Pagination getPagination(int currentPage, int countPerPage, int pageSize, int totalCount) {
		Pagination pagination = new Pagination();
		// 현재페이지, 페이지당 글 수, 총 페이지 갯수, 총 글 수
		
		// 총페이지 계산
		// 총 페이지는 = 총 글 수 / 페이지당 글 수
		// 반올림규칙 적용해주고, 0 ~ 4라서 반올림이 되지 않는 경우에는 1을 더해준다.
		int totalPage = (int) Math.ceil(totalCount / (double) countPerPage);
		if (totalPage != Math.ceil(totalCount / (double) countPerPage)) {
			totalPage++;
		}

		// 현재페이지에 불가능한 값을 넣었을 경우 처리
		if (currentPage > totalPage) {
			currentPage = totalPage;
		}
		if (currentPage < 1) {
			currentPage = 1;
		}

		// 페이지 묶음의 시작과 끝 페이지
		// 시작페이지 정의
		int startPage;
		
		// 현재페이지 / 페이지사이즈(페이지 크기)가 나누어 떨어지면 시작페이지는
		// 만약 현재페이지가 10이고 페이지사이즈가 10이면, 9 / 10 * 10 + 1 으로 1이 되고
		if (currentPage % pageSize == 0) {
			startPage = ((currentPage - 1) / pageSize) * pageSize + 1;
		} else { // 그렇지 않으면 11이 된다.
			startPage = (currentPage / pageSize) * pageSize + 1;
		} // 마지막 페이지는 시작페이지 번호 + 페이지 사이즈 - 1
		int lastPage = startPage + pageSize - 1;

		// 만약 끝 값이 총 페이지보다 크다면 총페이지만 나오도록

		if (lastPage > totalPage) {
			lastPage = totalPage;
		}

		// 이전 페이지열 계산
		int pPage;
		if (startPage == 1) {
			pPage = 1;
		} else {
			pPage = startPage - 1;
		}

		// 다음 페이지열 계산
		int nPage;
		if (lastPage == totalPage) {
			nPage = totalPage;
		} else {
			nPage = lastPage + 1;
		}

		// ppPage : 제일 처음 페이지
		int ppPage = 1;

		// nnPage : 제일 마지막 페이지
		int nnPage = (int) Math.ceil((double) totalCount / pageSize);

		pagination.setPpPage(ppPage);
		pagination.setpPage(pPage);
		pagination.setnPage(nPage);
		pagination.setNnPage(nnPage);
		pagination.setcPage(currentPage);
		pagination.setStartPage(startPage);
		pagination.setLastPage(lastPage);
		pagination.setTotalPage(totalPage);
		pagination.setCountPerPage(countPerPage);
		pagination.setTotalCount(totalCount);
		pagination.setPageSize(pageSize);

		return pagination;
	}
	
	
}
