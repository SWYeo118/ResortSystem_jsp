package service;

import dto.Pagination;

public interface PaginationService {
	Pagination getPagination(int currentPage, int countPerPage, int pageSize, int totalCount);
}
