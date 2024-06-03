<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:useBean id="hongd" class="com.kh.person.Person" scope="request"></jsp:useBean>
<jsp:useBean id="sinsa" class="com.kh.person.Person" scope="request"></jsp:useBean>
<jsp:setProperty property="id" name="sinsa" value="ssinsa"></jsp:setProperty>
<jsp:setProperty property="name" name="sinsa" value="신사임당"></jsp:setProperty>
<jsp:setProperty property="gender" name="sinsa" value="여"></jsp:setProperty>
<jsp:setProperty property="age" name="sinsa" value="50"></jsp:setProperty>
<jsp:setProperty property="married" name="sinsa" value="true"></jsp:setProperty>
<!-- 
	해당 스코프에서 id와 동일한 속성명으로 저장된 객체를 가져옴
	존재하지 않을때는 해당 타입의 객체를 하나 새로 생성한다.
	
	(property 접근방식) 
	- getter : getter 메서드에서 get을 제외하고 소문자로 시작하는 이름. -> name -> getName();
	- setter : setter에서 set을 제외한 소문자로 시작하는 이름. -> age -> setAge(value);
	
	
 -->
<html>
<head>
<meta charset="UTF-8">
<style>
	table, th, td {
	   border: 1px solid #000;
	   padding: 5px;
	   margin-bottom: 20px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<h1>useBeanServlet</h1>
	<table>
		<!-- 홍길동 정보 -->
		<tr>
			<th>id</th>
			<td><jsp:getProperty property="id" name="hongd"></jsp:getProperty></td>
		</tr>
		<tr>
			<th>name</th>
			<td><jsp:getProperty property="name" name="hongd"></jsp:getProperty></td>
		</tr>
		<tr>
			<th>gender</th>
			<td><jsp:getProperty property="gender" name="hongd"></jsp:getProperty></td>
		</tr>
		
		<tr>
			<th>age</th>
			<td><jsp:getProperty property="age" name="hongd"></jsp:getProperty></td>
		</tr>
			
	</table>
	<table>
		<!-- 신사임당 정보 -->
		<tr>
			<th>id</th>
			<td><jsp:getProperty property="id" name="sinsa"></jsp:getProperty></td>
		</tr>
		<tr>
			<th>name</th>
			<td><jsp:getProperty property="name" name="sinsa"></jsp:getProperty></td>
		</tr>
		<tr>
			<th>gender</th>
			<td><jsp:getProperty property="gender" name="sinsa"></jsp:getProperty></td>
		</tr>
		
		<tr>
			<th>age</th>
			<td><jsp:getProperty property="age" name="sinsa"></jsp:getProperty></td>
		</tr>
			
	</table>
</body>
</html>