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
	<h1>XML</h1>
	<button type="button" id="btn">실행</button>
	<button type="button" id="btn-product-sample">상품 xml 가져오기</button>
	
	<script type="text/javascript">
		
		$("#btn-product-sample").click(function(){
			$.ajax({
				url : "/ajax/xml/sample-product.xml", // xml 파일 그대로 전달받을 수 있다.
				success: function(data){
					console.log(data);
					var $products = $(data).find(":root").find("Product");
					console.log($products);
					
					var $ul = $("<ul></ul>");
					$products.each(function(index, product){
						var name = $(product).find("Name").text(); // 상품명
						var price = $(product).find("Price").text(); // 상품가격
						$ul.append(`<li>\${name} ($\${price}) </ll>`);
					});
					$ul.appendTo($("body"));
				},
				error : function(xhr){
					console.log(xhr);
				}
			})
		});
	
	
		$("#btn").click(function(){
			$.ajax({
				url : "/ajax/xml",
				success : function(data){
					console.log(data);
					var $root = $(data).find(":root"); // xml의 루트태그들
					console.log($root);
					
					var $members = $root.find("member"); // 루트태그들 안에 member 태그를 찾음
					var $table = $("<table></table>"); // table 태그를 만들고, 
					$members.each(function(index, member){
						console.log(index, member);
						var id = $(member).children("id").text();
						var name = $(member).children("name").text();
						var profile = $(member).children("profile").text();
						
						var $tr = $("<tr></tr>");
						$tr.append(`<td>\${index + 1}</td>`)
						   .append(`<td><img src='/ajax/images/\${profile}'></td>`)
						   .append(`<td>\${id}</td>`)
						   .append(`<td>\${name}</td>`)
						   .appendTo($table);						
					})
					$("body").append($table);
					console.log($members);
				}, 
				error : function(xhr){
					console.log(xhr);
				}
			})
		});
	</script>

</body>
</html>
