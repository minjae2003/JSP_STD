<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>로그인 폼</h3>
	<hr><br>
	<form action="sessionLoginPro.jsp" method="post">
		아이디 : <input type="text" name="id" maxlength="50"><br>
		패스워드 : <input type="password" name ="passwd" maxlength="20">
		<input type="submit" value="로그인">
		<input type="button" value="회원가입" onclick="location.href = 'insertMembersForm.jsp'">
	</form>
</body>
</html>