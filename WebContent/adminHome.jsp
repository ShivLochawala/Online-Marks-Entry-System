
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
out.print("<center>Welcome "+name+" In HOD Side</center>"); 
%></h4>
<div class="w3-container">
  <div class="w3-bar w3-black">
  	<button class="w3-bar-item w3-button tablink w3-red" onclick="openCity(event,'London')">Lock Marks</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'Paris')">Add Faculty</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'Tokyo')">Add Coordinator</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'Tokyo1')">All Faculty Details</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'Tokyo2')">All Coordinator Details</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'Tokyo3')">All Student Details</button>
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
    <!--for demo wrap-->
  <h1 style="color:white;">Locked Marks</h1>
  <div class="tbl-header">
  <%
  try{
  	Connection con=ConnectionProvider.getCon();
	Statement st1=con.createStatement();
	String qry1 = "SELECT * FROM lock_request WHERE faculty_lock=1 AND coordinator_lock=1";
	ResultSet resultSet1 =st1.executeQuery(qry1);
	if(!resultSet1.next()){
		out.print("<h4>Sorry Still Marks are not locked</h4>");
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
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
        <%
  	try{
  		//Connection con=ConnectionProvider.getCon();
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
    <%
	}
  }catch(Exception e){
  		out.print(e);
  	}
    %>
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
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Add faculty</div>
                        <div class="card-body">
                            <form name="my-form" onsubmit="return validform()" action="addNewFaculty.jsp" method="POST">
                                <div class="form-group row">
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right">Faculty Name</label>
                                    <div class="col-md-6">
                                        <input type="text"class="form-control" name="fname" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="email_address" class="col-md-4 col-form-label text-md-right">Qualification</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="qualification" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">Gender</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="gender" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="phone_number" class="col-md-4 col-form-label text-md-right">Email Id</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="emailid" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">Mobile No</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="mobno" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="permanent_address" class="col-md-4 col-form-label text-md-right">Password</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="pass" required>
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
        <br>
    </div>

</main>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html> 
  </div>

<div id="Tokyo" class="w3-container w3-border city" style="display:none">
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
                        <div class="card-header">Add Coordinator</div>
                        <div class="card-body">
                            <form name="my-form" onsubmit="return validform()" action="addNewCoordinator.jsp" method="POST">
                                <div class="form-group row">
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right">Coordinator Name</label>
                                    <div class="col-md-6">
                                        <input type="text"class="form-control" name="fname" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="email_address" class="col-md-4 col-form-label text-md-right">Qualification</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="qualification" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">Gender</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="gender" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="phone_number" class="col-md-4 col-form-label text-md-right">Email Id</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="emailid" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">Mobile No</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="mobno" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="permanent_address" class="col-md-4 col-form-label text-md-right">Password</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="pass" required>
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
        <br>
    </div>
</main>  
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html> 

</div>
<div id="Tokyo1" class="w3-container w3-border city" style="display:none">
   
<section>
  <!--for demo wrap-->
  <h1 style="color:white;">Faculty Details</h1>
  <div class="tbl-header">
    
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>Faculty Name</th>
          <th>Qualification</th>
          <th>Gender</th>
          <th>Email ID</th>
          <th>Mobile No</th>
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
		String qry = "SELECT * FROM users WHERE is_faculty="+1;
		ResultSet resultSet =st.executeQuery(qry);
		while(resultSet.next()){
   %>
   
        <tr>
          <td><%=resultSet.getString("user_name")%></td>
          <td><%=resultSet.getString("qualification")%></td>
          <td><%=resultSet.getString("gender")%></td>
          <td><%=resultSet.getString("email_id")%></td>
          <td><%=resultSet.getString("mobile_no")%></td>
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

<div id="Tokyo2" class="w3-container w3-border city" style="display:none">
   
<section>
  <!--for demo wrap-->
  <h1 style="color:white;">Coordinator Details</h1>
  <div class="tbl-header">
    
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>Coordinator Name</th>
          <th>Qualification</th>
          <th>Gender</th>
          <th>Email ID</th>
          <th>Mobile No</th>
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
		String qry = "SELECT * FROM users WHERE is_coordinator="+1;
		ResultSet resultSet =st.executeQuery(qry);
		while(resultSet.next()){
   %>
  
        <tr>
          <td><%=resultSet.getString("user_name")%></td>
          <td><%=resultSet.getString("qualification")%></td>
          <td><%=resultSet.getString("gender")%></td>
          <td><%=resultSet.getString("email_id")%></td>
          <td><%=resultSet.getString("mobile_no")%></td>
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
<div id="Tokyo3" class="w3-container w3-border city" style="display:none">
   
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
</body>
</html>