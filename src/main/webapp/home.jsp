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
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
}

h1 {
    color: #333;
}

p {
    font-size: 16px;
}

.container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

a {
    color: #007bff;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}

</style>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>

    <div class="container">
        <h1>Welcome to Task Management App</h1>

        <%
            String loggedInEmailString = (String) session.getAttribute("LoginUserEmail");
            System.out.print(loggedInEmailString);
            if(loggedInEmailString == null) {
                response.sendRedirect("login.jsp");
            }
        %>

        <p>Logged In user: <%=loggedInEmailString%> </p>
        <p><a href="addTask.jsp">Add task</a></p>
        <p><a href="TaskListServlet">All Task List</a></p>
    </div>
</body>
</html>