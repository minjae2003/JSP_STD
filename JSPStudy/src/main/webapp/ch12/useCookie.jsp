<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>웹브라우저에 저장된 쿠키가저오는 패이지</h3>
	<hr>
	
	<%
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(int i= 0; i<cookies.length;i++){
				if(cookies[i].getName().equals("id")){
					%>
					 쿠키의 이름은 "<%= cookies[i].getName() %>"이고
					 쿠키의 값은 "<%= cookies[i].getValue() %>"이다
					<% 
				}
			}
		}
	%>
</body>
</html>