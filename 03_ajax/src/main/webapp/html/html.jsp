<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h1>html</h1>
	
	<input type="button" value="실행" id="btn">
	<div class="wrapper">
		
	</div>
	
	<script>
		$("#btn").on("click", function(){
			$.ajax({
				url : "/ajax/html",
				success : function(data){ // data : 응답데이터
					console.log(data);
					$(".wrapper").html(data);
				},       // dataType : 응답으로 받을 데이터 타입(없어도됨, 서버측에서 설정시 적용됨)	
				error : function(xhr){
					console.log(xhr);
				}
			})
		});
	</script>
	
</body>
</html>