package com.fssa.taskManagementApp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.Task;
import model.User;
import services.TaskService;
import services.UserService;
import services.exception.ServiceException;

@WebServlet("/AddTask")
public class AddTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/addTask.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		PrintWriter out = response.getWriter();
		Task task = new Task();
		String taskname = request.getParameter("taskName");
		String taskDesc = request.getParameter("taskDesc");
		String taskStatus = request.getParameter("taskStatuses");
		String taskPriority = request.getParameter("Taskpriority");
		String taskAssignee = request.getParameter("assigned_email");
		System.out.println( taskAssignee);
		String taskStartDate = request.getParameter("startDate");
		String taskEndDate = request.getParameter("endDate");

		// Check if the task status is "COMPLETED"
		if ("COMPLETED".equals(taskStatus)) {
			request.setAttribute("errorMessage", "Cannot create a new task with status 'COMPLETED'.");
			request.getRequestDispatcher("/addTask.jsp").forward(request, response);
			return;
		}
		  
	    UserService userService = new UserService();
	 //   User assignee = null;
	    int assign = 0;
		try {
	//		assignee = userService.getUserByEmail(taskAssignee);
	//		System.out.println(assignee.getEmail());
			assign = userService.getUserCountByEmail1(taskAssignee);
			System.out.println(assign);
		
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	    System.out.println(assign);
	    if (assign == 0) {
	        request.setAttribute("errorMessage", "Assignee email does not exist.");
	        request.getRequestDispatcher("/addTask.jsp").forward(request, response);
	        return;
	    }
		
		   
		// Getting session to get the user email
		//HttpSession session = request.getSession();
		String user_email = (String) session.getAttribute("LoginUserEmail");
		TaskService service = new TaskService();
		task.setTaskName(taskname);
		task.setTaskDesc(taskDesc);
		task.setTaskStatus(taskStatus);
		task.setTaskPriority(taskPriority);
		task.setUserEmail(user_email);
		task.setAssignee(taskAssignee);
		
		
		
		task.setStartDate(LocalDate.parse(taskStartDate));
		task.setEndDate(LocalDate.parse(taskEndDate));
		try {
			service.newTask(task);
			// Redirect to a task list page after successful task creation
			response.sendRedirect("TaskListServlet");
		} catch (ServiceException e) {
			out.println(e.getMessage());
		}
	}

}
