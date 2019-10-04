<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("euc-kr");%>

<html>
<head>
	<meta charset="UTF-8"> 
	<title>db</title>
	
	<script language='javascript'>
		function insert(){
			if(document.frm1.iid.value == ""){
				alert("id를 입력하세요");
				return false;
			}
			if(document.frm1.ipass.value == ""){
				alert("pw를 입력하세요");
				return false;	
			}
			if(document.frm1.iname.value == ""){
				alert("name를 입력하세요");
				return false;
			}
				
			document.frm1.submit();
		}
		function delete1(){
			if(document.frm1.iid.value == ""){
				alert("id를 입력하세요");
				return false;
			}
			alert("delete");
			window.location="delete.jsp?iid="+document.frm1.iid.value;
		}
		function update1(){
			if(document.frm1.iid.value == ""){
				alert("id를 입력하세요");
				return false;
			}
			alert("update");
			document.frm1.action="update_from.jsp";
			document.frm1.submit();
		}
	</script>
</head>
<body>
	<form name='frm1' method='post' action="insert.jsp">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type='text' name='iid'></td>
		</tr>
		<tr>
			<td>비번</td>
			<td><input type='text' name='ipass'></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type='text' name='iname'></td>
		</tr>
		<tr>
			<td colspan='2'>
				<input type='button' value='insert' onclick='insert()'>
				<input type='button' value='delete' onclick='delete1()'>
				<input type='button' value='update' onclick='update1()'>
			</td>
		</tr>
	</table>
	<!-- <input type='submit' value='확인'> -->
	</form>
</body>
</html>
