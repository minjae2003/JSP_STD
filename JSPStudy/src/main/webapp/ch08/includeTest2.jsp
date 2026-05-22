<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>
<%
    String name = "홍길동";
    String pageName = "includedTest2.jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    포함하는 페이지 includTest2.jsp 입니다<br>
    포함되는 페이지에 파라미터 값을 전달합니다<br>
    <hr>
    
    <jsp:include page="<%=pageName %>" flush="false">
        <jsp:param name="name" value="<%=name %>" />
        <jsp:param name="pageName" value="<%=pageName %>" />
    </jsp:include>
    
</body>
</html>