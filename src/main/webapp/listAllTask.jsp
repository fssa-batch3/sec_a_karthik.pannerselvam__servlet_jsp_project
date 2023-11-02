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
/* ... Your existing CSS styles ... */
</style>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<%
String loggedInEmail = (String) session.getAttribute("LoginUserEmail");
if (loggedInEmail == null) {
%>
<h1>Login/Register to access the page</h1>
<a href="login.jsp" class="btn btn-success">Login</a>
<a href="register.jsp" class="btn btn-success">Register</a>
<%
} else {
%>

<%
List<Task> taskList = (List<Task>) request.getAttribute("taskList");





if (taskList.isEmpty()) {
    out.println("<h2>There is no pending task</h2>");
} else {
%>
<h2>Pending Tasks</h2>

<table class="table table-bordered">
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
        <c:if test="${task.taskStatus != 'COMPLETED'}">
            <tr>
                <td><c:out value="${loop.index + 1}" /></td>
                <td><c:out value="${task.taskName}" /></td>
                <td><c:out value="${task.taskDesc}" /></td>
                <td><c:out value="${task.taskStatus}" /></td>
                <td><c:out value="${task.taskPriority}" /></td>
                <td><c:out value="${task.assignee}" /></td>
                <td><c:out value="${task.startDate}" /></td>
                <td><c:out value="${task.endDate}" /></td>
                <td><c:out value="${task.userEmail}" /></td>
                <td>
                    <c:if test="${task.userEmail.trim().equals(requestScope.user_email.trim())}">
                        <a href="EditTaskServlet?taskId=${task.id}" class="btn btn-primary" type="button">Edit Task</a>
                    </c:if>
                </td>
            </tr>
        </c:if>
    </c:forEach>
</table>

<!-- Table for completed tasks -->

<h2>Completed Tasks</h2>

<table class="table table-bordered">
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
        <c:if test="${task.taskStatus == 'COMPLETED'}">
            <tr>
                <td><c:out value="${loop.index + 1}" /></td>
                <td><c:out value="${task.taskName}" /></td>
                <td><c:out value="${task.taskDesc}" /></td>
                <td><c:out value="${task.taskStatus}" /></td>
                <td><c:out value="${task.taskPriority}" /></td>
                <td><c:out value="${task.assignee}" /></td>
                <td><c:out value="${task.startDate}" /></td>
                <td><c:out value="${task.endDate}" /></td>
                <td><c:out value="${task.userEmail}" /></td>
                <td>
                <c:if test="${task.userEmail.trim().equals(requestScope.user_email.trim())}">
                        <a href="EditTaskServlet?taskId=${task.id}" class="btn btn-primary" type="button">Change Status</a>
                    </c:if>
                </td>	
            </tr>
        </c:if>
    </c:forEach>
</table>
<%
}
%>
<%
}
%>

</body>
</html>
