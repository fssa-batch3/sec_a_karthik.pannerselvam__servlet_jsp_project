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
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<table class=" table table-bordered">
    <tr>
    	<th>S.No</th>
        <th>Task Name</th>
        <th>Task Description</th>
        <th>Task Status</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="task" items="${taskList}" varStatus="loop">
        <tr>
        	<td><c:out value="${loop.index + 1}" /></td>
            <td><c:out value="${task.taskName}" /></td>
            <td><c:out value="${task.taskDesc}" /></td>
            <td><c:out value="${task.taskStatus}" /></td>
            <td><a href="">Edit Task</a><br><a href="">Delete Task</a></td>
  	
        </tr>
    </c:forEach>
</table>

</body>
</html>
