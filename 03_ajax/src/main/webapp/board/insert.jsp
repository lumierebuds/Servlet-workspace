<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 등록페이지 -->
<h2>게시판등록</h2>
<table class='enroll-table'>
	<tr>
		<th>제목</th>
		<td colspan=3><input type="text" name="title" value="" /></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td colspan="3"><input type="text" name="nickname" /></td>
	</tr>
	<tr>
		<th>글내용</th>
		<td colspan="3" style="height: 200px;"><textarea name="content"></textarea>
		</td>
	</tr>
	<tr>
		<th colspan="4">
			<button id="btn">등록</button>
		</th>
	</tr>
</table>

<script>
	// 등록 버튼을 눌렀을때 "작성완료!" alert 하기 
	$("#btn").on("click", function(){
		var $outer = $(".outer");
		console.log("버튼눌림");
		$.ajax({
			type: 'post',
			url: "/ajax/board/insert",
			data : {
				title : $("[name=title]").val(),
				nickname : $("[name=nickname]").val(),
				content : $("[name=content]").val(),
			}, 
			success : function(data){
				alert("작성완료!");
				$outer.html(data);
			}, 
			error: function(xhr){
				console.log(xhr);
				}
			})
		})
</script>

