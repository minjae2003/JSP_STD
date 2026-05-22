<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>members 테이블에 회원 정보 변경</h3>
	<hr><hr>
	<form action="updatePro.jsp" method="post">
		아이디 : <input type="text" name="id" maxlength="50">
		패스워드 : <input type="password" name="passwd" maxlength="20">
		변경할 이름 : <input type="text" name="name" maxlength="30">
		<input type="submit" value="입력하기">
	</form>
</body>
</html>