<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="freeboard.FreeboardDAO" %>
<%@ page import="freeboard.FreeboardVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	int count = 0;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	List<FreeboardVO> fbList = null;

	FreeboardDAO fbdao = FreeboardDAO.getInstance();

	count = fbdao.getFreeboardCount();

	if(count > 0) {
		fbList = fbdao.getFreeboards();
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 소개</title>
<link href="../css/common.css" rel="stylesheet" type="text/css">
<link href="../css/board.css" rel="stylesheet" type="text/css">
</head>
<body>

<header>
  <jsp:include page="../module/header.jsp" flush="false"/>
</header>

<section>
<h2>자유 게시판 > 목록 보기</h2>

<div id="board_box">
<ul id="board_list">
	<li>
		<span class="col1"><b>번호</b></span>
		<span class="col2"><b>제 목</b></span>
		<span class="col3"><b>글쓴이</b></span>
		<span class="col4"><b>등록일</b></span>
		<span class="col5"><b>조회</b></span>
	</li>

<%
	if(fbList != null) {
		for(int i = 0; i < fbList.size(); i++) {
			FreeboardVO fb = fbList.get(i);
%>
	<li>
		<span class="col1"><%= count-- %></span>
		<span class="col2">
			<a href="content.jsp?num=<%= fb.getNum() %>">
				<%= fb.getSubject() %>
			</a>
		</span>
		<span class="col3"><%= fb.getWriter() %></span>
		<span class="col4"><%= sdf.format(fb.getReg_date()) %></span>
		<span class="col5"><%= fb.getReadcount() %></span>
	</li>
<%
		}
	}
%>
</ul>

<ul class="buttons">
<li>
<%
	String id = (String)session.getAttribute("id");

	if(id == null || id.equals("")) {
%>
	<a href="javascript:alert('로그인 후 이용해 주세요!')">
		<button>글쓰기</button>
	</a>
<%
	} else {
%>
	<button onclick="location.href='writeForm.jsp'">글쓰기</button>
<%
	}
%>
</li>
</ul>

</div>
</section>

<footer>
  <jsp:include page="../module/footer.jsp" flush="false"/>
</footer>

</body>
</html>