<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*,java.util.*" %>
<%
	String rollNo=request.getParameter("rollno");
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	String course=request.getParameter("course");
	String branch=request.getParameter("branch");
	
	try{
		Connection con=ConnectionProvider.getCon();
		//Class.forName("com.mysql.jdbc.Driver");
		//Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marks_entry??useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
		Statement st=con.createStatement();
		int i=st.executeUpdate("insert into student values('"+rollNo+"','"+name+"','"+gender+"','"+course+"','"+branch+"')");
		response.sendRedirect("facultyHome.jsp");
	}catch(Exception e){
		out.print("Insertion Problem "+e);
	}
%>