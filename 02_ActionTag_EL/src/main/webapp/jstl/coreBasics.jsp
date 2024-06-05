<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- uri : url 정보에 해당한다. 해당 사이트에서 액션태그들을 사용할 수 있다-->
<c:set var="no1" value="${param.num1}"/>
<c:set var="no2" value="${param.num2}"/> <!-- 기본값 pageScope -->
<%--
	int no1 = 200;
	pageContext.setAttribute("no1", null); // null값 + 에러가 나지 않음 - 
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
   border-collapse: collapse;
   border: 1px solid #000;
   margin: 10px;
}
th, td {
   border: 1px solid #000;
   padding: 5px;
}
</style>
</head>
<body>
	
	<h1>JSTL</h1>
	<p>JSP Custom Tag Library</p>
	<h1>Core</h1>
	
	<p><c:out value="${no1}"/> ${no1}</p>
	<p><c:out value="${no2}"/> ${no2}</p>
	<p><c:out value="${no1 + no2}"/> ${no1 + no2}</p>
	
	<c:set var="outTest" value="<b>출력테스트</b>"/>
	${outTest}
	<c:out value = "${outTest }"/> <%-- escapeXml="true" --%><!-- 태그로써 해석하지 않는다.  -->
	<c:out value = "${outTest }" escapeXml="false"/> <!-- 태그로써 해석해서 출력할지여부 지정(기본값 true) -->
	
	<h2>조건식</h2>
	<c:if test="${no1 > no2}">
		${no1 } > ${no2 }
	</c:if>
	<c:if test="${no1 lt no2}">
		${no1 } &lt; ${no2 }
	</c:if>
	<c:if test="${no1 eq no2}">
		${no1 } eq ${no2 }
	</c:if>
	<!-- 코어라이브러리는 단독if문밖에 없다. -->
	
	<c:set var="rnd" value="<%= new Random().nextInt(100) %>"/>
	<p>
	<c:choose>
		<c:when test="${rnd mod 5 eq 0}"> 인형뽑기 성공</c:when>
		<c:when test="${rnd mod 5 eq 1 }">권총뽑기 성공</c:when>
		<c:otherwise>꽝입니다.</c:otherwise>
	</c:choose>
	<!-- choose(when, otherwise) == if, else if, else -->
	</p>
	
	<h2>반복문</h2>
	<c:forEach var="i" begin='1' end="6" step="1">
		<h${7-i}>Hello world${7-i}</h${7-i}>
	</c:forEach>
	
	<c:set var="list" value='<%=Arrays.asList("홍길동", "신사임당", "이순신") %>'/>
	<%-- <c:forEach var="i" begin="0" end='${list.size()}'>
			<p>${list[i]}</p>
	</c:forEach> --%>
	
	<c:forEach items="${list}" var="name" varStatus="vs">
		<p>${vs.index } ${vs.count} - ${name}</p>
	</c:forEach>
	<table>
			<tr>
		         <th>No</th>
		         <th>아이디</th>
		         <th>이름</th>
		         <th>성별</th>
		         <th>나이</th>
		         <th>결혼여부</th>
      		</tr>
		<c:forEach items="${personList}" var="person" varStatus="vs">
			<tr>
		         <td>${vs.count}</td>
		         <td>${person.id}</td>
		         <td>${person.name }</td>
		         <td>${person.gender }</td>
		         <td>${person.age }</td>
		         <td><input type="checkbox" ${person.married ? 'checked' : ''} onclick='return false;'></td>
      		</tr>
		</c:forEach>
   </table>
   
   <table>
   	<c:forEach items="${map }" var="item" varStatus="vs">
   		<tr>
			<th>${item.key}</th>
			<td>${item.value}</td>
			<!-- key, value를 필드값처럼 가져올 수 있다. -->
   		</tr>
   	</c:forEach>
   </table>
	
	<hr>
	
	<h3>5. 반복문 - forTokens</h3>
	<c:set var="device" value="컴퓨터,휴대폰,TV,에어컨/냉장고.세탁기"/>
	
	<ul>
		<c:forTokens var='d' items="${device }" delims=",./">
			<li>${d}</li>
		</c:forTokens>
	</ul>
	
	<hr>
	<h2>url</h2>
	<img alt="쓰담쓰담" src="/action/resources/images/animal1.gif">
	<img alt="쓰담쓰담" src="<c:url value='/resources/images/animal1.gif'/>">
	
	<!-- 어플리케이션 입장에서 찾는게 c:url / 곧 자기자신이기 때문에  -->
	<!-- 첫 슬래쉬는 webapp에 해당한다.  -->
	
	<a href="/action/el/elBasics.do?pname=아이폰&pcount=10&option=black&option=128gb">기존 방법</a>
	
	<c:url var='query' value="/el/elBasics.do">
		<c:param name="pname" value="아이폰"/>
		<c:param name="pcount" value="10"/>
		<c:param name="option" value= "black"/>
		<c:param name="option" value="128gb"/>
		
	</c:url>
	
	<a href="${query}">c:url을 이용한 방식</a>
	
</body>
</html>