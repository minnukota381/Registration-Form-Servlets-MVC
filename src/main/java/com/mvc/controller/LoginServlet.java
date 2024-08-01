package com.mvc.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.mvc.dao.UserDao; // Assume this DAO handles user login

public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDao userDao = new UserDao();
        String result = userDao.authenticateUser(username, password);

        if ("SUCCESS".equals(result)) {
            HttpSession session = request.getSession();
            session.setAttribute("userName", username); // Store username in session
            request.getRequestDispatcher("/authentic.jsp").forward(request, response);
        } else {
            request.setAttribute("ERROR", result);
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
        }
    }
}
