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
    <form action ="EditTaskServlet?taskId=${task.id}" method="post" >
        <div class="container1">
      <!--  	<label for="taskid"><b>Task Id</b></label>
      	<input type="number" value="${task.id}" name="taskId" disabled>   -->          
      	
      	 <label for="email"><b>Task Name</b></label>
            <input type="text" name="edited-taskName" value="${task.taskName}" required>
            
          <label for="psw"><b>Task Description</b></label>
          <input type="text"  name="edited-desc" value="${task.taskDesc}" required>
          
          
           <label for="priority"><b>Task Priority</b></label>
           
           	<select name="edited-priority" required>
           	<option value="High" ${task.taskPriority=='High'?'selected':''} >High</option>
           	<option value="Medium" ${task.taskPriority=='Medium'?'selected':''}>Medium</option>
          	 <option value="low" ${task.taskPriority=='Low'?'selected':''}>Low</option>
           </select>
           <br>
          
          <label for="status"><b>Task Status</b></label>
          <select name="edited-status" required>
          		<option value="PENDING"${task.taskStatus=='PENDING'? 'selected':'' }>PENDING</option>
          		<option value="COMPLETED"${task.taskStatus=='COMPLETED'? 'selected':'' }>COMPLETED</option>
          </select>
      
          <div class="clearfix">
      
            <button type="submit" class="btn1">Save Changes</button>
          </div>
        </div>
      </form>

</body>
</html>