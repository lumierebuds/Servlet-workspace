<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>fn basics</h1>
	<c:set var="str1" value="Hello world, Hello JSTL"/>
	<c:set var="str2" value="Hello EL"/>
	
	<p>${fn:toUpperCase(str1)}</p>
	<p>${fn:toLowerCase(str1)}</p>
	
	<p>${fn:length(str1)} ${str1.length()}</p> <!-- 문자열의 길이 반환 -->
	<p>${fn:contains(str1, "world")}</p>
	
	<c:if test="${not fn.contains(str1, 'world')}">
		world 없다.
	</c:if>
	
	<p>${fn:indexOf(str1, 'world')}</p>
	<p>${fn:indexOf(str1, 'wwww')}</p>
	
	<c:if test="${fn:indexOf(str1, 'world') > -1 }">
		world 있다.
	</c:if>
	
	<p>${fn:replace(str1, "Hello", "Goodbye")}</p>
	
	<c:set var="script">
		<script>
			document.body.style.color = "red";
		</script>
	</c:set>
	<%-- ${script} --%>
	<!-- 태그로 인식돼, 스크립트를 시작할 수 있어서, 위험한 방법이다. -->
	${fn:escapeXml(script)}
	
</body>
</html>