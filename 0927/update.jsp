<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("euc-kr");%>


<html>
<head>
	<meta charset="UTF-8"> 
	<title>insert</title>

</head>
<body>
	<%
	
		String iid = request.getParameter("iid");
		String ipass = request.getParameter("ipass");
		String iname = request.getParameter("iname");
		
		PreparedStatement pstmt = null;
		PreparedStatement pstmt_insert = null;
		ResultSet rs = null;
		Connection conn = null;
		Statement stmt = null;
		
		out.println("loading<br>");
		

		String url = "jdbc:mysql://localhost:3306/hero?serverTimezone=UTC";        
		String id = "root";                                                
		String pw = "root";
		
		Class.forName("com.mysql.jdbc.Driver");                      
		conn = DriverManager.getConnection(url,id,pw);              
		out.println("connection<br>");
			
		String sql1 = "select * from insa where id="+iid;
		String sql2 = "select * from insa where id=?";

		pstmt = conn.prepareStatement(sql2);
		pstmt.setString(1, iid);
		pstmt.executeQuery();
			
		rs = pstmt.executeQuery();
		if(rs.next()){
			String sql3 = "update insa set pass=?, name=? where id=?";
			pstmt_insert = conn.prepareStatement(sql3);
			pstmt_insert.setString(1, ipass);
			pstmt_insert.setString(2, iname);
			pstmt_insert.setString(3, iid);
			pstmt_insert.executeUpdate();
			out.println(iid+","+ipass+","+iname);
			out.println("o -> update");
			pstmt_insert.close();
		}else{
			out.println("x");
			pstmt.close();
		}
		pstmt.close();
	%>

</body>
</html>
