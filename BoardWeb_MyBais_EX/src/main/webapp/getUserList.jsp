<%@page contentType="text/html; charset=EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!-- 다국어 처리 태그 라이브러리 등록 -->
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원내역</title>
</head>
<body>
	<center>
		<h1>회원 내역</h1>
		<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<th bgcolor="orange" width="100">ID</th>
				<th bgcolor="orange" width="200">NAME</th>
				<th bgcolor="orange" width="150">ROLE</th>
			</tr>
			<c:forEach items="${userList }" var="user">
				<tr>
					<td>${user.id }</td>
					<td align="left">${user.name }</a></td>
					<td>${user.role }</td>
				</tr>
			</c:forEach>
		</table>
		<br> <a href="index.jsp">인덱스</a>
	</center>
</body>
</html>