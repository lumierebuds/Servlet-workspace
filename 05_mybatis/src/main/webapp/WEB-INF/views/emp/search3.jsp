<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setLocale value="ko_kr"/>
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
	input#btn-search { width: 350px; background: lightslategray; color: white; box-shadow: 0px 3px 15px grey; }
	table#tbl-search { margin:0 auto; }
	table#tbl-search th,table#tbl-search td {padding:5px 15px;}
	table#tbl-search td {text-align:left;}
</style>
</head>
<body>
   <div id='emp-container'>
      <h2>사원정보</h2>
      <div id="search-container">
      <form name="empSearchFrm" >
         <h3>검색</h3>
         <input type="reset" value="초기화" />
         <table id="tbl-search">
         	<c:set var="jobCodeArr" value="${requestScope.param.jobCodeArr}"></c:set>
         	<!-- 반복문을 이용해 전달된 "jobList(직급목록)" "deptList(부서목록)" 
         		 을 통해서 검색을 위한 체크박스를 만들어준다.
         	 -->
            <tr>
               <th>직급</th>
               <td>
	               	<c:forEach items="${jobList }" var="job">
	               		<input type="checkbox" value="${job.jobCode }"
	               		name="jobCode" id="${job.jobCode}"
	               		${not empty jobCodeArr ?
	               			fn:indexOf(jobCodeArr, job.jobCode) > -1 ? 'checked':''
	               			: ''
	               		 }
	               		>
	               		<label for="${job.jobCode}">${job.jobName}</label>
	               	</c:forEach>
               </td>
            </tr>
            
            <c:set var="deptIdList" value="${requestScope.param.deptIdList}"/>
            <tr>
               <th>부서</th>
               <td>	
               		<!-- "부서" 선택해서 검색한 이후에 "체크"된것 유지  -->
	                <c:forEach items="${deptList }" var="dept" varStatus="vs">
		              	<input type="checkbox" name="deptId" 
		              	id="${dept.deptId}" value="${dept.deptId}"
		              	${not empty deptIdList ?
		              	 deptIdList.contains(dept.deptId) ? 'checked' : ''
		              	 : '' 
		              	 }
		              	>
		              	<label for="${dept.deptId}">${dept.deptTitle}</label>
		              	<c:if test="${vs.count % 3 == 0 }"><br></c:if>
               		</c:forEach>
               		<input type="checkbox" name="deptId"
               			id="D0" value="D0">
               		<label for="D0">부서없음</label>
               </td>
            </tr>
            
            <tr>
               <th colspan="2">
                  <input type="submit" id="btn-search" value="검색"  />
               </th>
            </tr>
         </table>
      </form>
   </div>
      
      
      <table class="tbl-emp">
         <tr>
            <th></th><!-- 1부터 넘버링 처리 -->
            <th>사번</th>
            <th>사원명</th>
            <th>주민번호</th><!--뒷6자리는 ******처리-->
            <th>성별</th><!-- 남,여 -->
            <th>이메일</th>
            <th>전화번호</th>
            <th>부서명</th>
            <th>직급명</th>
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
                  <th colspan="15" style="text-align:center;">
                     조회된 데이터가 없습니다
                  </th>
               </tr>
            </c:if>
            <c:forEach items="${list}" var="emp" varStatus="vs" >
               <tr>
                  <td>${vs.count}</td>
                  <td>
                     <a href="/mybatis/emp/updateEmp.do?empId=${emp.EMP_ID }">${emp.EMP_ID}</a>                  
                  </td>
                  <td>${emp.EMP_NAME}</td>
                  <td>${fn:substring(emp.EMP_NO,0,8)}******</td>
                  <td>${emp.GENDER }</td>
                  <td>${emp.EMAIL }</td>
                  <td>${emp.PHONE }</td>
                  <td>${emp.DEPT_TITLE }</td>
                  <td>${emp.JOB_NAME }</td>
                  <td>${emp.SAL_LEVEL }</td>
                  <td><fmt:formatNumber value="${emp.SALARY}" type="currency" /></td>
                  <td><fmt:formatNumber value="${emp.BONUS }" type="percent"  /></td>
                  <td>${emp.MANAGER_ID }</td>
                  <td><fmt:formatDate value="${emp.HIRE_DATE }" pattern="yyyy/MM/dd"/></td>
                  <td>${emp.ENT_YN}</td>
               </tr>               
            </c:forEach>
            
         </tbody>
      </table>

   </div>
</body>
</html>