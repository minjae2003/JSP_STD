<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

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
	Connection conn = null;//데이터 베이스 연결 객체
	PreparedStatement pstmt = null;//쿼리 실행 객체
	ResultSet rs = null; //select문 실행 결과 저장 객체
	
	try{
		/*
		String jdbcURL = "jdbc:mysql://localhost:3306/basicjsp";
		String dbID = "jspid";
		String dbPW = "jsppass";
		
		Class.forName("com.mysql.jdbc.Driver");//jdbc 드라이버 로딩
		conn = DriverManager.getConnection(jdbcURL,dbID,dbPW);//db서버 접속
		*/
		InitialContext ic = new InitialContext();
		DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/basicjsp");
		conn = ds.getConnection();
		
		String sql = "select * from members";
		pstmt = conn.prepareStatement(sql);//sql을 실행하기 위한 객체 생성
		rs = pstmt.executeQuery();//sql 실행
		
		while(rs.next()){
			//테이블 컬럼명 가져오기
			String id = rs.getString("id");
			String pw = rs.getString("passwd");
			String name = rs.getString("name");
			String reg_date = rs.getString("reg_date");
			
		%>
		
		<tr>
			<td><%= id %></td>
			<td><%= pw %></td>
			<td><%= name %></td>
			<td><%= reg_date %></td>
		</tr>
		<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		//자원 해제
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
%>

 </table>


  <table>
  	<tr>
  		<td width="630" align="right">
  			<a href="insertForm.jsp">[추가]</a> 
  			<a href="updateForm.jsp">[수정]</a>
  			<a href="deleteForm.jsp">[삭제]</a>
  		</td>
  	</tr>
  </table>  
</body>
</html>