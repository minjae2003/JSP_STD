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
	
    String sql = "insert into members values (?, ?, ?, now())";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    pstmt.setString(2, passwd);
    pstmt.setString(3, name);

    pstmt.executeUpdate();

   
    response.sendRedirect("list.jsp");

} catch(Exception e) {
    e.printStackTrace();
} finally {
    try { if(pstmt != null) pstmt.close(); } catch(Exception e) {}
    try { if(conn != null) conn.close(); } catch(Exception e) {}
}
%>