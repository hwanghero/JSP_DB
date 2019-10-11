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
		ResultSet rs = null;
		Connection conn = null;
		Statement stmt = null;
		
		out.println("loading<br>");
		

		String url = "jdbc:mysql://localhost:3306/hero?serverTimezone=UTC";        
		String id = "root";                                                
		String pw = "root";
		
		Class.forName("com.mysql.jdbc.Driver");                      
		conn = DriverManager.getConnection(url,id,pw);
		stmt = conn.createStatement();
		out.println("connection<br>");
			
		String sql1 = "select * from insa where id='"+iid+"'";

		rs = stmt.executeQuery(sql1);
		if(rs.next()){
			out.println("o");
		}else{
			String sql2 = "insert into insa(id,pass,name) values('"+iid+"', '"+ipass+"', '"+iname+"')";
			stmt.executeUpdate(sql2);
			out.println("x -> insert");
		}
		stmt.close();
	%>

</body>
</html>
