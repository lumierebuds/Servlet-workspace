<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 결과 페이지</title>
<style>
span#main_menu {
	color: navy;
	font-size: 2em;
}

span#side_menu {
	color: indigo;
	font-size: 1.5em;
}

span#drink_menu {
	color: yellowgreen;
}

span#price {
	color: maroon;
	font-size: 2.5em;
}
</style>
</head>
<body>
	<h2>감사합니다.</h2>
	<span id="main_menu">${hamburger}</span>,
	<span id="side_menu">${side}</span>,
	<span id="drink_menu">${drink}</span>을/를 주문하셨습니다.
	<br /> 총 결제금액은
	<span id="price">원</span> 입니다.
</body>
</html>
