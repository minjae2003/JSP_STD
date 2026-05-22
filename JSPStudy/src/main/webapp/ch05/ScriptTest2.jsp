<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.Timestamp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간 출력</title>
</head>
<body>
    <h3>JSP예제- 활용</h3>
    <hr>
    <%
        Timestamp now = new Timestamp(System.currentTimeMillis());
    %>
    현재는 <%= now.getHours() %>시 <%= now.getMinutes() %>분입니다.
</body>
</html>