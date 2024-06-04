<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table { 
	   border-collapse: collapse; 
	   border: 1px solid #000;
	   margin: 5px;
	}
	th, td {
	   border: 1px solid #000;
	}
	table img {
	   width: 150px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
   <h1>text</h1>
   <input type="button" value="실행" id="btn1"/>
   <div class="wrapper"></div>
   
   <hr/>
   
   <h2>csv</h2>
   <input type="button" value="실행" id="btn2" />
   <div class="container"></div>
   
   <script type="text/javascript">
   		$(btn2).click(function(){
   			$.ajax({
   				url: "/ajax/csv",
   				success: function(data){
   					console.log(data);	
   					
   					/*
   					hwan,황제성,hwang.jpg
	   				julia,줄리아 로버츠,juliaRoberts.jpg
	   				gone,김고은,김고은.jpg
	   				daft,다프트펑크,daftpunk.jpg 
	   				*/	
	   				var $table = $("<table></table>");
   					var members = data.split("\n"); // ["hwan,황제성",..., '']
   					members.splice(members.length - 1, 1);
   					$.each(members, function(index, member){
   						console.log(index, member);
   						var arr = member.split(","); // 각각의 멤버 정보를 다시 배열로 나눠 사용
   						var tr = "<tr>";
   								tr+= `<td>\${arr[0]}</td>`;
   								tr+= `<td>\${arr[1]}</td>`;
   								tr+= `<td><img src='/ajax/images/\${arr[2]}'></td>`;
   							tr+= "</tr>";
   						$table.append(tr);	
   					});
   					$(".container").html($table);
   				},
   				error : function(xhr, status, err){
   					console.lo(xhr, status, err);
   				}
   			})
   		});		
   
   		$(btn1).click(function(){
   			$.ajax({
   				url: "/ajax/text",
   				data : {
   					name: "strawberry",
   					num: 34.56,
   					flag: false
   				},
   				method : "POST", // 기본값은 GET 
   				dataType: "text", // 응답데이터형식 text | html | jsp | xml | json
   				beforeSend : function(){
   					// 전송전 실행 콜백 함수 
   					console.log("beforeSend call");
   				},
   				success : function(data){ // data == xhr.responseTest / 응답데이터
   					// 요청 성공시 실행할 콜백함수.
   					console.log(data);
   					$(".wrapper").html(data);
   				},
   				error : function(xhr, status, error){
   					// 요청 실패시 실행할 콜백함수. 
   					console.log(xhr, status, error);
   				},
   				complete : function(){
   					// 요청 성공/실패와 상관없이 무조건 마지막에 호출되는 콜백함수
   					console.log("complete call");
   				}
   			});
   		});
   </script>
</body>
</html>














