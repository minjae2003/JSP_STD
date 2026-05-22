<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="ch12.MembersDAO" %>
 <% request.setCharacterEncoding("utf-8"); %>
 
 <%
 	String id = request.getParameter("id");
 	String passwd = request.getParameter("passwd");
 	
 	MembersDAO mdao = MembersDAO.getInstance();
 	int check = mdao.userCheck(id, passwd);
 	
 	if(check ==1){
 		session.setAttribute("id", id);
 		response.sendRedirect("sessionMain.jsp");
 		
 	}else if(check==0){
 		%>
 			<script>
				alert("비밀번호가 맞지 않습니다")
				history.go(-1);
			</script>
 		<% 
 	}else{
%>
			<script>
				alert("등록된 계정이 없습니다.")
				history.go(-1);
			</script>
<%
 	}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>