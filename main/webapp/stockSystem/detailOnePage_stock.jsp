<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.Stock"%>
<%@page import="dao.StockDao"%>
<%@page import="dao.StockDaoImpl"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.*,java.sql.*,javax.sql.*,java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
ServletContext context = getServletContext();
StockDao stockdao = new StockDaoImpl();
List<Stock> stockDatas = stockdao.selectAll();
String key = request.getParameter("key");
int keyNum = Integer.parseInt(key);
String stockName = stockdao.getOne(keyNum).getStockName();
int stockSize = stockdao.getOne(keyNum).getStockSize();
Date productUploadDate = stockdao.getOne(keyNum).getProductUploadDate();
Date stockUpdateDate = stockdao.getOne(keyNum).getStockUpdateDate();
String stockDescription = stockdao.getOne(keyNum).getStockDescription();
String stockPicture = stockdao.getOne(keyNum).getStockPicture();

context.setAttribute("keyNum", keyNum);
context.setAttribute("stockName", stockName);
context.setAttribute("stockSize", stockSize);
context.setAttribute("productUploadDate", productUploadDate);
context.setAttribute("stockUpdateDate", stockUpdateDate);
context.setAttribute("stockDescription", stockDescription);
context.setAttribute("stockPicture", stockPicture);
%>
<!DOCTYPE html>
<html>
<head>
<SCRIPT LANGUAGE="JavaScript">
</SCRIPT>
<meta charset="UTF-8">
</head>
<body>
	<FORM METHOD=POST name='fm'>
		<table width=650 border=1 cellspacing=0 cellpadding=5 style="margin-left:auto; margin-right:auto;">
			<tr>
				<td><b>상품번호</b></td>
				<td><c:out value="${keyNum}" /></td>
			</tr>
			<tr>
				<td><b>상품명</b></td>
				<td><c:out value="${stockName}" /></td>
			</tr>
			<tr>
				<td><b>재고 현황</b></td>
				<td><c:out value="${stockSize}" /></td>
			</tr>
			<tr>
				<td><b>상품등록일</b></td>
				<td><c:out value="${productUploadDate}" /></td>
			</tr>
			<tr>
				<td><b>재고파악일</b></td>
				<td><c:out value="${stockUpdateDate}" /></td>
			</tr>
			<tr>
				<td><b>상품설명</b></td>
				<td><textarea style='width:500px; height:250px;' name=stockDescription readonly>${stockDescription}</textarea></td>
			</tr>
				<tr>
				<td><b>상품사진</b></td>
				<td><img src="${stockPicture}"></td>
			</tr>
		</table>
		<table width=650 style="margin-left:auto; margin-right:auto;">
			<tr>
				<td width=600></td>
				<td><input type=button value="목록"
					OnClick="location.href='listPage_stock.jsp'"></td>
				<td><input type=button value="수정"
					OnClick="location.href='updatePage_stock.jsp?key=${keyNum}'"></td>
			</tr>
		</table>
	</FORM>
</body>
</html>