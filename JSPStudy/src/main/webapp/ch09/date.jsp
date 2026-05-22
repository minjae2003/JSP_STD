<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   Date date = new Date();
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
   String strdate = sdf.format(date);
%>
<br>
오늘 날짜는 <%= strdate %>입니다
<br>
</body>
</html>