<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.notice.model.vo.Notice"%>

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
    #detail-area {border:1px solid white;}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
	
    <div class="outer">
        <br><h2 align="center">공지사항 상세보기</h2> <br>

        <table id="detail-area" algin="center" border="1" align="center">
            <tr>
                <th width="70">제목</th>
                <td width="350" colspan="3">${n.getNoticeTitle() }</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>${n.getNoticeWriter() }</td>
                <th>작성일</th>
                <td>${n.getCreateDate() }</td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    <p style="height:150px">${n.getNoticeContent() }</p>
                </td>
            </tr>
        </table>
        <br><br>

        <div align="center">
            <a href="${path }/notice/list" class="btn btn-secondary btn-sm">목록가기</a>
         
        </div>

    </div>

</body>
</html>