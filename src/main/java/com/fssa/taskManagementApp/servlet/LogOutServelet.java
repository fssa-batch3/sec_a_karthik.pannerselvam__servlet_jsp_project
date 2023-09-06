package com.fssa.taskManagementApp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutServlet") // Corrected annotation placement
public class LogOutServelet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session != null) {
            session.removeAttribute("loggedInEmail");
            System.out.println("Existing Session ID: " + session.getId());

            // invalidate removes all the session attributes
            session.invalidate();
        } else {
            System.out.println("No Session Exists");
        }

        // Redirecting to the login page since we have logged out
        response.sendRedirect("login.jsp");
    }
}
