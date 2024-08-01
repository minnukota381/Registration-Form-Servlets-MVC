<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login Form</title>
    <style>
        body {
            background-color: cyan;
            font-family: Arial, sans-serif;
        }
        .container {
            text-align: center;
            padding: 20px;
        }
        h1 {
            color: blue;
        }
        .error {
            color: red;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            color: blue;
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="password"], select {
            padding: 5px;
            margin: 0 0 10px 0;
            width: 200px;
        }
        input[type="submit"], input[type="reset"] {
            margin: 5px;
            padding: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Login Form</h1>
        <c:if test="${not empty requestScope.ERROR}">
            <div class="error">${requestScope.ERROR}</div>
        </c:if>
        <form action="LoginController" method="post">
            <div class="form-group">
                <label for="uid">UserId</label>
                <input type="text" id="uid" name="uid" required>
            </div>
            <div class="form-group">
                <label for="pwd">Password</label>
                <input type="password" id="pwd" name="pwd" required>
            </div>
            <div class="form-group">
                <label for="utype">UserType</label>
                <select id="utype" name="utype" required>
                    <option value="">--Please choose an option--</option>
                    <option value="admin">Admin</option>
                    <option value="faculty">Faculty</option>
                    <option value="student">Student</option>
                </select>
            </div>
            <div class="form-group">
                <input type="submit" value="Log In" name="action">
                <input type="reset" value="Clear">
            </div>
            <div class="form-group">
                <input type="submit" value="New User" name="action">
                <input type="submit" value="Forgot Password" name="action">
            </div>
        </form>
    </div>
</body>
</html>
