<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri = "http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����(Join) ���� ���</title>
</head>
<body>
<center>
	<h2>����(Join) ���� ���</h2>
	<hr>
	
	<table border="1" width="700" cellspacing="0" cellpadding="0">
		<tr>
			<td>e.empno</td>
			<td>e.ename</td>
			<td>e.sal</td>
			<td>e.deptno</td>
			<td>d.dname</td>
			<td>d.loc</td>
		</tr>
		
		<!-- Loop ���� -->
		
		<c:forEach items="${empList }">
			<tr>
				<td>${empList.empno }</td>
				<td>${empList.ename }</td>
				<td>${empList.sal }</td>
				<td>${empList.deptno }</td>
			</tr>
		</c:forEach>
			
	</table>
</center>

</body>
</html>