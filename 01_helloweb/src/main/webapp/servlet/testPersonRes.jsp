<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%--
	jsp 주석 : HTML 페이지에 추가가 되지 않는다. 
	jsp : java Servlet
	html내에 자바 문법을 사용할 수 있음 <%.. %>
	
 --%>
 <%@ page import='java.util.Arrays' %>
 <%
 	// scriptlet(자바 작성 공간)
 	System.out.println(123);
 	
 	// 사용자가 입력한값도 가져올 수 있음.
 	// request, response선언 없이 사용가능(내장객체)
 	String name = request.getParameter("name");
	String color = request.getParameter("color");
	String animal = request.getParameter("animal");
	String[] foods = request.getParameterValues("food");
	String recommendation = (String) request.getAttribute("recommendataion");
	// "recommendation"은 반환타입이 Object 이기 때문에 다운캐스팅을 해줘야한다. 
				
	
 %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>개취검사결과 jsp</h1>
	<p><% out.print(name);%>님의 개인취향 검사 결과는</p>
	<p><%= color %>색을 좋아합니다</p>
	<p>좋아하는 동물은 <%= animal%>입니다.</p>
	<p>좋아하는 음식은 
	<%
		if(foods != null){
			out.print("좋아하는 음식은"+Arrays.toString(foods)+"입니다.");
		} else{
			out.print("좋아하는 음식이 없습니다.");
		}
	%></p>
	<hr>
	<p class='recommendation'>오늘의 추천음식은 ${recommendation}</p>
		
</body>
</html>