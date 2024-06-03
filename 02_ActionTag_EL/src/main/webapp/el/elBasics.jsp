<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	String life = "life is very short!";
	pageContext.setAttribute("life", life);
	pageContext.setAttribute("movie", "노인을 위한 나라는 없다.");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String coffee = (String)request.getAttribute("coffee");
%>
</head>
<body>
	<h1>El Basics</h1>
	<%-- scope 생략시 pageScope, request, sessionScope, applicationScope 순으로 찾는다.--%>
	
	<p>${life}</p>
	<p>${coffee}</p>
	<p>${serverTime}</p>
	<p>${honngd["id"]}</p>
	<%-- <p>${honngd.nickname}</p> : [nickname] 특성이 [com.kh.person.Person] 유형에 없습니다.
	--%>
	
	<p>${honngd.name}</p>
	<p>${honngd.gender}</p>
	<p>${honngd.age}</p>
	<p>${honngd.married}</p>
	
	<p>${book}</p>
	<p>${movie}</p>
	<p>${applicationScope.movie}</p>
	<!--  
	<p>${honngd.id}</p>
	<p>${honngd["id"]}</p>
	-->
	
	<p>${list}</p>
	<p>${list[0]}</p>
	<p>${list[1]}</p>
	<p>${list[2]}</p>
	<p>${list[3]}</p> 
	<!-- 인덱스를 벗어나도 오류가 발생하지는 않는다.-->
	
	<h2>map</h2>
	<p>${map}</p>
	<p>${map.language}</p>
	<p>${map["Mr.mkm"].name}</p>
	<p>${map["Mr.mkm"]["name"]}</p>
	
	<h1>param</h1>
	<p>${param.pname}</p>
	<p>${param.pcount}</p>
	<p>${paramValues.option[0]}</p>
	<p>${paramValues.option[1]}</p>
	
	
	<h1>cookie</h1>
	<p>${cookie.JSESSIONID}</p>
	<p>${cookie.JSESSIONID.value}</p>
	
	<h1>header</h1>
	<p>${header.accept}</p>
	<p>${header['user-agent']}</p>
	
	<h1>pageContext</h1>
	<p>${pageContext.request.contextPath}</p>
	<p>${pageContext.request.method}</p>
	
	
