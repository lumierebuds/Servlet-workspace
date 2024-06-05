<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/ajax/resources/css/board.css"> <!-- 브라우저 기준임 -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<div class='wrapper'>
      <header>
         <h3 style="fontWeight: bolder">KH C CLASS</h3>
      </header>
      <nav>
         <a id='list'>게시판</a> <a id='insert'>등록</a>
      </nav>
      <div class='outer'>
         <!-- 
            게시글 목록,
            게시글 등록,
            게시글 상세보기            
          -->                  
      </div>
   </div>
   	<script>
   		
   		function render(){
   			var $outer = $(".outer");
   			$.ajax({
   				url:"/ajax/board/list",
   				success : function(data){
   					$outer.html(data);
   				}, 
   				error : function(xhr){
   					console.log(xhr);
   				}
   			})
   		}
   	
   		window.onload = function(){
   			(function(){
   				render();
   			})();
   		}
   		
   		
   		// 게시판 앵커태그 눌렀을때 게시판 페이지로 렌더링
   		$("#list").on("click", function(){
   			var $outer = $(".outer");
   			$.ajax({
   				type: "get",
   				url:"/ajax/board/list",
   				success : function(data){
   					$outer.html(data);
   				}, 
   				error : function(xhr){
   					console.log(xhr);
   				}
   			})
   		});
   		
   		
   		// 게시글 작성 앵커태그 눌렀을때 작성페이지로 렌더링
   		$("#insert").on("click", function(){
   			var $outer = $(".outer");
   			$.ajax({
   				type: "get",
   				url: "/ajax/board/insert",
   				success: function(data){
   					$outer.html(data);
   				},
   				error : function(xhr){
   					console.log(xhr);
   				}
   			})
   		})	
   		
   	</script>
</body>
</html>