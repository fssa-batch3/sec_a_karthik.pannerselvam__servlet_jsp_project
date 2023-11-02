
<%
String errorMessage = (String) request.getAttribute("errorMessage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Task page</title>
<jsp:include page="header.jsp"></jsp:include>
<style>
/* Define your CSS classes here */
.container {
	width: 100%;
	max-width: 600px;
	margin: 100px auto;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	font-weight: bold;
}

.form-group input[type="text"], .form-group select, .form-group input[type="email"]
	{
	width: 100%;
	padding: 12px;
	margin: 8px 0;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.form-group input[type="submit"] {
	width: 100%;
	background-color: #4CAF50;
	color: white;
	padding: 14px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.form-group input[type="submit"]:hover {
	background-color: #45a049;
}

.container {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}
</style>
</head>
<body>
	<%
	String loggedInEmail = (String) session.getAttribute("LoginUserEmail");
	if (loggedInEmail == null) {
	%>
	<h1>Login to access the page</h1>
	<a href="login.jsp" class="btn btn-success">Click me</a>
	<%
	} else {
	%>

	<div class="container">
		<h3>Add Your Task</h3>

		<%
		if (errorMessage != null) {
		%>
		<div style="color: red;">
			<%=errorMessage%>
		</div>
		<%
		}
		%>

		<form class="form-group" action="AddTask" method="POST">
			<label for="fname">Task Name</label> 
				<input type="text" id="fname"
				name="taskName" placeholder="Enter your task name.." autofocus
				required/>
			 <label for="lname">Task Description</label> 
			 	<input type="text" id="lname" name="taskDesc"
				placeholder="Enter your task description" required/> 
				<label for="sDate">Start Date</label> 
				<input type="date" id="startDate"
				name="startDate" placeholder="yyyy-mm-dd" required /> 
			<label for="eDate">End Date</label>
				 <input type="date" name="endDate"
				id="endDate" placeholder="yyyy-mm-dd" required> 
			<label for="TaskStatus">Task Status</label> 
				<select id="TaskStatuses" name="taskStatuses" required>
					<option value="PENDING">PENDING</option>
					<option value="COMPLETED">COMPLETED</option>
				</select>
			 <label for="TaskPriority">Task Priority</label> 
			 	<select id="TaskPriority" name="Taskpriority">
				 	<option value="High">High</option>
					<option value="Medium">Medium</option>
					<option value="Low">Low</option>
				</select> 
			<label for="taskassign">Assign task to:</label> 
				<input type="email"
				id="email" name="assigned_email"
				placeholder="Enter the existing assignee email"> 
				<input type="submit" value="Submit">
		</form>
	</div>
	<%
	}
	%>

	<script>
		// Getting  the current date in "yyyy-MM-dd" format
		const currentDate = new Date().toISOString().split('T')[0];

		// Setting the minimum date attribute to the current date
		const startDate = document.getElementById('startDate');
		startDate.setAttribute('min', currentDate);
		document.getElementById('endDate').setAttribute('min', currentDate);

		// Getting the date input elements
		const startDateInput = document.getElementById('startDate');
		const endDateInput = document.getElementById('endDate');

		startDate.addEventListener("change", function(e) {
			e.preventDefault();

			const str = startDate.value;
			console.log(str);

			endDateInput.setAttribute('min', str);
		});

		// Function to handle date change events
		

		// Adding  an event listener to the end date input element
		endDateInput.addEventListener('change', handleDateChange);
	</script>



</body>
</html>
