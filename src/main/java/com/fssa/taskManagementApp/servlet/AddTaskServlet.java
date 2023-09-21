package com.fssa.taskManagementApp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Task;
import services.TaskService;
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
        PrintWriter out = response.getWriter();
        Task task = new Task();
        String taskname = request.getParameter("taskName");
        String taskDesc = request.getParameter("taskDesc");
        String taskStatus = request.getParameter("taskStatuses");
        String taskPriority = request.getParameter("Taskpriority");
        String taskAssignee = request.getParameter("assigned_email");

        // Check if the task status is "COMPLETED"
        if ("COMPLETED".equals(taskStatus)) {
            request.setAttribute("errorMessage", "Cannot create a new task with status 'COMPLETED'.");
            request.getRequestDispatcher("/addTask.jsp").forward(request, response);
            return; 
        }

        // Getting session to get the user email
        HttpSession session = request.getSession();
        String user_email = (String) session.getAttribute("LoginUserEmail");
        TaskService service = new TaskService();
        task.setTaskName(taskname);
        task.setTaskDesc(taskDesc);
        task.setTaskStatus(taskStatus);
        task.setTaskPriority(taskPriority);
        task.setUserEmail(user_email);
        task.setAssignee(taskAssignee);
        try {
            service.newTask(task);
            // Redirect to a task list page after successful task creation
            response.sendRedirect("TaskListServlet");
        } catch (ServiceException e) {
            out.println(e.getMessage());
        }
    }

}
