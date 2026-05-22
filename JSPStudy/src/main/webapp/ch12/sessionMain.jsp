<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 완료 페이지</title>
</head>
<body>
<%
    String id = "";
    
    try {
        id = (String)session.getAttribute("id");
        
        if(id == null || id.equals("")) {
            response.sendRedirect("sessionLoginForm.jsp");
        } else {
%>
            <b><%= id %></b>님이 로그인 하셨습니다.
            <form method="post" action="sessionLogout.jsp">
                <input type="submit" value="로그아웃">
            </form>
<%
        } 
    } catch(Exception e) { 
        e.printStackTrace();
    }
%>
</body>
</html>