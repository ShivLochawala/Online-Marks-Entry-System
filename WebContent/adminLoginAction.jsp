<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*,java.util.*" %>
<% 
	String uname = request.getParameter("username");
	String upass = request.getParameter("password");
	String is_hod = "1";
	String is_coordinator = "1";
	String is_faculty = "1";
	try{
		Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		String qry = "SELECT * FROM users WHERE user_name='"+uname+"' AND password='"+upass+"'";
		ResultSet resultSet =st.executeQuery(qry);
		if(resultSet.next()){
			if(uname.equals(resultSet.getString("user_name")) && upass.equals(resultSet.getString("password")) && is_faculty.equals(resultSet.getString("is_faculty"))){
				response.sendRedirect("facultyHome.jsp");
			}else if(uname.equals(resultSet.getString("user_name")) && upass.equals(resultSet.getString("password")) && is_coordinator.equals(resultSet.getString("is_coordinator")) ){
				response.sendRedirect("coordinatorHome.jsp");
			}else if(uname.equals(resultSet.getString("user_name")) && upass.equals(resultSet.getString("password")) && is_hod.equals(resultSet.getString("is_hod"))){
				response.sendRedirect("adminHome.jsp");
			}
			session.setAttribute("uname",uname); 
		}
		else{
			response.sendRedirect("errorAdminLogin.html");
		}
	}catch(Exception e){
		out.print("Insertion Problem "+e);
	}
	
%>