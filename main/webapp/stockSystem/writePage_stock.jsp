<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ServletContext context = getServletContext();
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
</SCRIPT>
<meta charset="UTF-8">
</head>
<body>
<center>
	<FORM METHOD=POST action='insertPage_stock.jsp' enctype="multipart/form-data">
		<table width=650 border=1 cellspacing=0 cellpadding=5 style="margin-left:auto; margin-right:auto;">
			<tr>
				<td><b>상품번호</b></td>
				<td><input type=number name=stockId required></td>
			</tr>
			<tr>
				<td><b>상품명</b></td>
				<td><input type=text name=stockName pattern="[가-힣a-zA-Z0-9]{1,70}" title="특수문자는 사용할 수 없습니다" size=70 maxlength=70 required></td>
			</tr>
			<tr>
				<td><b>재고 현황</b></td>
				<td><input type=number name=stockSize required></td>
			</tr>
			<tr>
				<td><b>상품등록일</b></td>
				<td><c:out value="${formatDate}" /></td>
			</tr>
			<tr>
				<td><b>재고파악일</b></td>
				<td><c:out value="${formatDate}" /></td>
			</tr>
			<tr>
				<td><b>상품설명</b></td>
				<td><textarea style='width:500px; height:250px;' name=stockDescription required></textarea></td>
			</tr>
				<tr>
				<td><b>상품사진</b></td>
				<td><input type=file name=stockPicture ></td>
			</tr>
		</table>
<table width=650>
<tr>
	<td width=600></td>
	<td><input type=button value="취소" OnClick="location.href='listPage_stock.jsp'" style="margin: auto;"></td>
	<td><input type=submit value="쓰기" style="margin: auto;"></td>
</tr>
</table>
</FORM>
</center>
</body>
</html>