<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri = "http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>조인(Join) 정보 출력</title>
</head>
<body>

<center> 
	<h2>조인(Join) 정보 출력 </h2>
	<hr> 
	
	<table border = "1" width = "700" cellspacing="0" cellpadding="0">
		<tr> 
			<td>ENO</td>
			<td>ENAME </td>
			<td>JOB</td>
			<td>MANAGER </td>
			<td>HIREDATE</td>
			<td>SALARY </td>
			<td>COMMISSION </td>
			<td>DNO </td>
			<td>DNAME </td>
			<td>LOC </td>		
		</tr>
		
		<!-- Loop 시작  -->
		<c:forEach items ="${joinList}" var="join">
		<tr> 
			<td> ${join.employee_id }</td>
			<td>${join.first_name } </td>
			<td> ${join.last_name }</td>
			<td>${join.email } </td>
			<td> ${join.phone_number }</td>
			<td>${join.hire_date } </td>
			<td>${join.job_id } </td>
			<td>${join.salary } </td>
			<td>${join.commission_pct } </td>		
			<td>${join.manager_id} </td>		
			<td>${join.department_id} </td>		
			<td>${join.location_id} </td>		
			<td>${join.department_name} </td>		
			<td>${join.start_date} </td>		
			<td>${join.end_date} </td>		
			<td>${join.street_address} </td>		
			<td>${join.postal_code} </td>		
			<td>${join.city} </td>		
			<td>${join.state_province} </td>		
			<td>${join.country_id} </td>		
		</tr>
		</c:forEach>
	
	</table>

</center>


</body>
</html>