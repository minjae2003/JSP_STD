<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="qna.QnaDAO, qna.QnaDTO, qna.QnaCommentDTO, java.util.List, java.text.SimpleDateFormat" %>
<%
    int num = Integer.parseInt(request.getParameter("num"));
    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) pageNum = "1";

    QnaDAO dao = QnaDAO.getInstance();
    QnaDTO article = dao.getQnaArticle(num);

    String memId = (String) session.getAttribute("id");
    if (memId == null) memId = "";

    // 비밀글 권한 확인
    if ("Y".equals(article.getSecret())) {
        if (memId.isEmpty() || (!memId.equals(article.getWriter()) && !memId.equals("admin"))) {
%>
            <script>
                alert("비밀글은 작성자와 관리자만 확인할 수 있습니다.");
                history.back();
            </script>
<%
            return;
        }
    }

    dao.updateReadCount(num);
    List<QnaCommentDTO> commentList = dao.getQnaComments(num);
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q & A 내용 보기</title>
<style>
    * { margin: 0; padding: 0; box-sizing: border-box; font-family: '맑은 고딕', 'Malgun Gothic', sans-serif; }

    #top { display: flex; justify-content: space-between; align-items: center; padding: 15px 40px; background-color: #fff; }
    #top h3 a { font-size: 22px; font-weight: bold; color: #000; text-decoration: none; }
    #topmenu { list-style: none; display: flex; align-items: center; gap: 8px; font-size: 12px; color: #333; }
    #topmenu a { color: #333; text-decoration: none; }

    #menubar { background-color: #494158; height: 42px; width: 100%; }
    #menubar ul { list-style: none; display: flex; justify-content: center; align-items: center; height: 100%; }
    #menubar li { margin: 0 35px; }
    #menubar a { color: #ffffff; text-decoration: none; font-weight: bold; font-size: 14px; }

    .content-body { padding: 30px 40px; }
    .sub-title { font-size: 18px; font-weight: bold; margin-bottom: 20px; color: #000; }

    .view-container { width: 100%; border-top: 1px solid #ddd; }
    .view-header { display: flex; justify-content: space-between; align-items: center; padding: 12px 10px; border-bottom: 1px solid #e0e0e0; font-size: 13px; }
    .view-title { font-weight: bold; color: #000; }
    .view-info { color: #333; }

    .view-content { padding: 30px 10px; min-height: 180px; font-size: 13px; color: #333; line-height: 1.6; border-bottom: 1px solid #e0e0e0; white-space: pre-wrap; }

    .btn-container { text-align: right; margin: 15px 0 25px 0; }
    .btn-style { background-color: #ffffff; border: 1px solid #b0b0b0; padding: 5px 14px; font-size: 12px; cursor: pointer; color: #333; margin-left: 4px; }
    .btn-style:hover { background-color: #f0f0f0; }

    .comment-list-box { margin-bottom: 15px; border-top: 1px solid #eee; }
    .comment-item { padding: 10px; border-bottom: 1px solid #eee; font-size: 12px; }
    .comment-item-head { font-weight: bold; color: #333; margin-bottom: 4px; display: flex; justify-content: space-between; align-items: center; }
    .comment-item-head .info { display: flex; align-items: center; }
    .comment-item-head span { font-size: 11px; color: #888; font-weight: normal; margin-left: 8px; }
    .comment-item-body { color: #555; white-space: pre-wrap; margin-top: 4px; }

    .btn-comment-del { background: none; border: none; color: #888; font-size: 11px; cursor: pointer; text-decoration: underline; }
    .btn-comment-del:hover { color: #d9534f; }

    .comment-box { border: 1px solid #e0e0e0; background-color: #fafafa; padding: 15px 20px; display: flex; align-items: center; gap: 15px; }
    .comment-writer { width: 80px; text-align: center; font-size: 13px; font-weight: bold; color: #333; }
    .comment-input-area { flex: 1; }
    .comment-textarea { width: 100%; height: 50px; border: 1px solid #a6a6a6; padding: 6px 8px; font-size: 12px; resize: none; outline: none; background-color: #fff; }
</style>
<script>
    function deleteCheck() {
        if (confirm("정말 이 글을 삭제하시겠습니까?")) {
            location.href = "qnaDeletePro.jsp?num=<%= article.getNum() %>&pageNum=<%= pageNum %>";
        }
    }

    function deleteCommentCheck(cNum) {
        if (confirm("댓글을 삭제하시겠습니까?")) {
            location.href = "qnaCommentDeletePro.jsp?c_num=" + cNum + "&num=<%= article.getNum() %>&pageNum=<%= pageNum %>";
        }
    }
</script>
</head>
<body>

    <%@ include file="/module/header.jsp" %>

    <div class="content-body">
        <div class="sub-title">Q & A ＞ 내용 보기</div>

        <div class="view-container">
            <div class="view-header">
                <div class="view-title">제 목 : <%= article.getSubject() %></div>
                <div class="view-info">
                    <%= article.getWriter() %> &nbsp;|&nbsp; 
                    <%= sdf.format(article.getReg_date()) %> &nbsp;|&nbsp; 
                    조회 <%= article.getReadcount() %>
                </div>
            </div>

            <div class="view-content"><%= article.getContent() %></div>
        </div>

        <div class="btn-container">
            <% if (!memId.isEmpty() && (memId.equals(article.getWriter()) || memId.equals("admin"))) { %>
                <button type="button" class="btn-style" onclick="location.href='qnaUpdate.jsp?num=<%= article.getNum() %>&pageNum=<%= pageNum %>'">수정</button>
                <button type="button" class="btn-style" onclick="deleteCheck()">삭제</button>
            <% } %>
            <button type="button" class="btn-style" onclick="location.href='qnaList.jsp?pageNum=<%= pageNum %>'">목록</button>
        </div>

        <% if (commentList != null && !commentList.isEmpty()) { %>
            <div class="comment-list-box">
                <% for (QnaCommentDTO c : commentList) { %>
                    <div class="comment-item">
                        <div class="comment-item-head">
                            <div class="info">
                                <%= c.getWriter() %> <span><%= sdf.format(c.getReg_date()) %></span>
                            </div>
                            <% if (!memId.isEmpty() && (memId.equals(c.getWriter()) || memId.equals("admin"))) { %>
                                <button type="button" class="btn-comment-del" onclick="deleteCommentCheck(<%= c.getC_num() %>)">삭제</button>
                            <% } %>
                        </div>
                        <div class="comment-item-body"><%= c.getContent() %></div>
                    </div>
                <% } %>
            </div>
        <% } %>

        <form action="qnaCommentPro.jsp" method="post">
            <input type="hidden" name="num" value="<%= article.getNum() %>">
            <input type="hidden" name="pageNum" value="<%= pageNum %>">
            
            <div class="comment-box">
                <div class="comment-writer">
                    <%= memId.isEmpty() ? "손님" : memId %>
                </div>
                <div class="comment-input-area">
                    <textarea name="comment" class="comment-textarea" required></textarea>
                </div>
                <div>
                    <button type="submit" class="btn-style" style="height: 50px; padding: 0 16px;">입력</button>
                </div>
            </div>
        </form>
    </div>

</body>
</html>