<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<%
    String name = request.getParameter("name");
    String pageName = request.getParameter("pageName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	파라미터 값을 전달 받아 실행되는 <br>
	포함되는 페이지<%=pageName %>입니다<br>
	<b><%=name %></b>님 안녕하세여<br>
</body>
</html>