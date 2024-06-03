<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/standard/header.jsp">
		<jsp:param value="ANOTHER" name="title"/>
	</jsp:include>
   
   <section>
   	<article>
   		<h2></h2>
   		<a href="../">메인으로</a>
   	</article>
   </section>
   <jsp:include page="/standard/footer.jsp"/>
</body>
</html>