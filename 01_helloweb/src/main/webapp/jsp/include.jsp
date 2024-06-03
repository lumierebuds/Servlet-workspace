<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- 공통으로 쓰는 파일들만 링크해주는것이 좋다. -->
</head>
<body>
	<%@ include file="/jsp/header.jsp" %>
	<!-- / : webapp -->
	<!-- /jsp/header.jsp => webapp/jsp 폴더안에 header.jsp 파일을 가져오는것 -->
	<h1>Content <% out.println(num); %></h1>
	<a href="/hello/jsp/basic.jsp">another.jsp</a> <!-- 해당 페이지에서 다른 jsp 파일로 가기위해선 /hello로 시작한다. -->	
	<p>
		감사원은 세입·세출의 결산을 매년 검사하여 대통령과 차년도국회에 그 결과를 보고하여야 한다. 한 회계연도를 넘어 계속하여 지출할 필요가 있을 때에는 정부는 연한을 정하여 계속비로서 국회의 의결을 얻어야 한다.
		학교교육 및 평생교육을 포함한 교육제도와 그 운영, 교육재정 및 교원의 지위에 관한 기본적인 사항은 법률로 정한다. 훈장등의 영전은 이를 받은 자에게만 효력이 있고, 어떠한 특권도 이에 따르지 아니한다.
		대통령은 조약을 체결·비준하고, 외교사절을 신임·접수 또는 파견하며, 선전포고와 강화를 한다. 국가는 사회보장·사회복지의 증진에 노력할 의무를 진다.
	</p>
	<section>
	</section>
	<%@ include file="/jsp/footer.jsp" %>
	<!-- /jsp/header.jsp => webapp/jsp 폴더안에 footer.jsp 파일을 가져오는것 -->
