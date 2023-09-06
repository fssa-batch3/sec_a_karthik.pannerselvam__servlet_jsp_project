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
		String valid_password = request.getParameter("valid_password");

		PrintWriter out = response.getWriter();
		if (email == null || "".equals(email)) {
			out.println("Invalid Email");
		}

		else if (password == null || "".equals(password) || password.length() < 6) {
			out.println("Invalid password");
		} else if (username == null) {
			out.println("Username is not valid");
		} else if (!password.equals(valid_password)) {
			out.println("Password is not matched to the confirm password!");
		} else {
			out.println("Email, password and username is valid");
			response.sendRedirect("login.jsp");
		}

		User user = new User();
		user.setName(username);
		user.setEmail(email);
		user.setPassword(password);

		UserService addUser = new UserService();
		try {
			addUser.registerUser(user);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
