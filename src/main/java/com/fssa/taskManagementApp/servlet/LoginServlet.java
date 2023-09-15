package com.fssa.taskManagementApp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import services.UserService;
import services.exception.ServiceException;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userService  = new UserService();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User user = new User(email,password);
		HttpSession session = request.getSession();

		try {
			
			String logginEmail = userService.loginUser(user);
			
			if (logginEmail != null) {
				response.getWriter().println(logginEmail);
				System.out.println(logginEmail);
				session.setAttribute("LoginUserEmail", logginEmail);
				System.out.println(logginEmail);
				response.sendRedirect(request.getContextPath( ) + "/home.jsp");
	        } 
			
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("login.jsp?error="+e.getMessage());
			System.out.println(e.getMessage());
			
		}
				
	}
}