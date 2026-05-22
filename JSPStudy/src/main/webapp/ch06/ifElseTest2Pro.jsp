<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>

<% 
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String result = "";

if(age >= 20) {
   result = "성년";
}
else {
   result = "미성년";
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과</title>
</head>
<body>
	<b><%=name %></b>은(는) <b><%=result %></b>입니다.
</body>
</html>