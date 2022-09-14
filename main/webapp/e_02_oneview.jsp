<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.*,java.sql.*,javax.sql.*,java.io.*"%>
<%@page import="dao.NoticeDaoImpl"%>
<%@page import="dao.NoticeDao"%>
<%@page import="dto.Notice"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
ServletContext context = getServletContext();
NoticeDao noticedao = new NoticeDaoImpl();
List<Notice> noticeDatas = noticedao.selectAll();
String key = request.getParameter("key");
int keyNum = Integer.parseInt(key);

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kopoctc", "root", "");
Statement stmt = conn.createStatement();
stmt.execute("UPDATE gongji SET viewingCount = viewingCount + 1 where id=" + keyNum + ";");

String title = noticedao.getOne(keyNum).getTitle();
Date date = noticedao.getOne(keyNum).getDate();
String content = noticedao.getOne(keyNum).getContent();
int viewingCount = noticedao.getOne(keyNum).getViewingCount();
int originalPostId = noticedao.getOne(keyNum).getOriginalPostId();
int replyLevel = noticedao.getOne(keyNum).getReplyLevel();
int replyViewOrder = noticedao.getOne(keyNum).getReplyViewOrder();
context.setAttribute("key", key);
context.setAttribute("keyNum", keyNum);
context.setAttribute("noticeDatas", noticeDatas);
context.setAttribute("title", title);
context.setAttribute("date", date);
context.setAttribute("content", content);
context.setAttribute("viewingCount", viewingCount);
context.setAttribute("originalPostId", originalPostId);
context.setAttribute("replyLevel", replyLevel);
context.setAttribute("replyViewOrder", replyViewOrder);
%>
<!DOCTYPE html>
<html>
<head>
<SCRIPT LANGUAGE="JavaScript">
</SCRIPT>
<meta charset="UTF-8">
</head>
<body>
<center>
	<FORM METHOD=POST name='fm'>
		<table width=650 border=1 cellspacing=0 cellpadding=5>
			<tr>
				<td width=170><b>번호</b></td>
				<td><c:out value="${keyNum}" /></td>
			</tr>
			<tr>
				<td><b>제목</b></td>
				<td><c:out value="${title}" /></td>
			</tr>
			<tr>
				<td><b>일자</b></td>
				<td><c:out value="${date}" /></td>
			</tr>
			<tr>
				<td><b>조회수</b></td>
				<td><c:out value="${viewingCount}" /></td>
			</tr>
			<tr>
				<td><b>내용</b></td>
				<td><textarea style='width:500px; height:250px;' name=content readonly>${content}</textarea></td>
			</tr>
			<tr>
				<td><b>원글번호</b></td>
				<td><c:out value="${originalPostId}" /></td>
			</tr>
			<tr>
				<td><b>대댓글 확인번호</b></td>
				<td><c:out value="${replyLevel}" /></td>
			</tr>
			<tr>
				<td><b>댓글 배치번호</b></td>
				<td><c:out value="${replyViewOrder}" /></td>
			</tr>
		</table>
		<table width=650 style="margin: auto;">
			<tr>
				<td width=600></td>
				<td><input type=button value="목록"
					OnClick="location.href='e_02.jsp'"></td>
				<td><input type=button value="수정"
					OnClick="location.href='e_02_update.jsp?key=${keyNum}'"></td>
				<td><input type=button value="삭제" 
					OnClick="location.href='e_02_delete.jsp?key=${keyNum}'"></td>
				<td><input type=button value="댓글"
				 	OnClick="location.href='e_02_replyWrite.jsp?key=${keyNum}'"></td>
			</tr>
		</table>
	</FORM>
</center>
</body>
</html>
