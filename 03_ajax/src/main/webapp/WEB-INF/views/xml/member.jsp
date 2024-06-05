<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- contentType="text/xml" 
	 html이 아닌 xml 파일을 제공한다.
--%>
<%-- members라는 우리만의 마크업을 만들고, 
	 이 안에 member를 넣고 id,name,profile를 넣어주도록한다
 --%>

<members>
	<c:forEach items="${list}" var="member">
		<member>
			<id>${member.getId() }</id>
			<name>${member.getName() }</name>
			<profile>${member.getProfile()}</profile>
		</member>
	
	</c:forEach>
</members>