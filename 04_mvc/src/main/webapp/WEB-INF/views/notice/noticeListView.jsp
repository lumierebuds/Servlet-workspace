<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    .outer {
        background:black;
        color:white;
        width:1000px;
        height:500px;
        margin:auto;
        margin-top:50px;
    }
    .list-area {
        border:1px solid white;
        text-align:center;
    }

    .list-area>tbody>tr:hover {
        background:gray;
        cursor:pointer;
    }
</style>

<title>Insert title here</title>
</head>
<body>


	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
	
	<div class="outer">
		
		<h2 align="center">공지사항</h2>
		<c:if test="${not empty loginUser and loginUser.userId eq 'admin'}">
		<!-- 로그인이 된 사용자며 로그인한 아이디가 'admin'에 해당할때 공지사항 작성-->
		<div align="right" style="width:850px">
			<a href="${path}/notice/insert" class="btn btn-secondary">글작성</a>
         <br><br>
      	</div>
     	</c:if>

        <table class="list-area" align="center">
            
            <thead>
                <tr>
                    <th>글번호</th>
                    <th width="400">글제목</th>
                    <th width="100">작성자</th>
                    <th>조회수</th>
                    <th width="100">작성일</th>
                </tr>
            </thead>
            <tbody>
                   <!-- 보통 작성일 기준 내림차순, 즉, 최근 글이 제일 위에 오게끔 구현한다. -->
          
                   <c:forEach var="notice" items="${list }">
                   <tr>
                       <td>${notice.noticeNo}</td>
                       <td>${notice.noticeTitle }</td>
                       <td>${notice.noticeWriter }</td>
                       <td>${notice.count }</td>
                       <td>${notice.createDate}</td>
                   </tr>
                   
                   </c:forEach>
            </tbody>
        </table>
    </div>
	</div>

	<script>
		$(function(){
			$('.list-area>tbody>tr').click(function(){
					
					var nno = $(this).children().eq(0).text().trim();
					console.log(nno);
					
					location.href="${path}/notice/detail?nno="+nno;
			})
		})
	</script>














</body>
</html>