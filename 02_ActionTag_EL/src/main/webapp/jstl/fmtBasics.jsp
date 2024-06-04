<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="ko_kr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h1>fmt basics</h1>
	<h2>숫자</h2>
	<c:set var='num1' value="123"/>
	<p><fmt:formatNumber value="${num1 }"/></p>	<!--기본 : 따옴표를 붙여준다. -->
	<p><fmt:formatNumber value="${num1 }" pattern="0,000" /></p> <!-- 값을 0으로 넣어준다.  -->
	<p><fmt:formatNumber value="${num1 }" type="currency"/></p>
	
	<c:set var='num2' value="1234.456" /> 
	<p><fmt:formatNumber value="${num2 }" pattern="#,###.###"/></p> <!-- 소수점 3자리까지 표현 & 자리수 반올림  -->
	<p><fmt:formatNumber value="${num2 }" pattern="0.0000"/></p>

	<c:set var='num3' value="0.02"/>
	<p><fmt:formatNumber value="${num3 }" type='percent'/></p> <!-- 백분율패턴으로 바꿈 -->


	<h2>날짜</h2>
	<c:set var="now" value="<%= new Date() %>"/>
	<p><fmt:formatDate value="${now }" type='date'/></p> 
	<p><fmt:formatDate value="${now }" type='time'/></p> 
	<p><fmt:formatDate value="${now }" type='both'/></p> 
	<p><fmt:formatDate value="${now }" pattern="yy/MM/dd(E)"/></p> 
	
	<br><br><br><br><br>
	<br><br><br><br><br>


</body>
</html>