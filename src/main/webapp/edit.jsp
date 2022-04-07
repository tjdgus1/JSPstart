<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//db연결
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/first";
	Connection conn = DriverManager.getConnection(db, "root", "1111");
	//쿼리문
	String sql = "select * from member where id="+ request.getParameter("id");
	
	//심부름꾼
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	rs.next();	
%>
<h2>수정하기</h2>
	<form method="get" action="edit_ok.jsp">
		<input type="hidden" name="id" value="<%=rs.getString("id")%>" readonly><p/>
		이름<input type="text" name="name" value="<%=rs.getString("name")%>"><p/>
		주소<input type="text" name="juso" value="<%=rs.getString("juso")%>"><p/>
		전화번호<input type="text" name="phone" value="<%=rs.getString("phone")%>"><p/>
		나이<input type="text" name="age" value="<%=rs.getString("age")%>"><p/>
		급여<input type="text" name="pay" value="<%=rs.getString("pay")%>"><p/>
		<input type="submit" value="수정하기">
	</form>
<%
	//닫기
%>
</body>
</html>