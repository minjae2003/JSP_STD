<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch12.MembersVO" %>
<%@ page import="ch12.MembersDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    List<MembersVO> recordList = null;
    MembersDAO mDAO = MembersDAO.getInstance();
    recordList = mDAO.getRecords();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
    <h3>members 테이블의 회원 목록</h3>
    <hr>
    <br>

    <table border="1">
        <tr>
            <th width="250">아이디</th>
            <th width="100">패스워드</th>
            <th width="100">이름</th>
            <th width="160">가입일자</th>
        </tr>

<%
        
            for (int i = 0; i < recordList.size(); i++) {
                MembersVO record = recordList.get(i);
%>
        <tr>
            <td><%= record.getId() %></td>
            <td><%= record.getPasswd() %></td>
            <td><%= record.getName() %></td>
            <td><%= sdf.format(record.getReg_date()) %></td>
        </tr>
<%
            }
        
%>
    </table>

    <table>
        <tr>
            <td width="630" align="right">
                <a href="insertMembersForm.jsp">[추가]</a>
                <a href="updateForm.jsp">[수정]</a>
                <a href="deleteForm.jsp">[삭제]</a>
            </td>
        </tr>
    </table>
</body>
</html>