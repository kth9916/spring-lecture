<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 리스트</title>
</head>
<body>
	<center>
		<h1>회원 리스트</h1>
		<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<th bgcolor="orange" width="100">ID</th>
				<th bgcolor="orange" width="100">PASSWORD</th>
				<th bgcolor="orange" width="200">NAME</th>
				<th bgcolor="orange" width="200">ROLE</th>
			</tr>
			<c:forEach items="${userList }" var = "userVO">
			<tr>
				<td>${userVO.id }</td>
				<td>${userVO.password }</td>
				<td>${userVO.name }</td>
				<td>${userVO.role }</td>
			</tr>
			</c:forEach>
		</table>
		<br> <a href="index.jsp">처음으로</a>
	</center>

</body>
</html>