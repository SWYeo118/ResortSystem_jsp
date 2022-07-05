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
String id = request.getParameter("id");
String titleTmp = request.getParameter("title");
String contentTmp = request.getParameter("content");
context.setAttribute("titleTmp", titleTmp);
context.setAttribute("contentTmp", contentTmp);
context.setAttribute("id", id);
stmt.execute("UPDATE gongji SET title='"+ titleTmp + "',content='" + contentTmp + "' where id = " + id + ";");
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
<jsp:forward page="e_02.jsp" />
</body>
</html>