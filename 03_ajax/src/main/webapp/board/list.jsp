<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 게시글 목록 페이지 -->
<h2>일반게시판</h2>
<table class='list-table'>
	<thead>
		<tr>
			<th style="width: 10%">번호</th>
			<th style="width: 40%">제목</th>
			<th style="width: 20%">작성자</th>
			<th style="width: 30%">작성일</th>
		</tr>
	</thead>
	<tbody>
	
		<!-- 반복문으로 등록된 게시글들를 출력하는곳입니다. -->
		<c:forEach items='${sessionScope.boards}' var='board' varStatus='vs'>
		<tr data-id ="${board.getNo()}" onclick="view(this)">
			<td style="width: 10%">${board.getNo()}</td>
			<td style="width: 40%">${board.getTitle()}</td>
			<td style="width: 20%">${board.getNickname()}</td>
			<td style="width: 30%"><fmt:formatDate value="${board.getCreateDate()}" pattern="yyyy-MM-dd"/></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<script>

	function view(tr){
		var $outer = $(".outer");
		console.log($(tr).data("id"));
		$.ajax({
			type:"get",
			data: { 
				id : $(tr).data("id")
			},
			url : "/ajax/board/view",
			success : function(data){
				$outer.html(data);
			}, 
			error : function(xhr){
				console.log(xhr);
			}
		})
		
	}
	
</script>






