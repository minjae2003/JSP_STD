<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<%! //선언문 - 전역 변수, 메서스 선언
	String str1 = "전역 변수입니다.";
	String getStr(){
		return str1;
	} %>
<body>
	<h3>선언문,스트립트릿, 표현식의 쓰임을 알아보는 예제</h3>
	<hr>
	<%//스트립트릿
		String str2 = "지역 변수입니다~~";//지역변수
	%>
	스트립트에서 선언한 변수 Str2는 <%=str2 %><br>
	선언물에서 선언한 변수는 St1는 <%=str1 %>
	
</body>
</html>