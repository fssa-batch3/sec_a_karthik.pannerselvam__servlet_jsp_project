package com.fssa.taskManagementApp.servlet;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Task;
import services.TaskService;
import services.exception.ServiceException;

/**
 * Servlet implementation class TaskListServelet
 */
@WebServlet("/TaskListServlet")
public class TaskListServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Task> tasks = null;
		try {
		 	
			HttpSession session = request.getSession();
			String user_email = (String) session.getAttribute("LoginUserEmail");
			
			request.setAttribute("user_email", user_email);
			tasks = new TaskService().getAllTasks(user_email);
			request.setAttribute("taskList", tasks);
			RequestDispatcher getRequest = request.getRequestDispatcher("listAllTask.jsp");
			getRequest.forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
			tasks = null;
		}
	}
    
}
