<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
</head>
<body>
	<h1>json</h1>
	<div>
		<input type="button" id="btn" value="실행"/>
	</div>
	<div>
		<input type="search" id="searchId" placeholder="id검색"/>
		<button type="button" id="btn-search-id">검색</button>
	</div>
	
	<div class="wrapper">
	</div>
	
	<script>
		
		$("#btn-search-id").click(function(){
			$.ajax({
				url: "/ajax/json",
				data : { 
					searchId : $("#searchId").val() // parameter 값으로 서버에 전달하는 데이터
				},
			
				success : function(data){ // 서버로부터 받아온 데이터에 해당
					if(data != null){
						var $table = $("<table></table>");
						$table
							.append(`<tr><th>아이디</th><td>\${data.id}</td></tr>`)
							.append(`<tr><th>이름</th><td>\${data.name}</td></tr>`)
							.append(`<tr><th>프로필</th><td><img src='/ajax/images/\${data.profile}'></td></tr>`);
						$(".wrapper").html($table);
					}			
					
				}, 
				error : function(xhr){
					
				}
			})
		})
	
		$(btn).click(function(){
			$.ajax({
				url : "/ajax/json",
				success : function(data){
					// onsole.log(data);
					var $table = $("<table></table>");
					$(data).each(function (index,member){
						var $tr = $("<tr></tr>");
						$tr.append(`<td>\${index+1}</td>`)
							.append(`<td><img src='/ajax/images/\${member.profile}'></td>`)
							.append(`<td>\${member.id}</td>`)
							.append(`<td>\${member.name}</td>`)
							.appendTo($table);
					});
					$('.wrapper').html($table);
				}, 
				error : function(xhr){
					console.log(xhr);
				}
			})
		})
	</script>
</body>
</html>