 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login page</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
}

.whole-container {
	position: relative;
	top: 168px;
	left: 30%; width : 29rem;
	margin-top: 100px;
	margin-left: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 29rem;
}

h2 {
	text-align: center;
}

label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

input[type="email"], input[type="password"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

button[type="submit"] {
	background-color: #007bff;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

button[type="submit"]:hover {
	background-color: #0056b3;
}
</style>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<%
	String errorMessage = request.getParameter("error");
	if (errorMessage != null) {
		out.println("<p>" + errorMessage + "</p>");
	}
	%>
	<div class="whole-container">
		<h2>Login Form</h2>
		<form action="login" method="POST">
			<label>Email:</label> <input type="email" name="email"
				placeholder="Enter email" required autofocus><br> <label>Password:</label>
			<input type="password" name="password" placeholder="Enter password" required><br>
			<button type="submit">Submit</button>
		</form>
	</div>
</body>
</html>