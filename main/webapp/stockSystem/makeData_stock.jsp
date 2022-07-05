<%@page import="dao.StockDao"%>
<%@page import="dao.StockDaoImpl"%>
<meta http-equiv="Content-Type" content="text/html/css; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*,java.sql.*,javax.sql.*,java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
StockDao stockdao = new StockDaoImpl();
stockdao.makingTable();
%>
<html>
<head>
<meta charset="UTF-8" />
</head>
<body>
<font size=6><c:out value="테이블 생성 및 기본데이터 입력 완료!"></c:out></font>
</body>
</html>