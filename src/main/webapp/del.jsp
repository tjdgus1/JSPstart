<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>   
<%
	//db연결
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/first";
	Connection conn = DriverManager.getConnection(db, "root", "1111");
	
	//쿼리
	String sql = "delete from member where id=" + request.getParameter("id");
	
	//심부름꾼
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	
	//닫기
	stmt.close();
	conn.close();
	
	response.sendRedirect("list.jsp");

%>