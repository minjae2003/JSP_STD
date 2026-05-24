<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="freeboard.FreeboardDAO" %>
<%@ page import="freeboard.FreeboardVO" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	request.setCharacterEncoding("UTF-8");

	int num = Integer.parseInt(request.getParameter("num"));

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	FreeboardDAO fbdao = FreeboardDAO.getInstance();
	FreeboardVO fb = fbdao.getFreeboard(num);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 소개</title>

<link href="../css/common.css" rel="stylesheet" type="text/css">
<link href="../css/board.css" rel="stylesheet" type="text/css">

<script>
	function del(num) {
		if(confirm("삭제하시겠습니까?")) {
			location.href = "deletePro.jsp?num=" + num;
		} else {
			location.href = "list.jsp";
		}
	}
</script>
</head>

<body>

<header>
  <jsp:include page="../module/header.jsp" flush="false"/>
</header>

<section>
<h2>자유 게시판 > 내용 보기</h2>

<div id="board_box">
<ul id="view_content">

	<li>
		<span class="col1"><b>제 목 : <%= fb.getSubject() %></b></span>
		<span class="col2">
			<%= fb.getWriter() %> |
			<%= sdf.format(fb.getReg_date()) %> |
			조회 <%= fb.getReadcount() %>
		</span>
	</li>

	<li id="text">
		<%= fb.getContent() %>
	</li>

</ul>

<ul class="buttons">
<%
	String id = (String)session.getAttribute("id");

	if(id != null && id.equals(fb.getWriter())) {
%>
	<li>
		<button onclick="location.href='updateForm.jsp?num=<%= fb.getNum() %>'">
			수정
		</button>
	</li>

	<li>
		<button onclick="del(<%= fb.getNum() %>)">
			삭제
		</button>
	</li>

	<li>
		<button onclick="location.href='list.jsp'">
			목록
		</button>
	</li>
<%
	} else {
%>
	<li>
		<button onclick="location.href='list.jsp'">
			목록
		</button>
	</li>
<%
	}
%>
</ul>

</div>
</section>

<footer>
  <jsp:include page="../module/footer.jsp" flush="false"/>
</footer>

</body>
</html>