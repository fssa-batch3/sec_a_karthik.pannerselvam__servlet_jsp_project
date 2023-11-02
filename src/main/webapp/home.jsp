<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<style>
/* styles.css */
body {
	font-family: Arial, sans-ser\if;
	background-color: grey;
}

.container {
	display: flex;
	align-items: center; /* Vertically center align the content */
}

.img-container {
	width: 50%; /* Adjust the width as needed */
	padding: 10px; /* Add some spacing around the image */
}

.text-container {
	flex: 1; /* Allow the text container to take up the remaining space */
	padding: 10px; /* Add some spacing around the text */
}

.page-title {
	/*  font-size: 72px;
    -webkit-text-fill-color: transparent;
    background: linear-gradient(rgb(25, 76, 51), rgb(187, 187, 187)) text;
 /* Increase the font size for the heading */
	font-size: 72px;
	background: -webkit-linear-gradient(rgb(25, 76, 51), rgb(187, 187, 187));
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

p {
	font-size: 16px;
	margin: 0; /* Remove default margins */
}

.btn btn-success {
	color: #007bff;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

img {
	max-width: 100%; /* Ensure the image doesn't overflow its container */
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<div class="img-container">
			<img src="<%=request.getContextPath()%>/Images/Iconhp.png"
				alt="illustration" border="0">
		</div>

		<div class="text-container">
			<h1 class="page-title">Effortlessly Simplify Your Daily Tasks</h1>
			<h3>Create Your own tasks now!</h3>
			<%
			String loggedInEmail = (String) session.getAttribute("LoginUserEmail");
			if (loggedInEmail == null) {
			%>
			<a href="login.jsp" class="btn btn-success">Click me</a>
			<%
			} else {
			%>
			<a href="addTask.jsp" class="btn btn-success">Click me</a>
			<%
			}
			%>

		</div>
	</div>


</body>
</html>
