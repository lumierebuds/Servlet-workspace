<%-- page 지시어 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*, java.io.*'%>
<%-- util, io의 있는 코드들을 쓸 수 있다. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/jsp/header.jsp" %>
	<h1>
		Basic
	</h1>
	<%
			// jsp의 구성요소 : scriptlet
			int sum = 0;
			for(int i=1; i<=10; i++){
				sum += i;
			}
			
			Date now = new Date();
		
	%>
	
	<p>server-side : java로 계산된 결과 : <%= sum %></p> <!-- jsp의 구성요소 : 출력식 -->
	<!-- server-side : 서버측에서 페이지를 렌더링해서 클라이언트에게 전달한다. -->
	<p>server-side : java로 계산된 현재시각 : <% out.println(now.getTime()); %></p>
	
	<p>client-side : javascript로 계산된 결과 : <span id="sum"></span></p>
	<!-- client-side : 클라이언트측에서 페이지를 렌더링해서 화면을 보여줌. DOM 요소를 통해 렌더링 -->
	<p>client-side : javascript로 계산된 현재시각 : <span id="date"></span></p>
	<script>
		var sum = 0; 
		for(var i=0; i<=10; i++){
			sum += i;
		}
		
		document.querySelector("#sum").innerText = sum;
		
		var now = new Date();
		document.querySelector("#date").innerText = now.getTime();
		
		
		
	</script>
	
	
<%@ include file="/jsp/footer.jsp" %>

