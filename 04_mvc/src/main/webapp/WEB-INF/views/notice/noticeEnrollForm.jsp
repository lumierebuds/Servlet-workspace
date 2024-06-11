<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer {
        background:black;
        color:white;
        width:1000px;
        height:500px;
        margin:auto;
        margin-top:50px;
    }
    
    #enroll-form>table {border:1px solid white;}
    #enroll-form input, #enroll-form textarea {
        width:100%; /* 가로길이를 부모요소의 100% 가 되도록 */
        box-sizing:border-box; /* content 영역 기준으로 100% 인데 그 밖에 padding 이나 border 영역까지 있을 경우 테두리까지 포함한 기준으로 100% 를 지정해라 라는것 */
    }
</style>
</head>
<body>
	
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
   
   <div class="outer">
        <br> <h2 align="center">공지사항 작성하기</h2>

        <form id="enroll-form" action="${path }/notice/insert" method="post">
         <input type="hidden" name="userNo" value="${loginUser.getUserNo()}"> 
      
            <table align="center">
                <tr>
                    <th width="50">제목</th>
                    <td width="350"><input type="text" name="title" required></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea name="content" rows="10" style="resize:none" required></textarea>
                    </td>
                </tr>
            </table>
            <br><br>
            <div align="center">
                <button type="submit">등록하기</button>
                <button type="button" onclick="history.back();">뒤로가기</button> 
                <!-- history.back() : 이전 페이지로 돌아가게 해주는 함수 -->
            </div>

        </form>

    </div>

</body>
</html>