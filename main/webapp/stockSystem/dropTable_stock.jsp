<%@page import="dao.StockDaoImpl"%>
<%@page import="dao.StockDao"%>
<meta http-equiv="Content-Type" content="text/html/css; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*,java.sql.*,javax.sql.*,java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
StockDao stockdao = new StockDaoImpl();
stockdao.dropTable();
%>
<html>
<head>
<meta charset="UTF-8" />
</head>
<body>
<font size=6><c:out value="테이블 삭제 완료!"></c:out></font>
</body>
</html>