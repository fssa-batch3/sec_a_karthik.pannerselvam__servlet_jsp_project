<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="model.Task"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Task List</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
}

h2 {
	color: #333;
	text-align: center;
	margin-top: 20px;
}

table {
	width: 80%;
	margin: 20px auto;
	background-color: #fff;
	border-collapse: collapse;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 12px 15px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #333;
	color: #fff;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #ddd;
}

a {
	text-decoration: none;
	color: #007bff;
}

a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<%
	List<Task> taskList = (List<Task>) request.getAttribute("taskList");
	if (taskList == null) {
		out.println("<h2>" + "No task found" + "</h2>");
	} else {
	%>
	<table class=" table table-bordered">
		<tr>
			<th>S.No</th>
			<th>Task Name</th>
			<th>Task Description</th>
			<th>Task Status</th>
			<th>Priority</th>
			<th>Assigned To</th>
			<th>Start Date</th>
			<th>End Date</th>
			<th>Created By</th>
			<th>Actions</th>
		</tr>
		<c:forEach var="task" items="${taskList}" varStatus="loop">
			<tr>

			
				<td><c:out value="${loop.index + 1}" /></td>
				<td><c:out value="${task.taskName}" /></td>
				<td><c:out value="${task.taskDesc}" /></td>
				<td><c:out value="${task.taskStatus}" /></td>
				<td><c:out value="${task.taskPriority}" /></td>
				<td><c:out value="${task.assignee}" /></td>
				<td><c:out value="${task.startDate}" /></td>
				<td><c:out value="${task.endDate}" /></td>
				<td><c:out value="${task.userEmail }" /></td>

				<td><c:if test="${task.userEmail.trim().equals(requestScope.user_email.trim())}">
						<a href="EditTaskServlet?taskId=${task.id}"
							class="btn btn-primary" type="button">Edit Task</a>
					</c:if></td>

			</tr>
		</c:forEach>
	</table>

	<%
	}
	%>

</body>
</html>
