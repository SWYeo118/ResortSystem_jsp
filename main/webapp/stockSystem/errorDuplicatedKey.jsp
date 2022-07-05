<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>errorPage</title>
</head>
<body>
<br>
<font size=6><c:out value="error! : 상품번호가 중복되었습니다. 상품번호를 변경하여 입력해주세요"></c:out></font>
</body>
</html>