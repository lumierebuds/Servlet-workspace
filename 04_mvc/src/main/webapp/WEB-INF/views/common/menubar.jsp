<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path"  value="${pageContext.request.contextPath}" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    #login-form, #user-info {float:right}
    #user-info a {
        text-decoration:none; /* a 태그의 밑줄 없애기 */
        color:black;
        font-size:12px;
    }

    .nav-area {background:black;}
    .menu {
        display:table-cell; /* 인라인요소처럼 배치 가능 */
        height:50px;
        width:150px;
    }
    .menu a {
        text-decoration:none;
        color:white;
        font-size:20px;
        font-weight:bold;
        display:block;
        width:100%;
        height:100%; /* display:block 으로 지정 후 width height 를 100% 로 지정하면 
                        해당 블록 안에 마우스 포인터가 들어갔을 경우 a 태그 영역으로 인식된다. */
        line-height:50px; /* 장평조절 : 위~아래 에서 가운데로 조정 */
    }
    .menu a:hover {
        background:darkgray;
    }
</style>

</head>
<body>
	<script type="text/javascript">
		var msg = "${alertMsg}";
		
		if(msg){
			alert(msg);
			
			<c:remove var="alertMsg"/>
		}
	</script>
	
	<h1 align="center">Welcome D Class</h1>	
	<div class="login-area">
			<c:if test="${not empty loginUser}">
				<!-- 로그인 성공후 -->
				<div id="user-info">
					<b>${loginUser.userName }님</b> 환영합니다.
					<div align="center">
						<a href="${path }/member/myPage">마이페이지</a>
						<a href="${path}/member/logout">로그아웃</a>
					</div>
				</div>
			</c:if>
		   
		   <c:if test="${empty loginUser}">
		   	   <!-- 로그인 전에 보여지는 로그인 form -->
	           <form id="login-form" action="${path }/member/login" method="post">
	               <table>
	                   <tr>
	                       <th>아이디 : </th>
	                       <td><input type="text" name="userId" required></td>
	                   </tr>
	                   <tr>
	                       <th>비밀번호 : </th>
	                       <td><input type="password" name="userPwd" required></td>
	                   </tr>
	                   <tr>
	                       <th colspan="2">
	                           <button type="submit">로그인</button>
	                           <button type="button" onclick="enrollPage();">회원가입</button>
	                       </th>
	                   </tr>
	               </table>
	           </form>
	           <script type="text/javascript">
	           		function enrollPage(){
	           			location.href = "${path}/member/insert"; 
	           			// 현재 페이지의 url을 다루는 객체인 location
	           			// href에 새로운 값을 넣으면 그곳으로 이동가능
	           		}
	           </script>
	           
		   </c:if>
	
     </div>
     
     <br clear="both">
     
     <div class="nav-area" align="center">
     	<div class="menu"><a href="${path }">HOME</a></div>
     	<div class="menu"><a href="${path }/notice/list">공지사항</a></div>
     	<div class="menu"><a href="${path }">게시판</a></div>
     	<div class="menu"><a href="${path }">게시판</a></div>
     </div>
	
	
</body>
</html>
	
	
	
	
	