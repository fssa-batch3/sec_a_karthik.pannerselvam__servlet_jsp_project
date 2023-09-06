<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

<h1>Welcome to Task Management App</h1>

<%
	String loggedInEmailString = (String) request.getAttribute("LoginUserEmail");
	if(loggedInEmailString == null) {
		response.sendRedirect("login.jsp");
	}
	
%>

<p>Logged In user: <%=loggedInEmailString%> </p>
<p><a href="addTask.jsp">Add task</a></p>
<p><a href="TaskListServelet">All Task List</a></p>
<a href="LogoutServlet">logout</a>
</body>
</html>