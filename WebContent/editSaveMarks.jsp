<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*,java.util.*" %>
<%
	String Countrow="";
	int count = 0;
	String rollNo = "";
	
	try{
		Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		//String qry = "SELECT count(*) FROM student";
		//ResultSet resultSet =st.executeQuery(qry);
		
		String qry1 = "SELECT rollNo FROM student";
		ResultSet resultSet1 =st.executeQuery(qry1);
		resultSet1.getRow();
		int i = 1;
		while(resultSet1.next()){
		rollNo = resultSet1.getString("rollNo");
		
		//while(resultSet.next()){
		//Countrow = resultSet.getString(1);
		//count = Integer.parseInt(Countrow);
		//out.println("Total Row :" +count);
			while(i<=resultSet1.getRow()){
				String Advjava=request.getParameter("Advjava"+rollNo);
				String PHP=request.getParameter("PHP"+rollNo);
				String CN=request.getParameter("CN"+rollNo);
				String TE=request.getParameter("TE"+rollNo);
				String Lab=request.getParameter("Lab"+rollNo);
				Statement st1=con.createStatement();
				st1.executeUpdate("UPDATE marks SET advJava="+Advjava+", PHP="+PHP+", CN="+CN+", TE="+TE+", Lab="+Lab+" WHERE rollNo='"+rollNo+"'");
				i++;
			}
		}
		Statement st2 = con.createStatement();
		st2.executeUpdate("UPDATE lock_request SET coordinator_lock=1");
		response.sendRedirect("coordinatorHome.jsp");
	}
	catch(Exception e){
		Connection con=ConnectionProvider.getCon();
		Statement st2 = con.createStatement();
		st2.executeUpdate("UPDATE lock_request SET coordinator_lock=1");
		response.sendRedirect("coordinatorHome.jsp");
		//out.print("Insertion Problem "+e);
	}
%>