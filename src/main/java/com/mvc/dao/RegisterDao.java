package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mvc.bean.RegisterBean;
import com.mvc.util.DBConnection;

public class RegisterDao {

    // Method to register a new user
    public String registerUser(RegisterBean registerBean) {
        String fullName = registerBean.getFullName();
        String email = registerBean.getEmail();
        String userName = registerBean.getUserName();
        String password = registerBean.getPassword();

        Connection con = null;
        PreparedStatement preparedStatement = null;
        try {
            con = DBConnection.createConnection();
            String query = "INSERT INTO users(SlNo, fullName, Email, userName, password) VALUES (NULL, ?, ?, ?, ?)";
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, fullName);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, userName);
            preparedStatement.setString(4, password);

            int result = preparedStatement.executeUpdate();

            if (result != 0) {
                return "SUCCESS";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "Database error: " + e.getMessage();
        } finally {
            // Ensure resources are closed
            try {
                if (preparedStatement != null) {
					preparedStatement.close();
				}
                if (con != null) {
					con.close();
				}
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return "Oops.. Something went wrong there..!"; // On failure, send a message from here.
    }

    // Method to check if a user exists
    public boolean checkUserExists(String username) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        try {
            con = DBConnection.createConnection();
            String query = "SELECT COUNT(*) FROM users WHERE userName = ?";
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, username);
            rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
					rs.close();
				}
                if (preparedStatement != null) {
					preparedStatement.close();
				}
                if (con != null) {
					con.close();
				}
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    // Method to update password
    public boolean updatePassword(String username, String newPassword) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        try {
            con = DBConnection.createConnection();
            String query = "UPDATE users SET password = ? WHERE userName = ?";
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, newPassword);
            preparedStatement.setString(2, username);
            int result = preparedStatement.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) {
					preparedStatement.close();
				}
                if (con != null) {
					con.close();
				}
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }
}
