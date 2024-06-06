<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 상세보기 페이지 -->
<h2>게시판상세보기</h2>
<table class='detail-table'>
	<tr>
		<th colSpan="4">${board.getTitle()}</th>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${board.getNickname()}</td>
		<th>작성일</th>
		<td><fmt:formatDate value="${board.getCreateDate()}" pattern="yyyy-MM-dd"/></td>
	</tr>
	<tr>
		<th>글내용</th>
		<td colSpan="3" style="height: 200px;">${board.getContent()}</td>
	</tr>
</table>


