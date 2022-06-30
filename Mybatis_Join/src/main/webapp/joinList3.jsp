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
			<td> ${join.emps.employee_id }</td>
			<td>${join.emps.first_name } </td>
			<td> ${join.emps.last_name }</td>
			<td>${join.emps.email } </td>
			<td> ${join.emps.phone_number }</td>
			<td>${join.emps.hire_date } </td>
			<td>${join.emps.job_id } </td>
			<td>${join.emps.salary } </td>
			<td>${join.emps.commission_pct } </td>		
			<td>${join.emps.manager_id} </td>		
			<td>${join.emps.department_id} </td>		
			<td>${join.depts.location_id} </td>		
			<td>${join.depts.department_name} </td>		
			<td>${join.j_h.start_date} </td>		
			<td>${join.j_h.end_date} </td>		
			<td>${join.locs.street_address} </td>		
			<td>${join.locs.postal_code} </td>		
			<td>${join.locs.city} </td>		
			<td>${join.locs.state_province} </td>		
			<td>${join.locs.country_id} </td>		
		</tr>
		</c:forEach>
	
	</table>

</center>


</body>
</html>