<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>

	<% 
		int num = Integer.parseInt(request.getParameter("num"));
	%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th width="100">글번호</th>
			<th width="100">글제목</th>
			<th width="100">글내용</th>
		</tr>
		<% for(int i=1;i<=num;i++){
			%>
			<tr>
				<th ><%=i %></th>
			<th>제목<%=i %></th>
			<th>내용<%=i %></th>
			</tr>
			<% 
		}
		
		%>
	</table>
</body>
</html>