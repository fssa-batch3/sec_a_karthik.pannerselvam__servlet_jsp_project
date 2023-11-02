package com.fssa.taskManagementApp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import services.UserService;
import services.exception.ServiceException;

@WebServlet("/registerServelet")
public class RegisterServelet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegisterServelet() {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("valid_password");

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
            // Store values in request attributes for retaining in the form
            request.setAttribute("email", email);
            request.setAttribute("username", username);
            request.setAttribute("password", password);
            request.setAttribute("confirmPassword", confirmPassword);
            request.getRequestDispatcher("register.jsp?error=" + e.getMessage()).forward(request, response);
        }
    }
}
