<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');
        
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .register-container {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
        }
        .register-title {
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
            box-shadow: 0 0 0 3px rgba(37, 117, 252, 0.25);
            background-color: #fff;
        }
        .btn-register {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            border: none;
            border-radius: 50px;
            padding: 12px 20px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        .btn-reset {
            background-color: #f0f0f0;
            color: #333;
            border: none;
            border-radius: 50px;
            padding: 12px 20px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-reset:hover {
            background-color: #e0e0e0;
        }
        .btn-login {
            background-color: #007bff;
            border: none;
            border-radius: 50px;
            padding: 12px 20px;
            color: white;
            font-weight: 600;
            transition: all 0.3s ease;
            display: block;
            margin: 20px auto;
        }
        .btn-login:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2 class="register-title">Registration Form</h2>
        <form name="form" action="RegisterServlet" method="post" onsubmit="return validate()">
            <div class="mb-3">
                <input type="text" class="form-control" name="fullname" placeholder="Full Name" required>
            </div>
            <div class="mb-3">
                <input type="email" class="form-control" name="email" placeholder="Email" required>
            </div>
            <div class="mb-3">
                <input type="text" class="form-control" name="username" placeholder="Username" required>
            </div>
            <div class="mb-3">
                <input type="password" class="form-control" name="password" placeholder="Password" minlength="6" required>
            </div>
            <div class="mb-3">
                <input type="password" class="form-control" name="conpassword" placeholder="Confirm Password" minlength="6" required>
            </div>
            <div class="mb-3 text-danger">
                <%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%>
            </div>
            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-primary btn-register">Register</button>
                <button type="reset" class="btn btn-reset">Reset</button>
            </div>
            <button type="button" class="btn btn-login" onclick="window.location.href='Login.jsp'">Go to Login</button>
        </form>
    </div>

    <script>
        function validate() {
            var fullname = document.form.fullname.value;
            var email = document.form.email.value;
            var username = document.form.username.value;
            var password = document.form.password.value;
            var conpassword = document.form.conpassword.value;

            if (!fullname) {
                alert("Full Name can't be blank");
                return false;
            }
            else if (!email || !/^\S+@\S+\.\S+$/.test(email)) {
                alert("Please enter a valid email address");
                return false;
            }
            else if (!username) {
                alert("Username can't be blank");
                return false;
            }
            else if (password.length < 6) {
                alert("Password must be at least 6 characters long.");
                return false;
            }
            else if (password !== conpassword) {
                alert("Confirm Password should match with the Password");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
