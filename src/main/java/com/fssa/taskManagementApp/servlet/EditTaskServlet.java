package com.fssa.taskManagementApp.servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TaskDao;
import dao.exception.DAOException;
import model.Task;

/**
 * Servlet implementation class ViewTaskServlet
 */
@WebServlet("/EditTaskServlet")
public class EditTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int taskId = Integer.parseInt(request.getParameter("taskId"));

		TaskDao taskDao = new TaskDao();
		Task task = null;
		try {
			task = taskDao.getTaskById(taskId);
			RequestDispatcher patcher = request.getRequestDispatcher("/editTask.jsp");
			request.setAttribute("task", task);
			patcher.forward(request, response);
		} catch (DAOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();

		String taskname = req.getParameter("edited-taskName");
		String taskDec = req.getParameter("edited-desc");
		String taskStatus = req.getParameter("edited-status");
		String taskPriority = req.getParameter("edited-priority");
		int taskId = Integer.parseInt(req.getParameter("taskId"));
		String taskEmail = (String) session.getAttribute("LoginUserEmail");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");

//		System.out.println(taskEmail);

		Task task = new Task();

		task.setId(taskId);
		task.setTaskName(taskname);
		task.setTaskDesc(taskDec);
		task.setTaskStatus(taskStatus);
		task.setTaskPriority(taskPriority);
		task.setUserEmail(taskEmail);
		task.setStartDate(LocalDate.parse(startDate));
		task.setEndDate(LocalDate.parse(endDate));
		System.out.println(task);
		try {
			TaskDao taskdao = new TaskDao();
			taskdao.updateTask(task);
			resp.sendRedirect("TaskListServlet");
		} catch (DAOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
