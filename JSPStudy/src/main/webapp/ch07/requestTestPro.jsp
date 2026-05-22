<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>

	<% 
		String name = request.getParameter("name");
		String num = request.getParameter("num");
		String grade = request.getParameter("grade");
		String subject = request.getParameter("subject");
		
		
		
	%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>학생 정보</h3>
	<hr>
	<table border="1">
		<tr>
			<th width="150">학번</th>
			<td width="150"><%=num %></td>
		</tr>	
		<tr>
			<th width="150">이름</th>
			<td width="150"><%=name %></td>
		</tr>	
		<tr>
			<th width="150">학년</th>
			<td width="150"><%=grade %></td>
		</tr>	
		<tr>
			<th width="150">선택과목</th>
			<td width="150"><%=subject %></td>
		</tr>
		
		
		
	</table>
	
</body>
</html>