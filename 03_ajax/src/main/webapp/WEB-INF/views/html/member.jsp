<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.ajax.member.model.vo.Member" %>
<%@ page import="java.util.List" %>
<!-- views 폴더안에 만든 이유는 브라우저에서 함부로 접근할 수 없게 한다 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 외부라이브러리를 lib 폴더에 추가 -->
<%
	List<Member> list = (List<Member>) request.getAttribute("list");
%>

<%-- 
<table>
	<% for(Member m: list) {%>
	<tr>
		<td><%= m.getId() %></td>
		<td><%= m.getName() %></td>
		<td><img src="/ajax/images/<%= m.getProfile() %>"></td>
	</tr>
	<% } %>
</table>
--%>

<table>
	<c:forEach items="${list }" var="m">
		<tr>	
			<td>${m.id }</td>
			<td>${m.name }</td>
			<td><img src="/ajax/images/${m.profile }" ></td>
		</tr>
	</c:forEach>
		<tr>	
			<td>chipi</td>
			<td>치피치피</td>
			<td><img src="/ajax/images/치피치피차파차파.gif" ></td>
		</tr>
</table>