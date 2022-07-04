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
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root", "CJDghd9311@");
Statement stmt = conn.createStatement();
String titleTmp = request.getParameter("title");
String contentTmp = request.getParameter("content");
context.setAttribute("titleTmp", titleTmp);
context.setAttribute("contentTmp", contentTmp);
stmt.execute("insert into gongji (title, date, content) values('"+ titleTmp + "','" + formatDate + "','" + contentTmp + "');");	
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
<jsp:forward page="listPage_gongji.jsp" />
</body>
</html>