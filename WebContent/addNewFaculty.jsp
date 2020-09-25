<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*,java.util.*" %>
<%
	String fname=request.getParameter("fname");
	String qualification=request.getParameter("qualification");
	String gender=request.getParameter("gender");
	String emailid=request.getParameter("emailid");
	String mobno=request.getParameter("mobno");
	String pass=request.getParameter("pass");
	int is_hod = 0;
	int is_coordinator = 0;
	int is_faculty = 1;
	
	try{
		Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		int i=st.executeUpdate("insert into users(user_name, qualification, gender, email_id, mobile_no, password, is_hod, is_coordinator, is_faculty) values('"+fname+"','"+qualification+"','"+gender+"','"+emailid+"','"+mobno+"','"+pass+"',"+is_hod+","+is_coordinator+","+is_faculty+")");
		response.sendRedirect("adminHome.jsp");
	}catch(Exception e){
		out.print("Insertion Problem "+e);
	}
%>
 