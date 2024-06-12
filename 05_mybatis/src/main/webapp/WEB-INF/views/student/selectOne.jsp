<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	div#student-container{text-align:center;}
	table.tbl-student{margin:10px auto;border:1px solid; border-collapse:collapse;}
	table.tbl-student th,table.tbl-student td{
	   border:1px solid;
	   padding:5px;
	   line-height: 2em; /*input태그로 인해 cell이 높이가 길어져 border 두줄현상방지 */
	}
	table.tbl-student th{text-align:right;}
	table.tbl-student td{text-align:left;}
	table.tbl-student tr:last-of-type td:first-child{text-align:center;}
	</style>
	<c:if test="${not empty msg}">
		<script>
		alert("${msg}");
		<c:remove var="msg" scope="session"/>
		</script>
	</c:if>
</head>
<body>
	
	<div id="student-container">
	<h2>학생정보 검색</h2>
      <p>총 학생수는 ${requestScope.total}명입니다.</p>
      <form>
         <table class="tbl-student">
            <tr>
               <th>학생번호</th>
               <td>
                  <input type="number" name="no" value="${param.no}" required/>
               </td>
            </tr>
            <tr>
               <td colspan="2">
                  <input type="submit" value="검색" />
               </td>
            </tr>
         </table>
      </form>
      
      <hr />
      <c:if test="${not empty param.no && empty student}">
         <p>해당학생이 존재하지 않습니다.</p>
      </c:if>
      
      <c:if test="${not empty student}">
      <h1>학생 정보 수정</h1>
      <form 
         name="studentUpdateFrm"
         action="${pageContext.request.contextPath}/student/updateStudent.do"
         method="POST">
         <table class="tbl-student">
            <tr>
               <th>학생번호</th>
               <td>
                  <input type="number" name="no" value="${student.no}" required readonly/>
               </td>
            </tr>
            <tr>
               <th>학생이름</th>
               <td>
                  <input type="text" name="name" value="${student.name}" required/>
               </td>
            </tr>
            <tr>
               <th>학생전화번호</th>
               <td>
                  <input type="tel" name="tel" value="${student.tel}" required/>
               </td>
            </tr>
            <tr>
               <td colspan="2">
                  <input type="submit" value="수정" />
                  <input type="button" value="삭제" onclick="deleteStudent();" />
               </td>
            </tr>
         </table>
      </form>
      <form name="studentDelFrm" action="/mybatis/student/deleteStudent.do" method="post">
      	<input type="hidden" name="no" value="${param.no}"/>
      </form>
      	
      <script>
      		function deleteStudent(){
      			// location.href = "/mybatis/student/deleteStudent.do?no=${param.no}"; // get방식 요청
      			if(confirm("정말 삭제하시겠습니까?")){
      				$("[name=studentDelFrm]").submit(); // 삭제 버튼을 누를때 hidden 되어있는 아이디 값으로 삭제한다.
      			}
      		} // 쿼리문자열로 요청을 보낼 수 있지만 
      		  // DML은 POST 요청으로 처리하는게 바람직하다.
      </script>
      </c:if>
      
      <h2>학생정보 검색</h2>
      <form name="ajaxStudentSearchFrm" action="/mybatis/student/selectOneStudentMap.do" method="post">
         <table class="tbl-student">
            <tr>
               <th>학생번호</th>
               <td>
                  <input type="number" name="no" value="" required/>
               </td>
            </tr>
            <tr>
               <td colspan="2">
                  <input type="submit" value="검색" />
               </td>
            </tr>
         </table>
      </form>
      <script>
      
      	$("[name=ajaxStudentSearchFrm]").submit(function(e){
      		e.preventDefault(); // 폼 기본이벤트 방지
      		var no = $(this).find("[name=no]").val();
      		$.ajax({
      			url : "/mybatis/student/selectOneStudentMap.do",
      			data : {no},  // {no : no} 축약형
      			success : function(data){
      				console.log(data); // js 객체가 반환되어있을것 
      				var $table = $("<table class='tbl-student'></table>");
      				if(data){
      					$table.append("<tr><th>학생번호</th><td>"+data.no+"</td></tr>")
	      					  .append("<tr><th>이름</th><td>"+data.NAME+"</td></tr>") /* 우리가 생략했기 때문에 대문자로 들어감 (주석처리해서)*/
	      					  .append("<tr><th>전화번호</th><td>"+data.TEL+"</td></tr>")
	      					  .append("<tr><th>등록일</th><td>"+data.regDate+"</td></tr>")
      						  .insertAfter($("[name=ajaxStudentSearchFrm]"));
      				} else{
      					alert("조회된 회원은 존재하지 않습니다.");
      				}		
      				
      			},
      			error : function(xhr){
      				console.log(xhr);
      			}
      		})
      	})
      	
      </script>
      
	</div>
	
	
	
	
	
	
	
	
</body>
</html>