package com.mvc.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.mvc.bean.RegisterBean;
import com.mvc.dao.RegisterDao;

public class RegisterServlet extends HttpServlet {

    public RegisterServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Copying all the input parameters into local variables
        String fullName = request.getParameter("fullname");
        String email = request.getParameter("email");
        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        // Create a RegisterBean object and set the user data
        RegisterBean registerBean = new RegisterBean();
        registerBean.setFullName(fullName);
        registerBean.setEmail(email);
        registerBean.setUserName(userName);
        registerBean.setPassword(password);

        // Create RegisterDao object to handle database operations
        RegisterDao registerDao = new RegisterDao();
        
        try {
            // Attempt to register the user
            String userRegistered = registerDao.registerUser(registerBean);

            if ("SUCCESS".equals(userRegistered)) {
                // On success, forward to the home page
                request.getRequestDispatcher("/Home.jsp").forward(request, response);
            } else {
                // On failure, set the error message and forward to registration page
                request.setAttribute("errMessage", userRegistered);
                request.getRequestDispatcher("/Register.jsp").forward(request, response);
            }
        } catch (Exception e) {
            // Handle exceptions and forward to an error page
            e.printStackTrace();
            request.setAttribute("errMessage", "An unexpected error occurred. Please try again.");
            request.getRequestDispatcher("/Register.jsp").forward(request, response);
        }
    }
}
