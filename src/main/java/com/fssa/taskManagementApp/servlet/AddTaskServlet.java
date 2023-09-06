package com.fssa.taskManagementApp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

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
 * @karthik
 */

/**
 * Servlet implementation class AddTask
 */
@WebServlet("/AddTask")
public class AddTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		Task task = new Task();
		String taskname = request.getParameter("taskName");
		String taskDesc = request.getParameter("taskDesc");
		String taskStatus = request.getParameter("taskStatuses");
		//Getting session to get the user email
		HttpSession session = request.getSession();
		String user_email = (String) session.getAttribute("LoginUserEmail");
		TaskService service = new TaskService();
		task.setTaskName(taskname);
		task.setTaskDesc(taskDesc);
		task.setTaskStatus(taskStatus);
		task.setUserEmail(user_email);
		System.out.println(user_email);
		try {
			service.newTask(task);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("listAllTask.jsp");
			requestDispatcher.forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
			out.println(e.getMessage());
		}
	}

}
