<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 소개 사이트</title>
</head>
<body>
    <div id="top">
        <h3><a href="../main/main.jsp">도서 소개 사이트</a></h3>

        <ul id="topmenu">
        <%
            String id = "";
            try {
                id = (String) session.getAttribute("id");

                if (id == null || id.equals("")) {
        %>
                    <li><a href="../member/memberForm.jsp">회원가입</a></li>
                    <li>|</li>
                    <li><a href="../member/loginForm.jsp">로그인</a></li>
        <%
                } else {
        %>
                    <li><%= id %>님</li>
                    <li>|</li>
                    <li><a href="../member/LogoutPro.jsp">로그아웃</a></li>
                    <li>|</li>
                    <li><a href="../member/memberupdateForm.jsp">정보수정</a></li>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        </ul>
    </div>

    <nav id="menubar">
        <ul>
            <li><a href="../main/main.jsp">HOME</a></li>
            <li><a href="../book/booklist.jsp">도서소개</a></li>
            <li><a href="../freeboard/list.jsp">게시판</a></li>
            <li><a href="../qna/qnaList.jsp">Q & A</a></li>
            <li><a href="../finalPage/index.jsp">사이트 소개</a></li>
        </ul>
    </nav>
</body>
</html>