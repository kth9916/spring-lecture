<%@page contentType="text/html; charset=EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원정보수정</title>
</head>
<body>
	<center>
		<h1>회원 정보 수정</h1>
		<hr>
		<form action="updateUser.do" method="post">
		
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="orange">아이디</td>
					<td align="left"><input name="id" type="text" value="${user.id }" readonly /></td>
				</tr>
				<tr>
					<td bgcolor="orange">비밀번호</td>
					<td align="left"><input type="password" name="password" size="10" /></td>
				</tr>
				<tr>
					<td bgcolor="orange">이름</td>
					<td align="left"><input type="text" name="name" size="10" /></td>
				</tr>		
				<tr>
					<td bgcolor="orange">역활</td>
					<td align="left"><input type="text" name="role" size="10" /></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value=" 회원 정보 수정 " /></td>
				</tr>
			</table>
		</form>
		
		
		<hr>
	</center>
</body>
</html>