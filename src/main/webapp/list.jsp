<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<style>
	table{
		border-collapse: collapse;
		border:1px solid black;
	}
</style>
</head>
<body>
<%
	//Db연결
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/first";
	Connection conn = DriverManager.getConnection(db, "root", "1111");
	
	//쿼리문
	String sql = "select * from member";
	
	//심부름꾼
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
%>
 <table width="800" border="1">
 	<tr height="32">
 		<td>번호</td>
 		<td>이름</td>
 		<td>주소</td>
 		<td>전화번호</td>
 		<td>나이</td>
 		<td>급여</td>
 		<td>수정</td>
 		<td>삭제</td>
 	</tr>
 	<%
 		while(rs.next()){
 	%>
 	<tr>
 		<td><%=rs.getString("id")%></td>
 		<td><%=rs.getString("name")%></td>
 		<td><%=rs.getString("juso")%></td>
 		<td><%=rs.getString("phone")%></td>
 		<td><%=rs.getString("age")%></td>
 		<td><%=rs.getString("pay")%></td>
 		<td><input type="button" value="수정" onClick="location.href='edit.jsp?id=<%=rs.getString("id")%>'"/></td>
 		<td><input type="button" value="삭제" onClick="location.href='del.jsp?id=<%=rs.getString("id")%>'"/></td>
 		
 	</tr>
 	<%
 		}
 	%>
 	<tr>
 		<td colspan="8" align="center"><input type="button" value="글쓰기" onClick="location.href='write.jsp'"></td>
 	</tr>
 </table>
<%
	//닫기
	stmt.close();
	conn.close();
	
	
%>
</body>
</html>