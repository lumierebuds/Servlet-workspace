<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	
 	<div class="ui-widget">
 		<label for="name">우리반 이름 : </label>
 		<input type="text" id="name">
	</div>	
	<h1 class="selected"></h1>
	
	<script type="text/javascript">
		$("#name").autocomplete({
			source : function(req, res){
				// console.log(req);
				// console.log(res(["1234", "123213"]));
				$.ajax({
					url : "/ajax/auto",
					data: {
						search : req.term
					}, 
					success : function(data){
						console.log(data);
						var arr = data.split("\n")
						arr.splice(arr.length-1,1);		   
						arr = $.map(arr, function(name){
							return{
								label : name, // 노출텍스트
								value : name // 내부적 처리값
							}
						});
						// 작업 완료후 콜백함수 호출
						res(arr);
					},
					error: function(xhr, status, err){
						console.log(xhr, status, err);
					}
				})
				// 클라이언트가 전송한 데이터를 자동완성을 위한 검색어로 추가
			}, 
			select : function(event, selected){ // 요소 선택시 실행
				console.log(event);
				console.log(selected.item.label); // 선택된(selected) 항목의 아이템(item)의 라벨텍스트(label)
				
				$("h1.selected").html(selected.item.label);
			},
			focus : function(){
				return false;
			}
		})
	</script>
	
</body>
</html>