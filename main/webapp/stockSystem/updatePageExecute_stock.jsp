<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
ServletContext context = getServletContext();
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root", "CJDghd9311@");
Statement stmt = conn.createStatement();

String key = request.getParameter("stockId");
int keyNum = Integer.parseInt(key);
String stockName = request.getParameter("stockName");
String stockSize = request.getParameter("stockSize");
String productUploadDate = request.getParameter("productUploadDate");
String stockUpdateDate = request.getParameter("stockUpdateDate");
String stockDescription = request.getParameter("stockDescription");
String stockPicture = request.getParameter("stockPicture");

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

stmt.execute("UPDATE stockList SET stockUpdateDate='"+ stockUpdateDate + "', stockSize='"+ stockSize + "' where stockId = " + keyNum + ";");
stmt.close();
conn.close();
%>

<!DOCTYPE html>
<html>
<head>
<SCRIPT LANGUAGE="JavaScript">
</SCRIPT>
<meta charset="UTF-8">
</head>
<body>
<jsp:forward page="listPage_stock.jsp" />
</body>
</html>