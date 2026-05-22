<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>response 내장 객체</h3>
	<hr>
	현재 페이지는 <b>responseRedirect.jsp</b>페이지 입니다.
	<%
	response.sendRedirect("responseRedirected.jsp");
	
	%>
</body>
</html>