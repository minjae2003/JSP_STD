<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forward 액션 태그</title>
</head>
<body>
   <h3>forward 액션 태그</h3>
   <hr>
   <form method="post" action="forwardToTest.jsp">
      아이디 : <input type="text" name="id"><br>
      취미 : 
      <select name = "hobby">
         <option value="WOW">WOW</option>
         <option value="만화보기">만화보기</option>
         <option value="스타2">스타2</option>
      </select><br>
      <input type="submit" value="입력완료">
   </form>
</body>
</html>