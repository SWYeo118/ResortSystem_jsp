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
String title = noticedao.getOne(keyNum).getTitle();
Date date = noticedao.getOne(keyNum).getDate();
String content = noticedao.getOne(keyNum).getContent();
context.setAttribute("key", key);
context.setAttribute("keyNum", keyNum);
context.setAttribute("noticeDatas", noticeDatas);
context.setAttribute("title", title);
context.setAttribute("date", date);
context.setAttribute("content", content);
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
				<td><b>번호</b></td>
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
				<td><b>내용</b></td>
				<td><c:out value="${content}" /></td>
			</tr>
		</table>
		<table width=650 style="margin: auto;">
			<tr>
				<td width=600></td>
				<td><input type=button value="목록"
					OnClick="location.href='listPage_gongji.jsp'"></td>
				<td><input type=button value="수정"
					OnClick="location.href='updatePage_gongji.jsp?key=${keyNum}'"></td>
			</tr>
		</table>
	</FORM>
</center>
</body>
</html>