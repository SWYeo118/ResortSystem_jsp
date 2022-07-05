<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="dto.Stock"%>
<%@page import="dao.StockDao"%>
<%@page import="dao.StockDaoImpl"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
LocalDate now = LocalDate.now();
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
String formatDate = now.format(formatter);
context.setAttribute("formatDate", formatDate);
%>
<!DOCTYPE html>
<html>
<head>
<style>
textarea {
	  resize: none;
}
</style>
<SCRIPT LANGUAGE="JavaScript">
function submitForm(mode) {
	if (mode == "update"){
		document.fm.action = "updatePageExecute_stock.jsp";
	} else if (mode == "delete"){ 
		document.fm.action = "deletePage_stock.jsp";
	}
	fm.submit();
}
</SCRIPT>
<meta charset="UTF-8">
</head>
<body>
<FORM METHOD=POST name='fm'>
		<table width=650 border=1 cellspacing=0 cellpadding=5 style="margin-left:auto; margin-right:auto;">
			<tr>
				<td><b>상품번호</b></td>
				<td><input type=hidden name=stockId value="${keyNum}" readonly>${keyNum}</td>
			</tr>
			<tr>
				<td><b>상품명</b></td>
				<td><input type=hidden name=stockName pattern="[가-힣a-zA-Z0-9]{1,70}" title="특수문자는 사용할 수 없습니다" size=70 maxlength=70 value="${stockName}" readonly>${stockName}</td>
			</tr>
			<tr>
				<td><b>재고 현황</b></td>
				<td><input type=number name=stockSize value="${stockSize}" min="0" required></td>
			</tr>
			<tr>
				<td><b>상품등록일</b></td>
				<td><input type=hidden name=productUploadDate value="${productUploadDate}" readonly>${productUploadDate}</td>
			</tr>
			<tr>
				<td><b>재고파악일</b></td>
				<td><input type=hidden name=stockUpdateDate value="${formatDate}" readonly>${formatDate}</td>
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
<table width=650>
<tr>
	<td width=600></td>
	<td><input type=button value="취소" OnClick="location.href='listPage_stock.jsp'"></td>
	<td><input type=button value="확인" OnClick="submitForm('update')"></td>
	<td><input type=button value="삭제" OnClick="submitForm('delete')"></td>
</tr>
</table>
</FORM>
</body>
</html>