<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
    <% String name = request.getParameter("name"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	포함되는 페이지 includedTest.jsp 입니다<br>
	<%=name %>님 안녕하세여~<br>
	<br>
</body>
</html>