<%@page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원등록</title>
</head>
<body>
	<center>
		<h1>회원 등록</h1>
		<hr>
		<form action="insertUser.do" method="post">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="orange" width="70">ID</td>
					<td align="left"><input type="text" name="id" /></td>
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
						value=" 회원 가입 " /></td>
				</tr>
			</table>
		</form>
		<hr>
	</center>
</body>
</html>