package com.fssa.taskManagementApp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import services.UserService;
import services.exception.ServiceException;

/**
 * Servlet implementation class RegisterServelet
 */
@WebServlet("/registerServelet")
public class RegisterServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServelet() {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

//		PrintWriter out = response.getWriter();

		User user = new User();
		user.setName(username);
		user.setEmail(email);
		user.setPassword(password);

		UserService addUser = new UserService();
		try {
			if (addUser.registerUser(user)) {
				response.sendRedirect("login.jsp");
			}
		} catch (ServiceException e) {
			response.sendRedirect("register.jsp?error=" + e.getMessage());
		}

	}

}
