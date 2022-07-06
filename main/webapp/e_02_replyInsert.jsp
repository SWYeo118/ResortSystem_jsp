<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
LocalDate now = LocalDate.now();
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
String formatDate = now.format(formatter);
String bar;
String barSum = "";
String replyTitle = "";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root", "CJDghd9311@");
Statement stmt = conn.createStatement();
String replyContent = request.getParameter("replyContent");
String originalPostId = request.getParameter("originalPostId");
String replyLevel = request.getParameter("replyLevel");
int replyLevelInt = Integer.parseInt(replyLevel);
String replyViewOrder = request.getParameter("replyViewOrder");
String title = request.getParameter("replyTitle");
if(replyLevelInt >= 2) {
	for(int i = 0; i < replyLevelInt - 1; i++) {
		bar = "↳";
		barSum += bar;
	}
	replyTitle = "↳" + barSum + title;
} else {
	replyTitle = "↳" + title;
}

stmt.execute("insert into gongji (title, date, content, viewingCount, replyViewOrder, originalPostId, replyLevel) values('"+ replyTitle + "','" + formatDate + "','" + replyContent + "', 0, '" + replyViewOrder + "', '" + originalPostId + "', '" + replyLevel + "');");	
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