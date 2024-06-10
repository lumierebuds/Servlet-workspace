<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
	<h1 align="center" style="color : red;">${errorMsg }</h1>
</body>
</html>