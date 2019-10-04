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
		<title>update</title>
	</head>
	<body>
		<%
			String iid = request.getParameter("iid");

			PreparedStatement pstmt = null;
			PreparedStatement pstmt_insert = null;
			ResultSet rs = null;
			Connection conn = null;
			Statement stmt = null;

			String url = "jdbc:mysql://localhost:3306/hero?serverTimezone=UTC";        
			String id = "root";                                                
			String pw = "root";
			
			Class.forName("com.mysql.jdbc.Driver");                      
			conn = DriverManager.getConnection(url,id,pw);     

			String sql2 = "select * from insa where id=?";

			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, iid);
			pstmt.executeQuery();
				
			rs = pstmt.executeQuery();

			if(rs.next()){
		%>
		<body>
			<form name='frm1' method='post' action="update.jsp">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type='text' name='iid' value="<%=iid%>"></td>
				</tr>
				<tr>
					<td>비번</td>
					<td><input type='text' name='ipass' ></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type='text' name='iname' value="<%=rs.getString("name")%>"></td>
				</tr>
				<tr>
					<td colspan='2'>
						<input type='submit' value='확인'>
					</td>
				</tr>
			</table>
			</form>
		</body>
		<%}else{
			out.println("x");
		}
		%>
</html>