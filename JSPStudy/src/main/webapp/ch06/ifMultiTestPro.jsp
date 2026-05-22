<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>

	<% 
		String name = request.getParameter("name");
		String local = request.getParameter("local");
		String tel = request.getParameter("tel");
		String tel2 = request.getParameter("tel2");
		String localNum = "";
		
		if(local.equals("서울")){
			localNum = "02";
		}else if(local.equals("경기")){
			localNum = "031";
		}else if(local.equals("경남")){
			localNum = "055";
		}else if(local.equals("휴대폰")){
			localNum = "010";
		}
		
	%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>로그인 결과</h3>
	<hr>
	<b><%=name%></b>님의 전화번호는 <%=localNum %> - <%=tel %> - <%=tel2 %>입니다.
	
	
</body>
</html>