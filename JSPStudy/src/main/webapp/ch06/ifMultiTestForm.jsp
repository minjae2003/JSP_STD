<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름과 전화번호를 입력하는 폼</title>
</head>
<body>
<h3>이름과 전화번호를 입력하세요.</h3>
<hr>
<form method="post" action="ifMultiTestPro.jsp">
이름 : <input type="text" name="name"><br>

전화 번호 : 
<select name="local">
    <option value="서울">서울</option>
    <option value="경기">경기</option>
    <option value="경남">경남</option>
    <option value="휴대폰">휴대폰</option>
</select>
<input type="text" name="tel" size ="6"> -
<input type="text" name= "tel2" size ="6"><br>
<input type="submit" value="입력완료"><br>
</form>
</body>
</html>