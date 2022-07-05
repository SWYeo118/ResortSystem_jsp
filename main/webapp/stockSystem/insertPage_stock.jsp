<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page errorPage="errorDuplicatedKey.jsp" %>
<%
String path = "/Users/sangwoo/eclipse-workspace/Eclipse_web/src/main/webapp/stockSystem/stockPhotos/";
int size = 1024 * 1024 * 20; // 20MB
String str, filename, original_filename;

String imageAdd = "";
MultipartRequest multiRequest = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
String stockId = multiRequest.getParameter("stockId");
String stockName = multiRequest.getParameter("stockName");
String stockSize = multiRequest.getParameter("stockSize");
String stockDescription = multiRequest.getParameter("stockDescription");
String stockPicture = multiRequest.getParameter("stockPicture");

Enumeration files = multiRequest.getFileNames();
str = (String)files.nextElement();
filename = multiRequest.getFilesystemName(str);
original_filename = multiRequest.getOriginalFileName(str);
imageAdd = "/Eclipse_web/stockSystem/stockPhotos/" + filename;

LocalDate now = LocalDate.now();
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
String formatDate = now.format(formatter);

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root", "CJDghd9311@");
Statement stmt = conn.createStatement();

stmt.execute("insert into stockList (stockId, stockName, stockSize, productUploadDate, stockUpdateDate, stockDescription, stockPicture) values ('"+ stockId + "','" + stockName + "','" + stockSize + "','" +  formatDate +  "','" + formatDate + "','" + stockDescription + "','" + imageAdd + "');");	
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