<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
LocalDate now = LocalDate.now();
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
String formatDate = now.format(formatter);
ServletContext context = getServletContext();
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
<FORM METHOD=POST action='insertPage_gongji.jsp'>
<table width=650 border=1 cellspacing=0 cellpadding=5 >
<tr>
	<td><b>번호</b></td>
	<td>신규(insert)<input type=hidden name=id value='INSERT'></td>
</tr>
<tr>
	<td><b>제목</b></td>
	<td><input type=text name=title pattern="[가-힣a-zA-Z]{1,70}" title="특수문자는 사용할 수 없습니다" size=70 maxlength=70 required></td>
</tr>
<tr>
	<td><b>일자</b></td>
	<td>${formatDate}</td>
</tr>
<tr>
	<td><b>내용</b></td>
	<td><textarea style='width:500px; height:250px;' name=content required></textarea></td>
</tr>
</table>
<table width=650>
<tr>
	<td width=600></td>
	<td><input type=button value="취소" OnClick="location.href='listPage_gongji.jsp'" style="margin: auto;"></td>
	<td><input type=submit value="쓰기" style="margin: auto;"></td>
</tr>
</table>
</FORM>
</center>
</body>
</html>