<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Task page</title>
<style>

input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
</head>
<body>
	<!--<jsp:include page="header.jsp"></jsp:include> -->

<h3>Add Your Task</h3>

<div>
  <form action="AddTask" method="post">
    <label for="fname">Task Name</label>
    <input type="text" id="fname" name="taskName" placeholder=" Enter your task name.." autofocus required>

    <label for="lname">Task Description</label>
    <input type="text" id="lname" name="taskDesc"  placeholder="Enter your task decscription" required>

    <label for="TaskStatus">Task Status</label>
    <select id="TaskStatuses" name="taskStatuses" required>
      <option value="COMPLETED">COMPLETED</option>
      <option value="PENDING">PENDING</option>
    </select>
    
    
  <label for="TaskPriority">Task Status</label>
    <select id="TaskPriority" name="Taskpriority">
      <option value="High">High</option>
      <option value="Medium">Medium</option>
      <option value="Low">Low</option>
    </select>
    
    <label for="taskassign">Assign task to:</label>
    <input type="email" id="email" name="assigned_email" placeholder="Enter the existing assignee email">
    
    <input type="submit" value="Submit">
  </form>
</div>

</body>
</html>