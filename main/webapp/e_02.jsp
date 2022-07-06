<%@page import="dto.Pagination"%>
<%@page import="service.PaginationService"%>
<%@page import="service.PaginationServiceImpl"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.*,java.sql.*,javax.sql.*,java.io.*"%>
<%@page import="dao.NoticeDaoImpl"%>
<%@page import="dao.NoticeDao"%>
<%@page import="dto.Notice"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ServletContext context = getServletContext();
Notice notice = new Notice();
Pagination pagination = new Pagination();
NoticeDao noticedao = new NoticeDaoImpl();
PaginationService paginationImpl = new PaginationServiceImpl();

String cPage = request.getParameter("cPage");
 
if (cPage == null || "null".equals(cPage)) {
    cPage = "1";
  }
int cPageInt = Integer.parseInt(cPage);
List<Notice> noticeDatasPage = noticedao.selectAll(cPageInt, 10);
int totalCount = noticedao.getTotalCount();
Pagination paginationDatas = paginationImpl.getPagination(cPageInt, 10, 10, totalCount);

pageContext.setAttribute("noticeDatasPage", noticeDatasPage);
pageContext.setAttribute("paginationDatas", paginationDatas);
%>
<!DOCTYPE html>
<html>
<head>
<style>
a {
	  text-decoration-line: none;
}
</style>

<SCRIPT LANGUAGE="JavaScript">
</SCRIPT>
<meta charset="UTF-8">
</head>
<body>
<center>
<span style="font-size: 42px;"><b>이용후기 게시판입니다.</b></span><br><br><br>
	<table cellspacing=1 cellpadding=1 width=600 border=1>
		<tr>
			<td width=70><p align=center>번호</p></td>
			<td width=500><p align=center>제목</p></td>
			<td width=70><p align=center>조회수</p></td>
			<td width=100><p align=center>등록일</p></td>
		</tr>
		<c:forEach var="noticeData" items="${noticeDatasPage}">
			<tr>
				<td width=70><p align=center>
						<c:out value="${noticeData.id}" />
					</p></td>
				<td width=500><p align=center>
						<a href='e_02_oneview.jsp?key=${noticeData.id}'><c:out
								value="${noticeData.title}" /></a>
					</p></td>
				<td width=70><p align=center>
						<c:out value="${noticeData.viewingCount}" />
					</p></td>
				<td width=170><p align=center>
						<c:out value="${noticeData.date}" />
					</p></td>
			</tr>
		</c:forEach>
	</table>
	<table width=650>
		<tr>
			<td width=550></td>
			<td><input type=button value="신규"
				OnClick="window.location='e_02_pageWrite.jsp'"></td>
		</tr>
	</table>
		<div class="text-center">
		<c:url var="urlppPage" value="/e_02.jsp" >
			<c:param name="cPage" value="${paginationDatas.ppPage}"/>
		</c:url>
		
		<c:url var="urlpPage" value="/e_02.jsp">
			<c:param name="cPage" value="${paginationDatas.pPage}"/>
		</c:url>
		
		<c:url var="urlnnPage" value="/e_02.jsp">
			<c:param name="cPage" value="${paginationDatas.nnPage}"/>
		</c:url>
		
		<c:url var="urlnPage" value="/e_02.jsp">
			<c:param name="cPage" value="${paginationDatas.nPage}"/>
		</c:url>
		
		<!-- ne는 not equal, 즉 !=의 의미이다. -->
		<c:if test="${ppPage ne 0 && pPage ne 0}">
		  <a href=<c:out value="${urlppPage}"/>><c:out value="<<"/></a>
		  <a href=<c:out value="${urlppPage}"/>><c:out value="<"/></a>
		</c:if>
		
		<c:forEach var="i" begin="${paginationDatas.startPage}" end="${paginationDatas.lastPage}">
		  <b><a href = 'e_02.jsp?cPage=${i}'>${i}</a></b>
		</c:forEach>
		      
		<c:if test="${nnPage ne 0 && nPage ne 0}">
			<a href=<c:out value="${urlnPage}"/>><c:out value=">"/></a>
			<a href=<c:out value="${urlnnPage}"/>><c:out value=">>"/></a>
		</c:if>
		</center>
	</div>
	
</body>
</html>