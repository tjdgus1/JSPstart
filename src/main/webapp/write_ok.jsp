<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write_ok.jsp</title>
</head>
<body>
<!--  폼에서 넘겨받은 값들을 sql의 테이블에 저장. -->	
</body>
</html>
<%
	String name = request.getParameter("name"); //name변수에, name폼의 값을 가져와서 저장.
	String juso = request.getParameter("juso");
	String phone = request.getParameter("phone");
	String age = request.getParameter("age");
	String pay = request.getParameter("pay");
		
	//DB연결
	Class.forName("com.mysql.jdbc.Driver");  //이 라인에 에러는 jar파일이 없어서::경로및 파일 여부를 확인.
	String db = "jdbc:mysql://localhost:3306/first"; 
	Connection conn = DriverManager.getConnection(db, "root", "1111");
	
	//sql쿼리문, insert
	String sql = "insert into member(name, juso, phone, age, pay) values(?, ?, ?, ?, ?)";
	
	//심부름꾼
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, juso);
	pstmt.setString(3, phone);
	pstmt.setString(4, age);
	pstmt.setString(5, pay);
	
	pstmt.executeUpdate();
	
	//닫기
	pstmt.close();
	conn.close();
	
	response.sendRedirect("list.jsp");
	
%>

