<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>AJAX 개요</h1>
	<!--
		Asynchronous Javascript and Xml의 약자. 
		- 동기식 / 비동기식 
		
		동기식 : 요청 처리후 그에 해당하는 응답페이지가 돌아와야만 그 다음 작업 가능.
			   만약 서버에서 호출된 결과까지 오랜 시간이 지연된다면 계속 대기해야함.
				ex) form, a
				 
		비동기식 : 현재 페이지를 유지하면서 중간중간 추가적인 요청을 보내줄 수 있음.
				 ex) 자동완성기능, 아이디중복체크, 실시간검색기능
		
	 -->
	 <h1>XMLHttpRequest 객체를 이용한 ajax </h1>
	 
	 <button onclick="ajaxTest1()">ajax get</button>
	 <button onclick="ajaxTest2()">ajax post</button>
	 
	 <div id='target'>
	 	
	 </div>
	 
	 <script>
	 
	 	function ajaxTest1(){
	 		var xhr = new XMLHttpRequest();
	 		
	 		xhr.open("get", "/ajax/ajaxTest.do?id=admin"); // 
	 		
	 		xhr.onreadystatechange = () =>{
	 			if(xhr.readyState == 4){ // 요청 전송 성공시
	 				
	 				if(xhr.status == 200){ // 응답 성공시
	 					console.log(xhr);
	 					target.innerText = xhr.responseText;
	 				}
	 				else if(xhr.status == 404){ // 404 에러 발생시 
						alert("찾는 페이지가 없습니다.");	 					
	 				} else{ // 나머지 에러 발생시
	 					alert("에러발생");
	 				}
	 			}
	 		}
	 		
	 		xhr.send(); // 요청전송 
	 	}
	 	
	 	function ajaxTest2(){
	 		
	 		const xhr = new XMLHttpRequest();
	 		xhr.open("post", "/ajax/ajaxTest.do");
	 		
	 		xhr.onreadystatechange = () =>{
	 			if(xhr.readyState == 4){
	 				if(xhr.status == 200){
	 					target.innerText = xhr.responseText;
	 				}
	 			}
	 		}
	 		
	 		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhr.send("id=user01"); // 보내고자 하는 데이터 send 함수의 매개변수로 작성
	 	}
	 	
	 </script>
	 
	 
	 
	 
	 
</body>
</html>