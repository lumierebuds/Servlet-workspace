<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.kh.person.Person" %>
<%-- import는 수동이다 (ide따라 다르긴함) --%>

<%
   String str1 = "안녕";
   String str2 = new String("안녕");
   
   int big = 100;
   int small = 30;
   
   Person p1 = new Person("honngd", "혼길동", '남', 35, true);
   Person p2 = new Person("honngd", "혼길동", '남', 35, true);
   
   List<String> list = null;
   list = new ArrayList<>();
   list.add("hello world");

   pageContext.setAttribute("str1", str1);
   pageContext.setAttribute("str2", str2);
   pageContext.setAttribute("big", big);
   pageContext.setAttribute("small", small);
   pageContext.setAttribute("p1", p1);
   pageContext.setAttribute("p2", p2);
   pageContext.setAttribute("list", list);
   
   pageContext.setAttribute("emptyStr", "");
%>   

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>el 연산자</h1>
	<h2>산술연산자</h2>
	<p>${big + small}</p>
	<p>${big - small}</p>
	<p>${big - '20'}</p>
	<%-- 
		<p>${big - 'ab'}</p> : 에러발생 예기치 않은 조건을 맞닥뜨렸습니다. 
	--%> 
	<p>${big * small}</p>
	<p>${big / small} ${big div small}</p>
	<p>${big % small} ${big mod small}</p>
	
	<p>${str1} ${str2}</p>
	<p>${str1.concat(str2)}</p>
	
	<h1>비교연산</h1>
	<p>${big > small} ${big gt small}</p>
	<p>${big < small} ${big lt small}</p>
	
	<p>${big >= small} ${big ge small}</p>
	<p>${big <= small} ${big le small}</p>
	
	<p>${big == small} ${big eq small}</p>
	<p>${big != small} ${big ne small}</p>
	
	<hr>
	<h1>문자열 동등비교(EL 표기와 자바차이)</h1>
	<p><%= str1 == str2 %> ${str1 == str2} ${str1 eq str2}</p>
	<p><%= str1 != str2 %> ${str1 != str2} ${str1 ne str2}</p>
	
	<p>${p1 == p2 } ${p1 eq p2}</p>

	<!-- 객체가 null이거나 배열에 요소가 없는지 검사 -->
	<!-- 없으면 true, 있으면 false -->
	<p>${empty list}</p>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	
	<script type="text/javascript">
		var temp = "1234";
		var str = `:::\${temp}:::`;
		console.log(str);
	</script>
</body>
</html>