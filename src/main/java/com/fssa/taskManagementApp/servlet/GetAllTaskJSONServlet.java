package com.fssa.taskManagementApp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import model.Task;
import services.TaskService;
import services.exception.ServiceException;

/**
 * Servlet implementation class GetAllTaskJSONServlet
 */
@WebServlet("/GetAllTaskJSONServlet")
public class GetAllTaskJSONServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			List<Task> tasks = new TaskService().getAllTasks("");
			
			JSONArray accountsJSonArray = new JSONArray(tasks);
			PrintWriter out = response.getWriter();
			out.println(accountsJSonArray.toString());
			out.flush();

//			request.setAttribute("taskList", tasks);
//			RequestDispatcher getRequest = request.getRequestDispatcher("listAllTask.jsp");
//			getRequest.forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	}
    
}
