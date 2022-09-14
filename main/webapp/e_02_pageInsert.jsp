<%@page import="dao.NoticeDao"%>
<%@page import="dao.NoticeDaoImpl"%>
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
NoticeDao noticedao = new NoticeDaoImpl();
LocalDate now = LocalDate.now();
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
String formatDate = now.format(formatter);
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root", "");
Statement stmt = conn.createStatement();
String titleTmp = request.getParameter("title");
String contentTmp = request.getParameter("content");
stmt.execute("insert into gongji (title, date, content, viewingCount, replyLevel, replyViewOrder, originalPostId) values('"+ titleTmp + "','" + formatDate + "','" + contentTmp + "', 0, 0, 0, 0);");
int maxId = noticedao.getMax();
stmt.execute("update gongji SET originalPostId='" + maxId + "' where id ='" + maxId + "';");
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
