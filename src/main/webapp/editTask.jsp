<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="model.Task" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="editTask.css">
        <jsp:include page="header.jsp"></jsp:include>
    <title>Edit your Task</title>
</head>
<body>
    <form action ="ViewTaskServlet?taskId=${task.id}" Method="post" >
        <div class="container1">
      
              <label for="email"><b>Task Name</b></label>
            <input type="text" name="edited-taskName" value="${task.taskName}" required>
            
          <label for="psw"><b>Task Description</b></label>
          <input type="text"  name="edited-desc" value="${task.taskDesc}" required>
          
          <label for="status"><b>Task Status</b></label>
          <input type="text"  name="edited-status" value="${task.taskStatus}"  required>
           <label for="status"><b>Task Status</b></label>
          <input type="text"  name="edited-priority" value="${task.taskPriority}"  required>
          
      
          <div class="clearfix">
      
            <button type="submit" class="btn1">Save Changes</button>
          </div>
        </div>
      </form>

</body>
</html>