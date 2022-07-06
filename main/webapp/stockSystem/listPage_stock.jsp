<%@page import="dao.StockDaoImpl"%>
<%@page import="dao.StockDao"%>
<%@page import="dto.Stock"%>
<%@page import="dto.Pagination"%>
<%@page import="service.PaginationService"%>
<%@page import="service.PaginationServiceImpl"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.*,java.sql.*,javax.sql.*,java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ServletContext context = getServletContext();
Stock stock = new Stock();
Pagination pagination = new Pagination();
StockDao stockdao = new StockDaoImpl();
PaginationService paginationImpl = new PaginationServiceImpl();

String cPage = request.getParameter("cPage");
 
if (cPage == null || "null".equals(cPage)) {
    cPage = "1";
  }
int cPageInt = Integer.parseInt(cPage);
List<Stock> stockDatas = stockdao.selectAll();
List<Stock> stockDatasPage = stockdao.selectAll(cPageInt, 10);
int totalCount = stockdao.getTotalCount();
Pagination paginationDatas = paginationImpl.getPagination(cPageInt, 10, 10, totalCount);

pageContext.setAttribute("stockDatasPage", stockDatasPage);
pageContext.setAttribute("paginationDatas", paginationDatas);
%>
<!DOCTYPE html>
<html>
<head>
<style>
a {
	  text-decoration-line: none;
}
</style>

<SCRIPT LANGUAGE="JavaScript">
</SCRIPT>
<meta charset="UTF-8">
</head>
<body>
<center>
	<table cellspacing=1 cellpadding=1 width=700 border=1>
		<tr>
			<td width=100><p align=center>상품번호</p></td>
			<td width=350><p align=center>상품명</p></td>
			<td width=160><p align=center>현재 재고 수</p></td>
			<td width=160><p align=center>재고파악일</p></td>
			<td width=160><p align=center>상품등록일</p></td>
		</tr>
		<c:forEach var="stockData" items="${stockDatasPage}">
			<tr>
				<td width=100><p align=center><c:out value="${stockData.stockId}" /></p></td>
				<td width=300><p align=center><a href='detailOnePage_stock.jsp?key=${stockData.stockId}'><c:out value="${stockData.stockName}" /></a></p></td>
				<td width=100><p align=center><c:out value="${stockData.stockSize}" /></p></td>
				<td width=170><p align=center><c:out value="${stockData.stockUpdateDate}" /></p></td>
				<td width=170><p align=center><c:out value="${stockData.productUploadDate}" /></p></td>
			</tr>
		</c:forEach>
	</table>
	<table width=650>
		<tr>
			<td width=550></td>
			<td><input type=button value="신규"
				OnClick="window.location='writePage_stock.jsp'"></td>
		</tr>
	</table>
		<div class="text-center">
		<c:url var="urlppPage" value="/stockSystem/listPage_stock.jsp" >
			<c:param name="cPage" value="${paginationDatas.ppPage}"/>
		</c:url>
		
		<c:url var="urlpPage" value="/stockSystem/listPage_stock.jsp">
			<c:param name="cPage" value="${paginationDatas.pPage}"/>
		</c:url>
		
		<c:url var="urlnnPage" value="/stockSystem/listPage_stock.jsp">
			<c:param name="cPage" value="${paginationDatas.nnPage}"/>
		</c:url>
		
		<c:url var="urlnPage" value="/stockSystem/listPage_stock.jsp">
			<c:param name="cPage" value="${paginationDatas.nPage}"/>
		</c:url>
		
		<!-- ne는 not equal, 즉 !=의 의미이다. -->
		<c:if test="${ppPage ne 0 && pPage ne 0}">
		  <a href=<c:out value="${urlppPage}"/>><c:out value="<<"/></a>
		  <a href=<c:out value="${urlppPage}"/>><c:out value="<"/></a>
		</c:if>
		
		<c:forEach var="i" begin="${paginationDatas.startPage}" end="${paginationDatas.lastPage}">
		  <b><a href = 'listPage_stock.jsp?cPage=${i}'>&nbsp${i}&nbsp</a></b>
		</c:forEach>
		      
		<c:if test="${nnPage ne 0 && nPage ne 0}">
			<a href=<c:out value="${urlnPage}"/>><c:out value="    >    "/></a>
			<a href=<c:out value="${urlnnPage}"/>><c:out value="    >>    "/></a>
		</c:if>
		</center>
	</div>
	
</body>
</html>