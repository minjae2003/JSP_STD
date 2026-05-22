<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ch10.TestBean = new ch10.TestBean()-->
    <jsp:useBean id="testBean" class="ch10.TestBean" />

    <jsp:setProperty name="testBean" property="name"/>

    <h3>자바빈을 사용하는 jsp페이지</h3>
    <hr>

    입력된 이름은 
    <jsp:getProperty name="testBean" property="name"/>
	
</body>
</html>