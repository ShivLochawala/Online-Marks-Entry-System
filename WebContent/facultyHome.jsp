<%@include file="header.html"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*,java.util.*" %>
<%
String name=(String)session.getAttribute("uname");  
if(name == null)
{
	out.print("Please Login First");
	response.sendRedirect("index.html");
}
%>
<!DOCTYPE html>
<html>
<title>Online Marks Entry System</title>
<link rel="icon" href="mitlogo.jpeg">
<body>
<img src="MIT-WPU.png" width="250" height="100">
<img src="mitlogo.jpeg" align="right"  width="125" height="100">

<h4><% 
out.print("<center>Welcome "+name+" In Faculty Side</center>"); 
%></h4>
<div class="w3-container">
  <div class="w3-bar w3-black">
    <button class="w3-bar-item w3-button tablink w3-red" onclick="openCity(event,'London')">Add New Student</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'Paris')">Insert Marks</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'Tokyo')">Students Details</button>
     <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'Tokyo1')">All Student Marks</button>
     <a href="logout.jsp" class="w3-bar-item w3-button tablink">Logout</a>
  </div>
  
  <div id="London" class="w3-container w3-border city">
  <br>
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">



    <link rel="icon" href="Favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
<main class="my-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Add New Students</div>
                        <div class="card-body">
                            <form name="my-form" onsubmit="return validform()" action="addNewStudent.jsp" method="post">
                                <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">Roll Number</label>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" name="rollno" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="phone_number" class="col-md-4 col-form-label text-md-right">Name</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="name" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="permanent_address" class="col-md-4 col-form-label text-md-right">Gender</label>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" name="gender" required>
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right">Course Name</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="course" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="email_address" class="col-md-4 col-form-label text-md-right">Branch Name</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="branch" required>
                                    </div>
                                </div>

                                    <div class="col-md-6 offset-md-4">
                                        <button type="submit" class="btn btn-primary">
                                        Save
                                        </button>
                                    </div>
                            </form>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</main>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
  </div>

  <div id="Paris" class="w3-container w3-border city" style="display:none">
  <br>
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">



    <link rel="icon" href="Favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

</head>
<body>



<main class="my-form">

<section>
  <!--for demo wrap-->
  <h1 style="color:white;">Insert Marks</h1>
  <div class="tbl-header">
    <% 
    try{
    	int faculty_lock = 0;
		int coordinator_lock = 0;
    	Connection con=ConnectionProvider.getCon();
		Statement search=con.createStatement();
		ResultSet rs = search.executeQuery("SELECT * FROM lock_request "+" WHERE faculty_lock=0 AND coordinator_lock=0");
		
		if(!rs.next()){
			out.print("<h4>Already Marks are Entered.</h4>");
		}else{
			
	%>
	
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
           <th>Roll No:</th>
           <th>Advance Java</th>
           <th>PHP</th>
           <th>Communication & Networking</th>
           <th>Technology Entrepreneurship </th>
           <th>Lab of JAVA and PHP</th>
        </tr>
      </thead>
    </table>
  </div>
  <form name="my-form" onsubmit="return validform()" action="addMarks.jsp" method="post">
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
                          <% 
                        String Countrow="";
         				int count = 0;
         				String rollNo = "";
                        try{
         			  		//Connection con=ConnectionProvider.getCon();
         					Statement st=con.createStatement();
         					//String qry = "SELECT count(*) FROM student";
         					//ResultSet resultSet =st.executeQuery(qry);
         					
         					String qry1 = "SELECT rollNo FROM student";
         					ResultSet resultSet1 =st.executeQuery(qry1);
         					resultSet1.getRow();
         					while(resultSet1.next()){
         					rollNo = resultSet1.getString("rollNo");
         					
         					//while(resultSet.next()){
         					//Countrow = resultSet.getString(1);
         					//count = Integer.parseInt(Countrow);
         					//out.println("Total Row :" +count);
         					int i = 1;
         					if(i<=resultSet1.getRow()){
         				%>	
         				<tr>
         				<td><label name="<%=rollNo %>"><%=rollNo %> : </label></td>
         				<td>50/<input type="text" name="Advjava<%=rollNo %>" style="width:70"></td>
         				<td>50/<input type="text" name="PHP<%=rollNo %>" style="width:70"></td>
         				<td>50/<input type="text" name="CN<%=rollNo %>" style="width:70"></td>
         				<td>50/<input type="text" name="TE<%=rollNo %>" style="width:70"></td>
         				<td>100/<input type="text" name="Lab<%=rollNo %>" style="width:70"></td>
         				</tr>
         				<% 
         						//	}
         						i++;
         						}
         					}
         				}
         				catch (Exception e){
         					e.printStackTrace();
         				}
         				%>      
        		</tbody>
    		</table>
  		</div>
               <br><br>                 
             <center>
                 <button type="submit" class="btn btn-primary">
                          Save
                 </button>
             </center>
</form>
<%
}
    }catch(Exception e){
    	out.print("Query Problem"+e);
    }
%>
</section>

</main>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html> 
  </div>

  <div id="Tokyo" class="w3-container w3-border city" style="display:none">
  
<section>
  <!--for demo wrap-->
  <h1 style="color:white;">Student Details</h1>
  <div class="tbl-header">
    
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>Roll No</th>
          <th>Student Name</th>
          <th>Gender</th>
          <th>Course</th>
          <th>Branch</th>
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
  <%
  	try{
  		Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		String qry = "SELECT * FROM student";
		ResultSet resultSet =st.executeQuery(qry);
		while(resultSet.next()){
   %>
        <tr>
          <td><%=resultSet.getString("rollNo")%></td>
          <td><%=resultSet.getString("name")%></td>
          <td><%=resultSet.getString("gender")%></td>
          <td><%=resultSet.getString("course")%></td>
          <td><%=resultSet.getString("branch")%></td>
        </tr>
  <% 
		}
  	}catch(Exception e){
  		out.print(e);
  	}
   %>
   </tbody>
    </table>
  </div>
</section>
</div>
<div id="Tokyo1" class="w3-container w3-border city" style="display:none">
   
<section>
  <!--for demo wrap-->
  <h1 style="color:white;">All Student Marks</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
           <th>Roll No:</th>
           <th>Advance Java</th>
           <th>PHP</th>
           <th>Communication & Networking</th>
           <th>Technology Entrepreneurship </th>
           <th>Lab of JAVA and PHP</th>
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
        <%
  	try{
  		Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		String qry = "SELECT * FROM marks";
		ResultSet resultSet =st.executeQuery(qry);
		while(resultSet.next()){
   %>
        <tr>
          <td><%=resultSet.getString("rollNo")%></td>
          <td><%=resultSet.getString("advJava")%></td>
          <td><%=resultSet.getString("PHP")%></td>
          <td><%=resultSet.getString("CN")%></td>
          <td><%=resultSet.getString("TE")%></td>
          <td><%=resultSet.getString("Lab")%></td>
        </tr>
  <% 
		}
  	}catch(Exception e){
  		out.print(e);
  	}
   %>
      </tbody>
    </table>
  </div>
</section>

</div>
  
</body>
</html>