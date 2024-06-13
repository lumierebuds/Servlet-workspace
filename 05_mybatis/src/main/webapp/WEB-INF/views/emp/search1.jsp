<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div#emp-container{text-align:center;}
	table.tbl-emp{
	   margin:0 auto;
	   border:1px solid; 
	   border-collapse:collapse;
	}
	table.tbl-emp th, table.tbl-emp td{
	   border:1px solid;
	   padding:5px;
	   background:lightseagreen;
	}
	div#search-container{
	   padding:15px 0;
	}
</style>
</head>
<body>
	<div id="emp-container">
		<h2>사원정보</h2>
		<div id="search-container">
	      <!-- action속성값 비워두면 현재 url로 요청. -->
	      <form name="empSearchFrm" action="">
	         <select name="searchType" required>
	            <option value="">검색타입</option>
	            <!-- required여부를 판단할 value="" 반드시 있어야함.-->
	            <option value="emp_id" ${param.searchType == 'emp_id' ? 'selected':'' }>사번</option>
	            <option value="emp_name" ${param.searchType == 'emp_name' ? 'selected':'' }>사원명</option>
	            <option value="email" ${param.searchType == 'email' ? 'selected':'' }>이메일</option>
	            <option value="phone" ${param.searchType == 'phone' ? 'selected':'' }>전화번호</option>
	         </select>
	         <input type="search" name="searchKeyword" value="${param.searchKeyword}" required/>   
	         <input type="submit" value="검색" />
	      </form>
	   </div>
		<table class="tbl-emp">
			<tr>
	         <th></th><!-- 1부터 넘버링 처리 -->
	         <th>사번</th>
	         <th>사원명</th>
	         <th>주민번호</th><!--뒷6자리는 ******처리-->
	         <th>이메일</th>
	         <th>전화번호</th>
	         <th>부서코드</th>
	         <th>직급코드</th>
	         <th>급여레벨</th>
	         <th>급여</th><!--원화기호, 세자리마다 콤마표시-->
	         <th>보너스율</th><!--percent로 표시-->
	         <th>매니져 사번</th>
	         <th>입사일</th><!--날짜형식 yyyy/MM/dd-->
	         <th>퇴사여부</th>
	      	</tr>
	      	<tbody>
	      		<c:if test="${empty list}">
	      			<tr>
	      				<th colspan="14" style="text-align:center;">
	      					조회된 데이터가 없습니다.
	      				</th>
	      			</tr>
	      		</c:if>
	      	
	      		<c:forEach items="${list }" var="emp" varStatus="vs">
	      			<tr>
	      					 <td>${vs.count}</td><!-- 1부터 넘버링 처리 -->
					         <td>${emp.EMP_ID}</td>
					         <td>${emp.EMP_NAME}</td>
					         <td>${fn:substring(emp.EMP_NO,0,8)}******</td> <!--뒷6자리는 ******처리-->
					         <!-- fn 라이브러리로 주민번호 포맷변경 --> 
					         <td>${emp.EMAIL }</td>
					         <td>${emp.PHONE }</td>
					         <td>${emp.DEPT_CODE }</td>
					         <td>${emp.JOB_CODE }</td>
					         <td>${emp.SAL_LEVEL }</td>
					         <td><fmt:formatNumber value="${emp.SALARY }" type="currency" /></td><!--원화기호, 세자리마다 콤마표시-->
					         <td><fmt:formatNumber value="${emp.BONUS }" type="percent"/></td><!--percent로 표시-->
					         <td>${emp.MANAGER_ID }</td>
					         <td><fmt:formatDate value="${emp.HIRE_DATE}" pattern="yyyy/MM/dd"/></td><!--날짜형식 yyyy/MM/dd-->
					         <td>${emp.ENT_YN}</td>
	      			</tr>
	      		</c:forEach>
	      	</tbody>
	      	
		</table>
		
	</div>
</body>
</html>