<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String name = request.getParameter("name");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null; //select문 실행 결과 저장 객체

try {
	/* Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/basicjsp",
        "jspid", "jsppass"
    );
    
	*/
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/basicjsp");
	conn = ds.getConnection();
	
    String sql = "select id,passwd from members where id=?";
    pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,id);
    rs = pstmt.executeQuery();

   
   
	if(rs.next()){
		String rid = rs.getString("id");
		String rpasswd = rs.getString("passwd");
		if(id.equals(rid) && passwd.equals(rpasswd)){
			sql = "delete from members where id=?";;
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, id);
		    pstmt.executeUpdate();
		    
		    response.sendRedirect("list.jsp");
		}else{
			out.println("패스워드 틀럇습니다");
		}
	}else{
		out.println("아이디가 잘못되었습니다");
	}
} catch(Exception e) {
    e.printStackTrace();
} finally {
	if(rs != null) rs.close();
    try { if(pstmt != null) pstmt.close(); } catch(Exception e) {}
    try { if(conn != null) conn.close(); } catch(Exception e) {}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>