<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  background-color: white;
}

* {
  box-sizing: border-box;
}

/* Add padding to containers */
.container {
  padding: 16px;
  background-color: white;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn {
  background-color: #04AA6D;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: #f1f1f1;
  text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
<form action="registerServelet" method="post" onsubmit="return validateForm();">

  <div class="container">
    <h1>Register</h1>     
    <p>Please fill in this form to create an account.</p>
    
	<%
	String errorMessage = request.getParameter("error");
	System.out.println(errorMessage); 
	if(errorMessage != null){
		%>
		<p style="color:red;"><%=errorMessage %></p>
		<%
	}
	%>
	
 <label for="email"><b>Email</b></label>
<input type="text" placeholder="Enter Email" name="email" id="email" value="<%= (request.getParameter("email") != null) ? request.getParameter("email") : "" %>" autofocus required>

<label for="username"><b>Name</b></label>
<input type="text" placeholder="Name" name="username" id="username" value="<%= (request.getParameter("username") != null) ? request.getParameter("username") : "" %>" required>

<label for="psw"><b>Password</b></label>
<input type="password" placeholder="Enter Password" name="password" id="psw" value="<%= (request.getAttribute("password") != null) ? request.getAttribute("password") : "" %>" required>

<label for="psw-repeat"><b>Confirm Password</b></label>
<input type="password" placeholder="Re-enter Password" name="valid_password" id="psw-repeat" value="<%= (request.getAttribute("confirmPassword") != null) ? request.getAttribute("confirmPassword") : "" %>" required>

    <hr>

    <button type="submit" class="registerbtn">Register</button>
  </div>

</form>

<script>

function validateForm() {
  let password = document.getElementById("psw").value;
  let repeatPassword = document.getElementById("psw-repeat").value;

  if (password !== repeatPassword) {
    alert("Passwords doesn't match");
    return false; 
  }

  return true; 
}
</script>

</body>
</html>