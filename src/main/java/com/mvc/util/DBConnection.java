package com.mvc.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/customers?useSSL=false"; // MySQL URL with SSL disabled
    private static final String USERNAME = "root"; // MySQL username
    private static final String PASSWORD = "12345"; // MySQL password

    // Load the MySQL JDBC driver
    static {
        try {
            // Register the JDBC driver (not strictly necessary with recent versions)
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC driver not found.", e);
        }
    }

    public static Connection createConnection() {
        Connection con = null;
        try {
            con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            System.out.println("Database connection established: " + con);
        } catch (SQLException e) {
            System.err.println("Database connection error: " + e.getMessage());
            e.printStackTrace();
        }
        return con;
    }
}
