<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');
        
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            padding: 0;
        }
        .login-container {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 90%;
            margin: auto;
        }
        .login-title {
            color: #333;
            margin-bottom: 30px;
            font-weight: 600;
            text-align: center;
        }
        .form-control {
            border-radius: 50px;
            padding: 12px 20px;
            border: none;
            background-color: #f0f0f0;
            transition: all 0.3s ease;
        }
        .form-control:focus {
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.25);
            background-color: #fff;
        }
        .input-group-text {
            border-radius: 50px;
            border: none;
            background-color: #f0f0f0;
        }
        .btn-login {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 50px;
            padding: 12px 20px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        .btn-clear {
            background-color: #f0f0f0;
            color: #333;
            border: none;
            border-radius: 50px;
            padding: 12px 20px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-clear:hover {
            background-color: #e0e0e0;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2 class="login-title">Welcome Back</h2>
        <% if(request.getAttribute("ERROR") != null) { %>
            <div class="alert alert-danger" role="alert">
                ${requestScope.ERROR}
            </div>
        <% } %>
        <form action="LoginServlet" method="post">
            <div class="mb-4">
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                    <input type="text" class="form-control" id="username" name="username" placeholder="Username" required>
                </div>
            </div>
            <div class="mb-4">
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                </div>
            </div>
            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-primary btn-login">Login</button>
                <button type="reset" class="btn btn-clear">Clear</button>
                <button type="button" class="btn btn-login" onclick="window.location.href='Register.jsp'">Go to Register</button>
            </div>
        </form>
    </div>
</body>
</html>