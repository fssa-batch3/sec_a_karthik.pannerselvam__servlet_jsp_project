<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
/* styles.css */
body {
	font-family: Arial, sans-serif;
	background-color: grey;

}
.container{
	display:flex;
	justify-content: space-between;
}
.float-child{
	margin-left: 5px;
}
.img-container{
	width:auto;
}
h1 {
	color: #333;
}

p {
	font-size: 16px;
}

a {
	color: #007bff;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

img {
		width: 50%;
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
	
		<div class="float-child">
			<h1>Welcome to Task Management App</h1>

			<%
			String loggedInEmailString = (String) session.getAttribute("LoginUserEmail");
			System.out.print(loggedInEmailString);
			if (loggedInEmailString == null) {
				response.sendRedirect("login.jsp");
			}
			%>

			<p>
				Logged In user:
				<%=loggedInEmailString%>
			</p>
			<p>
				<a href="addTask.jsp">Add task</a>
			</p>
			<p>
				<a href="TaskListServlet">All Task List</a>
			</p>

	</div>
	</div>
</body>
</html>