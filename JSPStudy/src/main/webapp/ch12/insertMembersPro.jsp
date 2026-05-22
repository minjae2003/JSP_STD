<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch12.MembersDAO" %>

<% request.setCharacterEncoding("utf-8"); %>

	<jsp:useBean id="member" class="ch12.MembersVO">
  	 	<jsp:setProperty name="member" property="*" />
	</jsp:useBean>

<%
    MembersDAO mDAO = MembersDAO.getInstance();
    mDAO.insertMember(member);
%>

	<jsp:getProperty name="member" property="id" />님 회원가입 축하드립니다.
